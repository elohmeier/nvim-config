{
  plugins.fzf-lua = {
    enable = true;

    keymaps = {
      "<leader>ff" = {
        action = "files";
        options.desc = "Find project files";
      };
    };
  };
}
