{ pkgs, ... }: {
  extraPlugins = [
    pkgs.telescope-luasnip-nvim
  ];

  plugins.luasnip = {
    enable = true;
    extraConfig = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
    };
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
