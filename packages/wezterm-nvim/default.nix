{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin rec {
  pname = "wezterm.nvim";
  version = "0.5.0";
  src = fetchFromGitHub {
    owner = "willothy";
    repo = "wezterm.nvim";
    rev = "v${version}";
    hash = "sha256-FeM5cep6bKCfAS/zGAkTls4qODtRhipQojy3OWu1hjY=";
  };
}
