{ ascii }:
{
  plugins.mini = {
    enable = true;
    modules = {
      bracketed = { };
      cursorword = { };
      icons = {
        style = if ascii then "ascii" else "glyph";
      };
      statusline = { };
      tabline = { };
    };

    mockDevIcons = true;
  };

  plugins.web-devicons.enable = false;

  extraConfigLua = ''
    local function cursorword_block()

      -- Always disable for 'neo-tree' filetype
      if filetype == 'neo-tree' then
        vim.b.minicursorword_disable = true
      end

    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = cursorword_block
    })
  '';
}
