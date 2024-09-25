{
  plugins.neo-tree = {
    enable = true;

    extraSources = [ "document_symbols" ];

    filesystem = {
      bindToCwd = false;
      followCurrentFile.enabled = true;
      useLibuvFileWatcher = true;
    };

    # avoid git dependency
    gitPackage = null;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>fe";
      action.__raw = ''
        function()
          require("neo-tree.command").execute({ action = "focus", source = "filesystem", position = "left", dir = vim.loop.cwd() })
        end
      '';
      options = {
        silent = true;
        desc = "Neo-tree file explorer (cwd)";
      };
    }
    {
      mode = "n";
      key = "<leader>fE";
      action.__raw = ''
        function()
          local git_utils = require("neo-tree.git.utils")
          require("neo-tree.command").execute({ action = "focus", source = "filesystem", position = "left", dir = git_utils.get_repository_root() })
        end
      '';
      options = {
        silent = true;
        desc = "Neo-tree file explorer (git repo root)";
      };
    }
    {
      mode = "n";
      key = "<leader>f.";
      action.__raw = ''
        function()
          require("neo-tree.command").execute({ action = "focus", source = "filesystem", position = "left", dir = vim.fn.expand("%:p:h") })
        end
      '';
      options = {
        silent = true;
        desc = "Neo-tree file explorer (current file parent)";
      };
    }
    {
      mode = "n";
      key = "<leader>ge";
      action.__raw = ''
        function()
          require("neo-tree.command").execute({ action = "focus", source = "git_status", position = "left" })
        end
      '';
      options = {
        silent = true;
        desc = "Neo-tree git explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>be";
      action.__raw = ''
        function()
          require("neo-tree.command").execute({ action = "focus", source = "buffers", position = "left" })
        end
      '';
      options = {
        silent = true;
        desc = "Neo-tree buffer explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>de";
      action.__raw = ''
        function()
          require("neo-tree.command").execute({ action = "focus", source = "document_symbols", position = "left" })
        end
      '';
      options = {
        silent = true;
        desc = "Neo-tree document symbols explorer";
      };
    }
  ];
}
