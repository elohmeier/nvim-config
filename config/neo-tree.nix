{
  plugins.neo-tree = {
    enable = true;

    extraSources = [ "document_symbols" ];

    filesystem = {
      bindToCwd = false;
      followCurrentFile.enabled = true;
      useLibuvFileWatcher = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>fe";
      action.__raw = ''
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end
      '';
      options = {
        silent = true;
        desc = "Explorer NeoTree (cwd)";
      };
    }
    {
      mode = "n";
      key = "<leader>ge";
      action = ":Neotree git_status<CR>";
      options = {
        silent = true;
        desc = "Git explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>be";
      action = ":Neotree buffers<CR>";
      options = {
        silent = true;
        desc = "Buffer explorer";
      };
    }
  ];
}
