{
  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.systems.follows = "systems";
    };
    git-hooks = {
      url = "github:cachix/git-hooks.nix";
      inputs.gitignore.follows = "gitignore";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    gitignore = {
      url = "github:hercules-ci/gitignore.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixpkgs.follows = "nixvim/nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.flake-parts.follows = "flake-parts";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    systems = {
      url = "github:nix-systems/default";
    };
  };

  outputs =
    inputs@{
      self,
      flake-parts,
      treefmt-nix,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-linux"
      ];
      imports = [
        ./modules
        treefmt-nix.flakeModule
      ];
    };
}
