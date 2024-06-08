{ ... }:
{
  perSystem = { pkgs, system, ... }: {
    treefmt.config = {
      projectRootFile = "flake.nix";
      programs.nixpkgs-fmt.enable = true;
      programs.stylua.enable = true;
    };
  };
}

