{ pkgs, ... }:
{
  extraPlugins = [ pkgs.telescope-luasnip-nvim ];

  plugins.luasnip = {
    enable = true;
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
    fromVscode = [
      {
        lazyLoad = true;
        paths = ../snippets;
      }
    ];
  };

  plugins.friendly-snippets.enable = true;

  plugins.telescope = {
    enabledExtensions = [ "luasnip" ];
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>fl";
      action = "<cmd>Telescope luasnip<cr>";
      options = {
        desc = "Luasnip";
      };
    }
  ];
}
