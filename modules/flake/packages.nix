_: {
  perSystem =
    { pkgs, ... }:
    {
      packages = {
        inherit (pkgs)
          # neovim variants
          nixvim-full
          nixvim-minimal
          nixvim-minimal-ascii

          # plugins
          aider-nvim
          attempt-nvim
          lua-scripts
          parrot-nvim
          resession-nvim
          ssr-nvim
          telescope-luasnip-nvim
          wezterm-nvim
          ;

        default = pkgs.nixvim-full;
      };
    };
}
