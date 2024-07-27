{ helpers, pkgs, ... }: {
  extraPlugins = [
    pkgs.parrot-nvim
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>pp";
      action = "<cmd>PrtNew<cr>";
      options = {
        silent = true;
        desc = "Open a new parrot chat";
      };
    }
  ];

  extraConfigLua =
    let
      options = {
        providers = {
          anthropic.api_key.__raw = ''os.getenv "ANTHROPIC_API_KEY"'';
          ollama = { };
          openai.api_key.__raw = ''os.getenv "OPENAI_API_KEY"'';
        };
      };
    in
    ''require("parrot").setup(${helpers.toLuaObject options})'';
}
