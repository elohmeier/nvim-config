vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
	require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
	require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

--vim.keymap.set("n", "<leader><leader>", function()
--	vim.cmd("so")
--end)

-- Option + Shift + w to insert „ (like in macOS)
vim.api.nvim_set_keymap("i", "<M-S-w>", "„", { noremap = true, silent = true })

-- Option + [ to insert “ (like in macOS)
vim.api.nvim_set_keymap("i", "<M-[>", "“", { noremap = true, silent = true })

-- Option + u followed by a,o,u,A,O,U to insert ä,ö,ü,Ä,Ö,Ü (like in macOS)
vim.api.nvim_set_keymap("i", "<M-u>a", "ä", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-u>o", "ö", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-u>u", "ü", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-u>A", "Ä", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-u>O", "Ö", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-u>U", "Ü", { noremap = true, silent = true })

-- Option + s insert ß (like in macOS)
vim.api.nvim_set_keymap("i", "<M-s>", "ß", { noremap = true, silent = true })

-- Jump to LSP error
vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev)

-- Ctrl + a in command mode to go to the beginning of the line
vim.api.nvim_set_keymap("c", "<C-a>", "<C-b>", { noremap = true, silent = false })
