{ self, inputs, ... }:

{
  flake.overlays = {
    default =
      final: _prev:
      let
        nixvim' = inputs.nixvim.legacyPackages.${final.system};
      in
      {
        nixvim-full = nixvim'.makeNixvimWithModule {
          pkgs = final;
          module = import ../../config { };
        };

        nixvim-minimal = nixvim'.makeNixvimWithModule {
          pkgs = final;
          module = import ../../config { minimal = true; };
        };

        aider-nvim = final.callPackage ../../packages/aider-nvim { };
        attempt-nvim = final.callPackage ../../packages/attempt-nvim { };
        parrot-nvim = final.callPackage ../../packages/parrot-nvim { };
        resession-nvim = final.callPackage ../../packages/resession-nvim { };
        ssr-nvim = final.callPackage ../../packages/ssr-nvim { };
        telescope-luasnip-nvim = final.callPackage ../../packages/telescope-luasnip-nvim { };
      };
  };

  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [ self.overlays.default ];
      };
    };
}
