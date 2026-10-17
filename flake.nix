{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    gleam2nix = {
      url = "https://git.isincredibly.gay/srxl/gleam2nix/archive/v1.2.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];

      perSystem =
        {
          inputs',
          self',
          pkgs,
          ...
        }:
        {
          packages = {
            default = self'.packages.eyg;

            eyg = inputs.gleam2nix.lib.${pkgs.stdenv.hostPlatform.system}.buildGleamApplication (finalAttrs: {
              pname = "eyg";
              version = "0.0.11";
              src = ./packages/gleam_cli;
              gleamNix = import ./packages/gleam_cli/gleam.nix;
              target = "javascript";
              jsRuntime = pkgs.bun;
              postInstall = ''
                echo 'import { main } from "./eyg/eyg_cli.mjs"; main();' > $out/lib/gleam_entrypoint.mjs
              '';
            });

            git-fetch-file = pkgs.buildGoModule (finalAttrs: {
              pname = "git-fetch-file";
              version = "2.1.2";

              src = pkgs.fetchFromGitHub {
                owner = "andrewmcwattersandco";
                repo = "git-fetch-file";
                tag = "v${finalAttrs.version}";
                hash = "sha256-7/737dvV/CSG+RJwcIKeOYeAfchM0zK9ktEmJgD34AE=";
              };

              vendorHash = "sha256-JrkwOCf0V8IucY/rwGECF2QWNTaC1YT+M0VlEuEXGUg=";

              ldflags = [ "-s" ];

              meta = {
                license = pkgs.lib.licenses.gpl2Only;
                mainProgram = "git-fetch-file";
              };
            });
          };

          apps = {
            default = self'.apps.eyg;
            eyg = {
              type = "app";
              program = pkgs.lib.getExe self'.packages.eyg;
            };
          };

          devShells.default = pkgs.mkShell {
            packages = [
              inputs'.gleam2nix.packages.gleam2nix
              self'.packages.git-fetch-file
            ];
          };

          formatter = pkgs.nixfmt-tree;
        };
    };
}
