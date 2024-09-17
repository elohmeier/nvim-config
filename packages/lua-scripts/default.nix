{ vimUtils }:

vimUtils.buildVimPlugin {
  name = "lua-scripts";
  src = ../../lua;
}
