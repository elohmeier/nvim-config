{ pkgs, ... }:
{
  extraPlugins = [ pkgs.ssr-nvim ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>lua require('ssr').open()<cr>";
      options = {
        silent = true;
        desc = "Structural search and replace";
      };
    }
  ];
}
