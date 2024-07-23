{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  pname = "ssr.nvim";
  version = "0-unstable-2023-10-28";
  src = fetchFromGitHub {
    owner = "cshuaimin";
    repo = "ssr.nvim";
    rev = "bb323ba621ac647b4ac5638b47666e3ef3c279e1";
    hash = "sha256-aN+hPMsIIvfueaNyqohXTIVCvYjXXcmVd3uDCnxEp3A=";
  };
}
