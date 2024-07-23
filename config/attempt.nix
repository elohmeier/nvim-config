{ helpers, pkgs, ... }: {
  extraPlugins = [
    pkgs.attempt-nvim
  ];

  plugins.telescope = {
    enabledExtensions = [ "attempt" ];
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>an";
      action = "<cmd>lua require('attempt').new_select()<cr>";
      options = {
        silent = true;
        desc = "New attempt (select)";
      };
    }

    {
      mode = "n";
      key = "<leader>ai";
      action = "<cmd>lua require('attempt').new_input_ext()<cr>";
      options = {
        silent = true;
        desc = "New input (input extension)";
      };
    }

    {
      mode = "n";
      key = "<leader>fa";
      action = "<cmd>Telescope attempt<cr>";
      options = {
        desc = "Attempts";
      };
    }
  ];

  extraConfigLua =
    let
      options = { };
    in
    ''
      require("attempt").setup(${helpers.toLuaObject options})
    '';
}

