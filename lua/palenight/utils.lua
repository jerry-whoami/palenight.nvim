local M = {}

function M.configure_highlights(overrides, colors, transparent)
	local highlights = require("palenight.theme").highlights(colors, transparent)

	return vim.tbl_deep_extend("force", highlights, overrides or {})
end

function M.configure_colors(overrides)
	local colors = require("palenight.theme").colors

	return vim.tbl_deep_extend("force", colors, overrides or {})
end

function M.highlight(group, colors)
	local style = {}

	if colors.style ~= nil then
		vim.api.nvim_echo(
			{ { '[palenightfall.nvim] "style" field is deprecated. Use boolean fields instead' } },
			true,
			{}
		)

		colors.style = nil
		style = {
			bold = colors.style == "bold",
			standout = colors.style == "standout",
			underline = colors.style == "underline",
			undercurl = colors.style == "undercurl",
			underdouble = colors.style == "underdouble",
			underdotted = colors.style == "underdotted",
			underdashed = colors.style == "underdashed",
			strikethrough = colors.style == "strikethrough",
			italic = colors.style == "italic",
			reverse = colors.style == "reverse",
			nocombine = colors.style == "nocombine",
		}
	end

	vim.api.nvim_set_hl(
		0,
		group,
		vim.tbl_extend("force", style, colors, {
			fg = colors.fg or "NONE",
			bg = colors.bg or "NONE",
			sp = colors.sp or "NONE",
		})
	)
end

return M
