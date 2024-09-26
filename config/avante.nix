{ helpers, pkgs, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins.avante-nvim
    pkgs.vimPlugins.render-markdown-nvim
  ];

  extraConfigLua =
    let
      rmOptions = {
        file_types = [
          "markdown"
          "Avante"
        ];
      };
      options = { };
    in
    ''
      require('render-markdown').setup (${helpers.toLuaObject rmOptions})
      require('avante_lib').load()
      require("avante").setup(${helpers.toLuaObject options})
    '';
}
