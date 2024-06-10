{
  plugins.lsp = {
    enable = true;

    servers = {
      gopls.enable = true;
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
      tsserver.enable = true;
    };

    keymaps = {
      silent = true;

      lspBuf = {
        "<leader>vrn" = {
          action = "rename";
          desc = "Rename";
        };
      };

      diagnostic = {
        "<C-j>" = {
          action = "goto_next";
          desc = "Next Diagnostic";
        };
        "<C-k>" = {
          action = "goto_prev";
          desc = "Previous Diagnostic";
        };
      };
    };
  };
}
