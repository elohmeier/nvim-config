_: {
  perSystem = { pkgs, ... }: {
    packages = {
      inherit (pkgs)
        attempt-nvim
        ssr-nvim
        telescope-luasnip-nvim
        resession-nvim
        nixvim-full
        nixvim-minimal;

      default = pkgs.nixvim-full;
    };
  };
}

