{ self, inputs, ... }:

{
  flake.overlays = {
    default = final: prev:
      let
        nixvim' = inputs.nixvim.legacyPackages.${final.system};
      in
      {
        nixvim-full = nixvim'.makeNixvimWithModule {
          module = import ../../config { };
        };

        nixvim-minimal = nixvim'.makeNixvimWithModule {
          module = import ../../config {
            minimal = true;
          };
        };
      };
  };

  perSystem = { system, ... }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
      overlays = [
        self.overlays.default
      ];
    };
  };
}

