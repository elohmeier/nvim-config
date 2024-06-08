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
}
