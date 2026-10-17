{
  description = "Flake for building toml-schema rust implementation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/c27cdad491a991b11ed731760aa2ef8db0cb0410"; # rustc 1.91.1
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
  in {
    packages.${system}.tosd = pkgs.rustPlatform.buildRustPackage (finalAttrs: rec {
      pname = "tosd";
      version = "rust-v1.0.0-rc.2";

      src = pkgs.fetchFromGitHub {
        owner = "brunoborges";
        repo = "toml-schema";
        tag = finalAttrs.version;
        sha256 = "sha256-uYOFkWQkf0Fi05RitkAAPVGJG3VSngNscMEhOTZx+0k=";
      };

      sourceRoot = "${src.name}/reference-implementations/rust";

      cargoHash = "sha256-VZXe9D6RMqtLh1eIRmsxVl5tFa8G/k/FW87NrYjLJtA=";
    });
  };
}
