#!/usr/bin/env python3

import os
import time
from subprocess import CompletedProcess


import re
import shutil
import subprocess
import shlex
from pathlib import Path


ROOT_DIR = Path()

unused_packages=[
"eyg.run",
# "gleam_analysis",
# "gleam_interpreter",
# "gleam_ir",
"hub",
"morph",
"overlay_public",
"overlay_web",
"pal",
"topological",
# "touch_grass",
"website",
    ]


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


def clean(package: Path) -> None:
    _ = _run_command("gleam", "clean", cwd=package)

    build_dir = package / "build"
    _log(f"Deleting build dir `{build_dir.absolute()}`.", package)
    shutil.rmtree(build_dir, ignore_errors=True)


def update_deps(package: Path) -> None:
    deps =  [
        ("eyg_analysis", "gleam_analysis"),
        ("eyg_interpreter", "gleam_interpreter"),
        ("eyg_ir", "gleam_ir"),
        ("eyg_parser", "gleam_parser"),
        ("touch_grass", "touch_grass"),
        ("pal", "pal"),
        ("overlay_web", "overlay_web"),
    ]

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

    if gleam_toml != gleam_toml_original  or (
        package.name == "overlay_public"  # Special case for overlay_public which needs updating
    ):
        _ = gleam_toml_path.write_text(gleam_toml)
        _log("Deleting manifest.", package)
        (package / "manifest.toml").unlink()


def main() -> None:
    # Remove packages not required for building CLI
    for unused_package in unused_packages:
        shutil.rmtree(Path()/"packages"/unused_package)

    packages = [p.parent for p in (Path() / "packages").glob("*/gleam.toml")]

    for package in packages:
        clean(package)

    for package in packages:
        update_deps(package)

    for package in packages:
        _ = _run_command("gleam", "deps", "download", cwd=package)
        time.sleep(10)  # Avoid hitting Hex rate limits

    for package in packages:
        _ = _run_command("gleam2nix", cwd=package)

    for package in packages:
        _log("Deleting tests.", package)
        shutil.rmtree(package / "test", ignore_errors=True)

    print("Done!")


if __name__ == "__main__":
    main()
