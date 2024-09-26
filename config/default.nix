{
  minimal ? false,
}:
{
  imports =
    [
      (import ./conform.nix { inherit minimal; })
      (import ./lsp.nix { inherit minimal; })
      ./attempt.nix
      ./cmp.nix
      ./colors.nix
      ./gitsigns.nix
      ./lazygit.nix
      ./luasnip.nix
      ./mini.nix
      ./neo-tree.nix
      ./neogit.nix
      ./notify.nix
      ./oil.nix
      ./remap.nix
      ./resession.nix
      ./set.nix
      ./spectre.nix
      ./ssr.nix
      ./telescope.nix
      ./treesitter.nix
      ./trouble.nix
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
          # ./copilot.nix
          ./aider.nix
          ./avante.nix
          ./aw-watcher.nix
          ./dap.nix
          ./notebooks.nix
          ./parrot.nix
          ./plantuml.nix
          ./wezterm.nix
        ]
    );

  withRuby = false;
}
