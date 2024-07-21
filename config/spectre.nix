{ pkgs, ... }: {
  plugins.spectre = {
    enable = true;
    findPackage = pkgs.ripgrep;
    replacePackage = pkgs.gnused;

    settings.default = {
      find.cmd = "rg";
      replace.cmd = "sed";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>S";
      action = "<cmd>lua require('spectre').toggle()<CR>";
      options = {
        silent = true;
        desc = "Toggle Spectre";
      };
    }
    {
      mode = "n";
      key = "<leader>sw";
      action = "<cmd>lua require('spectre').open_visual({select_word=true})<CR>";
      options = {
        silent = true;
        desc = "Search current word";
      };
    }
    {
      mode = "v";
      key = "<leader>sw";
      action = "<esc><cmd>lua require('spectre').open_visual()<CR>";
      options = {
        silent = true;
        desc = "Search current word";
      };
    }
    {
      mode = "n";
      key = "<leader>sp";
      action = "<cmd>lua require('spectre').open_file_search({select_word=true})<CR>";
      options = {
        silent = true;
        desc = "Search on current file";
      };
    }
  ];
}
