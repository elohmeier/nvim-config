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
          lua-scripts
          notebook-navigator-nvim
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
