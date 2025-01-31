{
  ascii ? false,
  minimal ? false,
  aw ? false,
}:
{
  imports =
    [
      (import ./conform.nix { inherit minimal; })
      (import ./lsp.nix { inherit minimal; })
      (import ./mini.nix { inherit ascii; })
      (import ./molten.nix { inherit minimal; })
      (import ./neo-tree.nix { inherit ascii; })
      # ./attempt.nix
      ./cmp.nix
      ./colors.nix
      ./fzf-lua.nix
      ./gitsigns.nix
      ./lazygit.nix
      ./luasnip.nix
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
      if aw then
        [
          ./aw-watcher.nix
        ]
      else
        [
        ]
    )
    ++ (
      if minimal then
        [ ]
      else
        [
          ./aider.nix
          ./avante.nix
          # ./copilot.nix
          ./dap.nix
          ./jupytext.nix
          ./parrot.nix
          ./plantuml.nix
          ./wezterm.nix
        ]
    );

  withRuby = false;
}
