{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  pname = "resession.nvim";
  version = "1.2.1";
  src = fetchFromGitHub {
    owner = "stevearc";
    repo = "resession.nvim";
    rev = "v1.2.1";
    hash = "sha256-GXKDuKDMcfl1SHTTdUFdWuWbtq6TDtk0GsyI3fAc1vE=";
  };
}
