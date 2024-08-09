_: {
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        inherit (pkgs)
          # neovim variants
          nixvim-full
          nixvim-minimal

          # plugins
          aider-nvim
          attempt-nvim
          parrot-nvim
          resession-nvim
          ssr-nvim
          telescope-luasnip-nvim
          ;

        default = pkgs.nixvim-full;
      };
    };
}
