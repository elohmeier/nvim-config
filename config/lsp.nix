{ minimal }:
{ lib, ... }:
{
  plugins.lsp = {
    enable = true;

    servers = {
      basedpyright = {
        enable = true;
        package = lib.mkIf minimal null;
      };
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
      jsonnet_ls = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      lua_ls = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      nil_ls = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      tinymist = {
        enable = true;
        package = lib.mkIf minimal null;

        # workaround https://github.com/Myriad-Dreamin/tinymist/issues/638
        extraOptions.offset_encoding = "utf-8";
      };
      ruff_lsp = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
        package = lib.mkIf minimal null;
      };
      svelte = {
        enable = true;
        package = lib.mkIf minimal null;
      };
      # tailwindcss = {
      #   enable = true;
      #   package = lib.mkIf minimal null;
      # };
      ts_ls = {
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

  autoCmd = [
    # disable diagnostics for .env files
    {
      event = [ "BufEnter" ];
      pattern = [ ".env" ];
      callback.__raw = ''
        function(args)
            vim.diagnostic.disable(args.buf)
        end
      '';
    }
    # set commentstring for typst files
    {
      event = [ "FileType" ];
      pattern = [ "typst" ];
      callback.__raw = ''
        function(args)
            vim.bo[args.buf].commentstring = "// %s"
        end
      '';
    }
  ];
}
