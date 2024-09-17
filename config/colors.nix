{ pkgs, ... }:
{
  colorschemes = {
    # rose-pine = {
    #   enable = true;
    #   settings = {
    #     styles = {
    #       disable_background = true;
    #       italic = false;
    #     };
    #   };
    # };

    tokyonight = {
      enable = true;

      settings = {
        style = "storm";
        light_style = "day";
        transparent = true;
      };
    };
  };

  # highlightOverride = {
  #   Normal.bg = "none";
  #   NormalFloat.bg = "none";
  # };

  # extraConfigLua = ''
  #   local bgwinch = require("bgwinch")
  #   bgwinch.setup()
  # '';
}
