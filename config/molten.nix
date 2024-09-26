{ minimal }:
{ lib, ... }:
{
  plugins.image = {
    enable = !minimal;
  };

  plugins.molten = {
    enable = true;
    settings = {
      backend = "kitty";
      image_provider = if minimal then "none" else "image.nvim";
    };

    python3Dependencies = lib.mkIf minimal (_: [ ]);
  };
}
