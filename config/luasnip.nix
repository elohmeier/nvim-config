{ pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "telescope-luasnip.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "benfowler";
        repo = "telescope-luasnip.nvim";
        rev = "11668478677de360dea45cf2b090d34f21b8ae07"; # 2024-06-08
        hash = "sha256-jzLzucF2rAa3nkHE5n4g2StkSUjMOMK93JCH/g09DQY=";
      };
    })
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
