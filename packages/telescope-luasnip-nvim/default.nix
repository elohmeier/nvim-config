{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  pname = "telescope-luasnip.nvim";
  version = "0-unstable-2024-06-08";
  src = fetchFromGitHub {
    owner = "benfowler";
    repo = "telescope-luasnip.nvim";
    rev = "11668478677de360dea45cf2b090d34f21b8ae07";
    hash = "sha256-jzLzucF2rAa3nkHE5n4g2StkSUjMOMK93JCH/g09DQY=";
  };
}
