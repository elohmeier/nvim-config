{ helpers, pkgs, ... }:
{
  extraPlugins = [ pkgs.aider-nvim ];

  extraConfigLua =
    let
      options = { };
    in
    ''
      require("aider").setup(${helpers.toLuaObject options})
    '';
}
