return {
	{
		"toppair/peek.nvim",
		ft = { "markdown" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				auto_load = true,
				app = { "Chrome", "--new-window" },
			})
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

			require("which-key").add({
				{
					"<leader>mp",
					function()
						local peek = require("peek")
						if peek.is_open() then
							peek.close()
						else
							peek.open()
						end
					end,
					desc = "Toggle markdown preview",
					icon = { icon = " ", color = "blue" },
				},
			})
		end,
		cmd = { "PeekOpen", "PeekClose" },
		-- keys = {
		-- 	{
		-- 		"<leader>mp",
		-- 		function()
		-- 			local peek = require("peek")
		-- 			if peek.is_open() then
		-- 				peek.close()
		-- 			else
		-- 				peek.open()
		-- 			end
		-- 		end,
		-- 		desc = "Toggle Markdown Preview",
		-- 	},
		-- },
	},
}
