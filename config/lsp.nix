{ minimal }:
{ lib, ... }:
{
  plugins.lsp = {
    enable = true;

    servers = {
      bashls = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      clangd = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      gopls = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      jsonnet-ls = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      lua-ls = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      nil-ls = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      pyright = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      ruff-lsp = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      rust-analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
        package = lib.mkIf minimal null;
      };
      svelte = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      tailwindcss = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      ts-ls = {
        enable = true;
        package = lib.mkIf minimal null;
      };
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
        {
          action.__raw = "function() vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.WARN } }) end";
          key = "]d"; # override default binding
          mode = "n";
          options = {
            desc = "Next Diagnostic";
            silent = true;
          };
        }
        {
          action.__raw = "function() vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.WARN } }) end";
          key = "[d"; # override default binding
          mode = "n";
          options = {
            desc = "Previous Diagnostic";
            silent = true;
          };
        }
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
