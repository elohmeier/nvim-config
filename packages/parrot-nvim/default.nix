{ lib
, vimUtils
, fetchFromGitHub
}:

vimUtils.buildVimPlugin rec {
  pname = "parrot-nvim";
  version = "0.3.7";

  src = fetchFromGitHub {
    owner = "frankroeder";
    repo = "parrot.nvim";
    rev = "v${version}";
    hash = "sha256-lzSFbrYmLqY4b/0q+GLdiSvPyy4A4fIw+SJkrDdX1+o=";
  };

  meta = with lib; {
    description = "Parrot.nvim 🦜 - the plugin that brings stochastic parrots to Neovim";
    homepage = "https://github.com/frankroeder/parrot.nvim";
    license = licenses.mit;
    platforms = platforms.all;
  };
}
