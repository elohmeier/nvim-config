{ helpers, pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "attempt.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "m-demare";
        repo = "attempt.nvim";
        rev = "3905db768478a2152fd927ab5a8def85bc2e34e7"; # 2024-06-28
        hash = "sha256-OI19fPJGMLLYOt3hp26FsS6EJadzDtpuquz3PxmK2kg=";
      };
    })
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

