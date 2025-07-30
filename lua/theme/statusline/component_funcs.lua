local M = {}

-- Show search count when hlsearch is on
function M.search_result()
	if vim.v.hlsearch == 0 then
		return ""
	end
	local last = vim.fn.getreg("/")
	if last == "" then
		return ""
	end
	local sc = vim.fn.searchcount({ maxcount = 9999 })
	return last .. "(" .. sc.current .. "/" .. sc.total .. ")"
end

-- Modified/signifier component
function M.modified()
	if vim.bo.modified then
		return "+"
	elseif not vim.bo.modifiable or vim.bo.readonly then
		return "-"
	end
	return ""
end

return M
