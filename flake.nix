{
  description = "Flake for building toml-schema rust implementation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/26.05";
    cargo-nixpkgs.url = "github:NixOS/nixpkgs/c27cdad491a991b11ed731760aa2ef8db0cb0410";
  };

  outputs = {nixpkgs, cargo-nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    cargo-pkgs = import cargo-nixpkgs { inherit system; };
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        cargo-pkgs.cargo
      ];
    };
  };
}
