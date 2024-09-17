{ helpers, pkgs, ... }:
{
  extraPlugins = [
    pkgs.notebook-navigator-nvim
    pkgs.vimPlugins.jupytext-nvim
  ];

  plugins.image = {
    enable = true;
  };

  plugins.molten = {
    enable = true;
    settings = {
      backend = "kitty";
      image_provider = "image.nvim";
    };
  };

  extraPackages = with pkgs; [ python3Packages.jupytext ];

  extraConfigLua =
    let
      jupytextOptions = { };
      nnOptions = { };
    in
    ''
      require("jupytext").setup(${helpers.toLuaObject jupytextOptions})
      require("notebook-navigator").setup(${helpers.toLuaObject nnOptions})
    '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>E";
      action = ''<cmd>lua require("notebook-navigator").run_cell()<cr>'';
      options.desc = "Run cell";
    }
    {
      mode = "n";
      key = "<leader>e";
      action = ''<cmd>lua require("notebook-navigator").run_and_move()<cr>'';
      options.desc = "Run cell and move";
    }
    {
      mode = "n";
      # requires kitty keyboard protocol config, see https://github.com/wez/wezterm/issues/3731
      key = "<D-CR>"; # Command + Enter (like in Jupyter)
      action = ''<cmd>lua require("notebook-navigator").run_cell()<cr>'';
      options.desc = "Run cell";
    }
    {
      mode = "n";
      key = "<S-CR>"; # Shift + Enter (like in Jupyter)
      action = ''<cmd>lua require("notebook-navigator").run_and_move()<cr>'';
      options.desc = "Run cell and move";
    }
    {
      mode = "n";
      key = "]h";
      action.__raw = ''function() require("notebook-navigator").move_cell "d" end'';
      options.desc = "Move cell down";
    }
    {
      mode = "n";
      key = "[h";
      action.__raw = ''function() require("notebook-navigator").move_cell "u" end'';
      options.desc = "Move cell up";
    }
  ];
}
