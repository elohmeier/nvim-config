{
  plugins.lazygit = {
    enable = true;

    # avoid deps
    gitPackage = null;
    lazygitPackage = null;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>LazyGit<CR>";
    }
  ];
}
