{
  plugins.lsp = {
    enable = true;

    servers = {
      gopls.enable = true;
      lua-ls.enable = true;
      nil-ls.enable = true;
      pyright.enable = true;
      ruff-lsp.enable = true;
      rust-analyzer.enable = true;
      svelte.enable = true;
      tailwindcss.enable = true;
      tsserver.enable = true;
    };
  };
}
