{
  globals.mapleader = " ";

  keymaps = [

    # greatest remap ever
    {
      mode = "x";
      key = "<leader>p";
      action = ''"_dP'';
    }

    # next greatest remap ever : asbjornHaland
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>y";
      action = ''"+y'';
    }
    {
      mode = "n";
      key = "<leader>Y";
      action = ''"+Y'';
    }
    {
      mode = "n";
      key = "<leader>p";
      action = ''"+p'';
    }

    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>d";
      action = ''"_d'';
    }

    # This is going to get me cancelled
    {
      mode = "i";
      key = "<C-c>";
      action = "<Esc>";
    }

    {
      mode = "n";
      key = "Q";
      action = "<nop>";
    }

    # Option + Shift + w to insert „ (like in macOS)
    {
      mode = "i";
      key = "<M-S-w>";
      action = "„";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Option + [ to insert “ (like in macOS)
    {
      mode = "i";
      key = "<M-[>";
      action = "“";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Option + u followed by a,o,u,A,O,U to insert ä,ö,ü,Ä,Ö,Ü (like in macOS)
    {
      mode = "i";
      key = "<M-u>a";
      action = "ä";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<M-u>o";
      action = "ö";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<M-u>u";
      action = "ü";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<M-u>A";
      action = "Ä";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<M-u>O";
      action = "Ö";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "i";
      key = "<M-u>U";
      action = "Ü";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Option + s insert ß (like in macOS)
    {
      mode = "i";
      key = "<M-s>";
      action = "ß";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Ctrl + a in command mode to go to the beginning of the line
    {
      mode = "c";
      key = "<C-a>";
      action = "<C-b>";
      options = {
        noremap = true;
        silent = false;
      };
    }
  ];
}
