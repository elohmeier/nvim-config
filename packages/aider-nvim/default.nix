{ vimUtils, fetchFromGitHub }:

vimUtils.buildVimPlugin {
  pname = "aider-nvim";
  version = "5c6ad9c2de836a4edd235a9d7e421edb6f2ee046";
  src = fetchFromGitHub {
    owner = "jondkinney";
    repo = "aider.nvim";
    rev = "5c6ad9c2de836a4edd235a9d7e421edb6f2ee046";
    hash = "sha256-UkuLhmRnD/DnYvkRpltquUOQUIDuJ3zvjdEoN81L6s0=";
  };
}
