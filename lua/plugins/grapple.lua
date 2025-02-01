return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {
		scope = "git_branch",
	},
	keys = {
		{ "<C-e>", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

		{ "<leader>hf", "<cmd>Telescope grapple tags<cr>", desc = "Find in tags" },

		{ "<leader>h1", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
		{ "<leader>h2", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
		{ "<leader>h3", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
		{ "<leader>h4", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },

		{ "<leader>hp", "<cmd>Grapple cycle backward<cr>", desc = "Go to previous tag" },
		{ "<leader>hn", "<cmd>Grapple cycle forward<cr>", desc = "Go to next tag" },

		{
			-- If in oil.nvim buffer use the oil file path else just toggle
			"<C-a>",
			function()
				local filetype = vim.bo.filetype
				local Grapple = require("grapple")
				local Path = require("grapple.path")

				if filetype == "oil" then
					local Oil = require("oil")
					local filename = Oil.get_cursor_entry().name
					local directory = Oil.get_current_dir()

					Grapple.toggle({ path = Path.join(directory, filename) })
				else
					Grapple.toggle()
				end
			end,
			desc = "Tag under cursor",
		},
	},
}
