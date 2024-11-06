{ pkgs, ... }:

{
  plugins.treesitter = {
    enable = true;

    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      beancount
      c
      git_config
      git_rebase
      gitattributes
      gitcommit
      gitignore
      hcl
      helm
      javascript
      jsdoc
      json
      jsonc
      jsonnet
      lua
      make
      markdown
      nix
      python
      readline
      regex
      rust
      ssh-config
      svelte
      toml
      typescript
      typst
      vim
      vimdoc
      xml
      yaml
    ];

    # not required when using grammarPackages
    gccPackage = null;
    nodejsPackage = null;
    treesitterPackage = null;

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
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
    extraOptions = {
      enable_autocmd = false;
    };
  };

  # https://github.com/JoosepAlviste/nvim-ts-context-commentstring/wiki/Integrations#native-commenting-in-neovim-010
  extraConfigLua = ''
    local get_option = vim.filetype.get_option
    vim.filetype.get_option = function(filetype, option)
      return option == "commentstring"
        and require("ts_context_commentstring.internal").calculate_commentstring()
        or get_option(filetype, option)
    end
  '';
}
