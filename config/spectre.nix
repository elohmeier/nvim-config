{ pkgs, ... }: {
  plugins.spectre = {
    enable = true;

    settings = {
      live_update = true;
      is_insert_mode = true;
      find_engine = {
        rg = {
          cmd = "rg";
          args = [
            "--color=never"
            "--no-heading"
            "--with-filename"
            "--line-number"
            "--column"
          ];
          options = {
            ignore-case = {
              value = "--ignore-case";
              icon = "[I]";
              desc = "ignore case";
            };
            hidden = {
              value = "--hidden";
              desc = "hidden file";
              icon = "[H]";
            };
            line = {
              value = "-x";
              icon = "[L]";
              desc = "match in line";
            };
            word = {
              value = "-w";
              icon = "[W]";
              desc = "match in word";
            };
          };
        };
      };
      replace_engine = {
        sed = {
          # workaround https://github.com/nvim-pack/nvim-spectre/issues/101
          # see https://github.com/nvim-pack/nvim-spectre/blob/9a28f926d3371b7ef02243cbbb653a0478d06e31/lua/spectre/init.lua#L45
          cmd = "${pkgs.gnused}/bin/sed";
          warn = false;

          args = [ ];
          options = {
            ignore-case = {
              value = "--ignore-case";
              icon = "[I]";
              desc = "ignore case";
            };
          };
        };
      };
      default = {
        find = {
          cmd = "rg";
          options = [
            "word"
            "hidden"
          ];
        };
        replace = {
          cmd = "sed";
        };
      };
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
