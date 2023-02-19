local utils = require("palenight.utils")

local M = {}

function M.setup(opts)
	opts = opts or {}

	if vim.g.colors_name then
		vim.cmd([[hi clear]])
	end

	vim.o.termguicolors = true
	vim.g.colors_name = "palenight"

	local colors = utils.configure_colors(opts.colors or {})
	local highlights = utils.configure_highlights(opts.highlights or {}, colors, opts.transparent)

	for group, hls in pairs(highlights) do
		utils.highlight(group, hls)
	end
end

return M
