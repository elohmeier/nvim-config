return {
	{
		"cshuaimin/ssr.nvim",
		config = function()
			local ssr = require("ssr")
			ssr.setup()

			vim.keymap.set({ "n", "x" }, "<leader>rr", function()
				ssr.open()
			end)
		end,
	},
}
