#!/usr/bin/env python3

import re
import shlex
import shutil
import subprocess
import time
from collections.abc import Callable
from pathlib import Path
from subprocess import CompletedProcess

ROOT_DIR = Path()
USED_PACKAGE_NAMES = {
    "gleam_analysis",
    "gleam_cli",
    "gleam_compiler",
    "gleam_hub",
    "gleam_interpreter",
    "gleam_ir",
    "gleam_parser",
    "gleam_x",
    "loam",
    "overlay_llm",
    "overlay",
    "plinthx",
    "touch_grass",
    "untethered",
}


def _log(message: str, /, package: Path) -> None:
    print(f"{package.relative_to(ROOT_DIR)}: {message}")


def _run_command(cmd: str, /, *args: str, cwd: Path) -> CompletedProcess[str]:
    full_command = (cmd, *args)
    _log("Running `" + shlex.join(full_command) + "`", cwd)

    result = subprocess.run(full_command, capture_output=True, cwd=cwd, text=True)
    if result.returncode == 0:
        return result
    else:
        msg = f"Error while running command `{shlex.join(full_command)}` in directory `{cwd}`:\n{result.stderr}"
        raise RuntimeError(msg)


def _retry[T](f: Callable[[], T], /, n: int, package: Path) -> T:
    i = 0
    while True:
        try:
            return f()
        except Exception as err:
            i += 1
            if i == n:
                _log(f"Failed {i} times, stopping.", package=package)
                raise err
            else:
                _log(f"Failed {i} times, retrying.", package=package)
                time.sleep(10 * i)


def clean(package: Path) -> None:
    _ = _run_command("gleam", "clean", cwd=package)

    build_dir = package / "build"
    _log(f"Deleting build dir `{build_dir.absolute()}`.", package)
    shutil.rmtree(build_dir, ignore_errors=True)


def update_deps(package: Path, deps: list[tuple[str, str]]) -> None:
    gleam_toml_path = package / "gleam.toml"
    gleam_toml_original = gleam_toml_path.read_text()

    gleam_toml = gleam_toml_original
    for dep_name, dep_folder in deps:
        if len(re.findall(rf"^{dep_name} = .*$", gleam_toml, flags=re.MULTILINE)) > 0:
            _log(f"Updating {dep_name}.", package)
            gleam_toml = re.sub(
                rf"^{dep_name} = .*$",
                f'{dep_name} = {{ path = "../{dep_folder}" }}',
                gleam_toml,
                flags=re.MULTILINE,
            )

    # Use this soft fork of gbor to get v2.0.2 of the ieee_float package which works with Nix
    gleam_toml = gleam_toml.replace(
        'gbor = ">= 1.0.0 and < 2.0.0"',
        'gbor = { git = "https://github.com/hasnep/gbor.git", ref = "main" }',
    )

    if gleam_toml != gleam_toml_original:
        _ = gleam_toml_path.write_text(gleam_toml)
        _log("Deleting manifest.", package)
        (package / "manifest.toml").unlink()


def main() -> None:
    all_packages = {p[0] for p in (ROOT_DIR / "packages").walk()}
    unused_package_names = {p.name for p in all_packages} - set(USED_PACKAGE_NAMES)
    used_packages = {
        ROOT_DIR / "packages" / package_name for package_name in USED_PACKAGE_NAMES
    }

    # Remove packages not required for building CLI
    for unused_package_name in unused_package_names:
        unused_package = Path() / "packages" / unused_package_name
        _log("Deleting unused package", package=unused_package)
        shutil.rmtree(unused_package, ignore_errors=True)

    for package in used_packages:
        clean(package)

    deps_to_update = [(p.name.replace("gleam_", "eyg_"), p.name) for p in used_packages]
    for package in used_packages:
        update_deps(package, deps_to_update)

    for package in used_packages:
        _ = _retry(
            lambda: _run_command("gleam", "deps", "download", cwd=package),
            n=3,
            package=package,
        )
        time.sleep(15)  # Avoid hitting Hex rate limits

    for package in used_packages:
        _ = _run_command("gleam2nix", cwd=package)

    for package in used_packages:
        _log("Deleting tests.", package)
        shutil.rmtree(package / "test", ignore_errors=True)

    print("Done!")


if __name__ == "__main__":
    main()
