{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  pname = "NotebookNavigator.nvim";
  version = "0-unstable-2024-05-23";
  src = fetchFromGitHub {
    owner = "GCBallesteros";
    repo = "NotebookNavigator.nvim";
    rev = "20cb6f72939194e32eb3060578b445e5f2e7ae8b";
    hash = "sha256-+FLHJ1tfIplXhO/6kajdcDBTIsNYN9kCOR9IdhXL6d4=";
  };
}
