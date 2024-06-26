{
  plugins.treesitter = {
    enable = true;
    indent = true;
    nixvimInjections = true;
    ensureInstalled = [
      "bash"
      "c"
      "javascript"
      "jsdoc"
      "lua"
      "python"
      "rust"
      "typescript"
      "vimdoc"
    ];
  };

  plugins.treesitter-context = {
    enable = true;
    settings = {
      max_lines = 0;
      multiline_threshold = 1;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "[c";
      action = "<cmd>lua require('treesitter-context').go_to_context(vim.v.count1)<cr>";
      options = {
        silent = true;
        desc = "Jump to context start";
      };
    }
  ];

  plugins.treesitter-textobjects = {
    enable = false;
    select = {
      enable = true;
      lookahead = true;
      keymaps = {
        "aa" = "@parameter.outer";
        "ia" = "@parameter.inner";
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = "@class.inner";
        "ii" = "@conditional.inner";
        "ai" = "@conditional.outer";
        "il" = "@loop.inner";
        "al" = "@loop.outer";
        "at" = "@comment.outer";
      };
    };
    move = {
      enable = true;
      gotoNextStart = {
        "]m" = "@function.outer";
        "]]" = "@class.outer";
      };
      gotoNextEnd = {
        "]M" = "@function.outer";
        "][" = "@class.outer";
      };
      gotoPreviousStart = {
        "[m" = "@function.outer";
        "[[" = "@class.outer";
      };
      gotoPreviousEnd = {
        "[M" = "@function.outer";
        "[]" = "@class.outer";
      };
    };
    swap = {
      enable = true;
      swapNext = {
        "<leader>a" = "@parameters.inner";
      };
      swapPrevious = {
        "<leader>A" = "@parameter.outer";
      };
    };
  };

  plugins.ts-autotag = {
    enable = true;
  };

  plugins.ts-context-commentstring = {
    enable = true;
    disableAutoInitialization = false;
  };
}
