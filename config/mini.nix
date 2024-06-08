{
  plugins.mini = {
    enable = true;
    modules = {
      bracketed = { };
      cursorword = { };
      statusline = { };
      tabline = { };
    };
  };

  # needs to be configured *before* calling module's `setup()`
  extraConfigLuaPre = ''
    local function cursorword_block()
      local curword = vim.fn.expand('<cword>')
      local filetype = vim.bo.filetype

      -- Always disable for 'neo-tree' filetype
      if filetype == 'neo-tree' then
        vim.b.minicursorword_disable = true
        return
      end

      -- Define keyword blocklist for specific file types
      local blocklist = {
        lua = { 'local', 'require' },
        javascript = { 'import' }
      }

      local keywords = blocklist[filetype] or {}
      vim.b.minicursorword_disable = vim.tbl_contains(keywords, curword)
    end

    vim.api.nvim_create_autocmd("CursorMoved", {
      pattern = "*",
      callback = cursorword_block
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = cursorword_block
    })
  '';
}
