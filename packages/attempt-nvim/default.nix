{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  pname = "attempt.nvim";
  version = "0-unstable-2024-06-28";
  src = fetchFromGitHub {
    owner = "m-demare";
    repo = "attempt.nvim";
    rev = "3905db768478a2152fd927ab5a8def85bc2e34e7";
    hash = "sha256-OI19fPJGMLLYOt3hp26FsS6EJadzDtpuquz3PxmK2kg=";
  };
}
