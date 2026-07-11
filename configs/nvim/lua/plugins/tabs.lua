return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
		vim.keymap.set("n", "<A-j>", ":BufferPrevious<CR>", { desc = "Previous Buffer" })
		vim.keymap.set("n", "<A-k>", ":BufferNext<CR>", { desc = "Next Buffer" })
		vim.keymap.set("n", "<A-c>", ":BufferClose<CR>", { desc = "Close Current Buffer" })
		-- Sort automatically by...
		vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { desc = "Order Buffers by Buffer Numbers" })
		vim.keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", { desc = "Order Buffers by Buffer Names" })
		vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", { desc = "Order Buffers by Buffer Directories" })
		vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", { desc = "Order Buffers by Buffer Languages" })
		vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>",
			{ desc = "Order Buffers by Buffer Window Numbers" })
	end,
	opts = {
		animation = true,
		clickable = true,
		icons = {
			diagnostics = {},
			filetype = {
				enabled = true,
				custom_colors = false,
			},
			preset = "powerline",
		},
		sidebar_filetypes = { ["neo-tree"] = true },
		sort = {
			ignore_case = true,
		},
	},
}
