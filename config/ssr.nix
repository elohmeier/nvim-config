{ pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "ssr.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "cshuaimin";
        repo = "ssr.nvim";
        rev = "bb323ba621ac647b4ac5638b47666e3ef3c279e1"; # 2023-10-28
        hash = "sha256-aN+hPMsIIvfueaNyqohXTIVCvYjXXcmVd3uDCnxEp3A=";
      };
    })
  ];

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
