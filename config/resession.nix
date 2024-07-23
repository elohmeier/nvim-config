{ helpers, pkgs, ... }: {
  extraPlugins = [
    pkgs.resession-nvim
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>lua require('resession').save()<cr>";
      options = {
        silent = true;
        desc = "Save Session";
      };
    }
    {
      mode = "n";
      key = "<leader>sl";
      action = "<cmd>lua require('resession').load()<cr>";
      options = {
        silent = true;
        desc = "Load Session";
      };
    }
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>lua require('resession').delete()<cr>";
      options = {
        silent = true;
        desc = "Delete Session";
      };
    }
  ];

  extraConfigLua =
    let
      options = {
        autosave = {
          enabled = true;
          notify = false;
        };
      };
    in
    ''
      local resession = require("resession")

      resession.setup(${helpers.toLuaObject options})

      -- Automatically save a session when you exit Neovim
      vim.api.nvim_create_autocmd("VimLeavePre", {
        callback = function()
          -- Always save a special session named "last"
          resession.save("last")
        end,
      })
    '';
}
