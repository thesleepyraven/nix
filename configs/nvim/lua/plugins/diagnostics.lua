return {
	"folke/trouble.nvim",
	opts = { open_no_results = true },
	cmd = "Trouble",
	keys = { {
		"<leader>dt",
		"<cmd>Trouble diagnostics toggle<CR>",
		desc = "Trouble diagnostics toggle"
	}, {
		"<leader>ds",
		"<cmd>Trouble symbols toggle<CR>",
		desc = "Trouble symbols toggle"
	}, },
}
