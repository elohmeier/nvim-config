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
      key = "<leader>ng";
      action = "<cmd>Neogit<CR>";
    }
  ];
}
