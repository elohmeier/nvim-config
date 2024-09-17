{
  plugins.lsp = {
    enable = true;

    servers = {
      bashls.enable = true;
      clangd.enable = true;
      gopls.enable = true;
      jsonnet-ls.enable = true;
      lua-ls.enable = true;
      nil-ls.enable = true;
      pyright.enable = true;
      ruff-lsp.enable = true;
      rust-analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
      svelte.enable = true;
      tailwindcss.enable = true;
      ts-ls.enable = true;
    };

    keymaps = {
      silent = true;

      lspBuf = {
        "<leader>vrn" = {
          action = "rename";
          desc = "Rename";
        };
      };

      extra = [
        # use [d ]d instead
        # {
        #   action.__raw = "function() vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } }) end";
        #   key = "<C-j>";
        #   mode = "n";
        #   options = {
        #     desc = "Next Diagnostic";
        #     silent = true;
        #   };
        # }
        # {
        #   action.__raw = "function() vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } }) end";
        #   key = "<C-k>";
        #   mode = "n";
        #   options = {
        #     desc = "Previous Diagnostic";
        #     silent = true;
        #   };
        # }
        {
          action = "<cmd>lua vim.lsp.buf.definition()<CR>";
          key = "<C-k>";
          mode = "n";
          options = {
            desc = "Goto Definition";
            silent = true;
          };
        }
      ];
    };
  };

  # disable diagnostics for .env files
  autoCmd = [
    {
      event = [ "BufEnter" ];
      pattern = [ ".env" ];
      callback.__raw = "function(args) vim.diagnostic.disable(args.buf) end";
    }
  ];
}
