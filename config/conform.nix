{ minimal }:
{ lib, pkgs, ... }:
{
  plugins.conform-nvim = {
    enable = true;

    settings = {
      formatters_by_ft = {
        cpp = [ "clang-format" ];
        htmldjango = [ "djade" ];
        json = [ "deno_fmt" ];
        jsonnet = [ "jsonnetfmt" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        python = [
          "ruff_format"
          "ruff_fix"
        ];
        svelte = [ "deno_fmt" ];
        toml = [ "taplo" ];
        typescript = [ "deno_fmt" ];
        typst = [ "typstyle" ];
        xml = [ "xmllint" ];
        yaml = [ "deno_fmt" ];

        # run on filetypes that don't have other formatters configured
        "_" = [ "trim_whitespace" ];
      };

      formatters = {
        deno_fmt.args.__raw = ''
          function(self, ctx)
            local extensions = {
              esmodule = "mjs",
              javascript = "js",
              javascriptreact = "jsx",
              json = "json",
              jsonc = "jsonc",
              markdown = "md",
              svelte = "svelte",
              typescript = "ts",
              typescriptreact = "tsx",
            }
            return {
              "fmt",
              "-",
              "--ext",
              extensions[vim.bo[ctx.buf].filetype],
            }
          end
        '';

        djade = {
          meta = {
            url = "https://github.com/adamchainz/djade";
            description = "A Django template formatter.";
          };
          command = "djade";
          args = [ "$FILENAME" ];
          stdin = false;
          exit_codes = [
            0
            1
          ];
        };

        ruff_fix.args = [
          "check"
          "--fix"
          "--select"
          "I,UP"
          "--force-exclude"
          "--exit-zero"
          "--no-cache"
          "--stdin-filename"
          "$FILENAME"
          "-"
        ];

        shfmt.prepend_args = [
          "-i"
          "4"
        ];
      };
    };
  };

  extraPackages =
    with pkgs;
    lib.mkIf (!minimal) [
      deno
      go-jsonnet
      libxml2 # for xmllint
      nixfmt-rfc-style
      ruff
      stylua
      taplo
      typstyle
    ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>uf";
      action = ":FormatToggle<CR>";
      options = {
        desc = "Toggle Format";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Buffer";
      };
    }

    {
      mode = "v";
      key = "<leader>cF";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Lines";
      };
    }
  ];

  extraConfigLua = ''
    local conform = require("conform")
    local notify = require("notify")

    conform.setup({
      format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    })

    local function show_notification(message, level)
      notify(message, level, { title = "conform.nvim" })
    end

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      local is_global = not args.bang
      if is_global then
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      if vim.g.disable_autoformat then
        show_notification("Autoformat-on-save disabled globally", "info")
      else
        show_notification("Autoformat-on-save enabled globally", "info")
      end
      else
        vim.b.disable_autoformat = not vim.b.disable_autoformat
      if vim.b.disable_autoformat then
        show_notification("Autoformat-on-save disabled for this buffer", "info")
      else
        show_notification("Autoformat-on-save enabled for this buffer", "info")
        end
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("RuffFix", function()
      if vim.bo.filetype == "python" then
        conform.format({ bufnr = 0, formatters = { "ruff_fix" } })
      else
        show_notification("RuffFix is only available for Python files", "warn")
      end
    end, {
      desc = "Run ruff_fix formatter on Python files",
    })
  '';
}
