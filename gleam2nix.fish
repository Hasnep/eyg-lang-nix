#!/usr/bin/env fish

set packages (dirname (fd gleam.toml))

for package in $packages
    echo "Preparing $package..."
    pushd "$package"

    echo "  - Modifying dependencies..."
    for dep in analysis interpreter ir parser
        echo "    - Updating eyg_$dep..."
        sd "^eyg_$dep = .*\$" "eyg_$dep = { path = \"../gleam_$dep\" }" ./gleam.toml
        gleam update "eyg_$dep"
        sleep 3 # Avoid hitting Hex rate limits
    end

    echo "  - Running gleam2nix..."
    gleam2nix
    popd

    echo "  - Deleting tests..."
    rm -rf "$package/test"
end
