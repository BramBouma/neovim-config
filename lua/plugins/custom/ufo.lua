return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	event = "BufReadPost",
	config = function()
		-- prettier fold gutter: arrows instead of +/- and digits
		vim.opt.fillchars = vim.opt.fillchars
			+ {
				foldopen = "", -- down arrow
				foldclose = "", -- right arrow
				-- 		foldsep = " ", -- no separators
				-- 		fold = " ", -- blank out residual cells
				-- 		eob = " ", -- nice to have
			}
		-- vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep:|,foldclose:]]

		-- vim.o.foldcolumn = "auto:9"
		vim.o.foldcolumn = "0"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- (we'll attach the custom fold text in section 3)
		local handler = function(virtText, lnum, endLnum, width, truncate)
			-- Build a suffix like " 󰁂 12 " (use any icon or text you want)
			local newVirtText = {}
			local nLines = endLnum - lnum
			local suffix = ("  %d "):format(nLines) -- e.g., "… 12" or " ↧ 12 "
			local sufWidth = vim.fn.strdisplaywidth(suffix)
			local targetWidth = width - sufWidth
			local curWidth = 0

			for _, chunk in ipairs(virtText) do
				local txt, hl = chunk[1], chunk[2]
				local chunkWidth = vim.fn.strdisplaywidth(txt)
				if targetWidth > curWidth + chunkWidth then
					table.insert(newVirtText, { txt, hl })
				else
					txt = truncate(txt, targetWidth - curWidth)
					table.insert(newVirtText, { txt, hl })
					curWidth = curWidth + vim.fn.strdisplaywidth(txt)
					if curWidth < targetWidth then
						suffix = suffix .. string.rep(" ", targetWidth - curWidth)
					end
					break
				end
				curWidth = curWidth + chunkWidth
			end

			table.insert(newVirtText, { suffix, "Comment" }) -- choose any hl group you like
			return newVirtText
		end

		require("ufo").setup({
			provider_selector = function(_, _, _)
				return { "treesitter", "indent" }
			end,
			fold_virt_text_handler = handler,
			open_fold_hl_timeout = 300,
			preview = { win_config = { border = "rounded" } },
		})

		-- small QoL mappings like the README suggests
		vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "UFO: open all folds" })
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "UFO: close all folds" })
	end,
}
