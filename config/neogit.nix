{
  plugins.neogit = {
    enable = true;

    # avoid deps
    gitPackage = null;
    whichPackage = null;
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>Neogit<CR>";
    }
  ];
}
