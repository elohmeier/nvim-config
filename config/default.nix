{
  minimal ? false,
}:
{
  imports =
    [
      ./attempt.nix
      ./colors.nix
      ./luasnip.nix
      ./mini.nix
      ./notify.nix
      ./remap.nix
      ./resession.nix
      ./set.nix
    ]
    ++ (
      if minimal then
        [ ]
      else
        [
          ./cmp.nix
          ./conform.nix
          ./copilot.nix
          ./dap.nix
          ./gitsigns.nix
          ./lsp.nix
          ./neo-tree.nix
          ./neogit.nix
          ./parrot.nix
          ./plantuml.nix
          ./spectre.nix
          ./ssr.nix
          ./telescope.nix
          ./treesitter.nix
          ./trouble.nix
        ]
    );

  withRuby = false;
}
