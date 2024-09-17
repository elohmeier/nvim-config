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
      (
        { pkgs, ... }:
        {
          extraPlugins = [ pkgs.lua-scripts ];
        }
      )
    ]
    ++ (
      if minimal then
        [ ]
      else
        [
          ./aider.nix
          ./avante.nix
          ./aw-watcher.nix
          ./cmp.nix
          ./conform.nix
          # ./copilot.nix
          ./dap.nix
          ./gitsigns.nix
          ./lsp.nix
          ./neo-tree.nix
          ./neogit.nix
          ./notebooks.nix
          ./oil.nix
          ./parrot.nix
          ./plantuml.nix
          ./spectre.nix
          ./ssr.nix
          ./telescope.nix
          ./treesitter.nix
          ./trouble.nix
          ./wezterm.nix
        ]
    );

  withRuby = false;
}
