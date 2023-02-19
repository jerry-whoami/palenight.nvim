local M = {}

M.colors = {
	background = "#262638",
	foreground = "#a6accd",

	background_darker = "#232534",
	highlight = "#2b2f40",
	references = "#2e2e41", -- x 19 background / 1 purple
	selection = "#343A51",
	statusline = "#1d1f2b",
	foreground_darker = "#7982b4",
	line_numbers = "#4e5579",
	comments = "#676e95",
	accent = "#7a43bd",

	red = "#ff5370",
	orange = "#f78c6c",
	yellow = "#ffcb6b",
	green = "#c3e88d",
	cyan = "#89ddff",
	blue = "#82aaff",
	paleblue = "#b2ccd6",
	purple = "#D49BFD",
	brown = "#c17e70",
	pink = "#f07178",
	violet = "#bb80b3",

	-- x 6 background / 10 color
	red_dark = "#9e4057",
	orange_dark = "#9a6054",
	blue_dark = "#5970a6",
	green_dark = "#7d9367",

	-- Diff change
	-- x 7 background / 1 #00BE6A
	diff_add_background = "#203b3d",
	-- x 2 background / 1 #00BE6A
	diff_add_highlight = "#1c4e44",
	-- x 5 background / 1 red
	diff_delete_background = "#492f41",
	-- x 2 background / 1 red
	diff_delete_hightlight = "#6e364a",
}

M.highlights = function(colors, transparent)
	return {
		-- UI elements
		LineNr = { fg = colors.line_numbers },
		CursorLine = { bg = colors.background_darker },
		CursorLineNr = { fg = colors.foreground_darker },
		CursorColumn = { bg = colors.background_darker },
		Cursor = { fg = colors.background, bg = colors.blue },
		TermCursor = { fg = colors.background, bg = colors.blue },
		ColorColumn = { bg = colors.background_darker },
		Search = { bg = colors.highlight },
		IncSearch = { bg = colors.highlight },
		Visual = { bg = colors.selection },
		MatchParen = { bg = colors.references },
		SignColumn = { bg = "NONE" },
		FoldColumn = { fg = colors.line_numbers, bg = "NONE" },
		Folded = { fg = colors.comments, bg = colors.background_darker },
		VertSplit = { fg = colors.highlight, bg = colors.background },
		Statusline = { fg = colors.foreground, bg = colors.statusline },
		StatuslineNC = { fg = colors.foreground_darker, bg = colors.statusline },
		TabLine = { fg = colors.foreground, bg = colors.statusline },
		TabLineFill = { fg = colors.foreground, bg = colors.statusline },
		TabLineSel = { fg = colors.foreground, bg = colors.background },
		PMenu = { bg = colors.background_darker },
		PMenuSBar = { bg = colors.background_darker },
		PMenuThumb = { bg = colors.background },
		PMenuSel = { bg = colors.highlight },
		NormalFloat = { bg = colors.background },
		FloatBorder = { fg = colors.foreground_darker },
		Question = { fg = colors.green },
		MoreMsg = { fg = colors.green },
		Error = { fg = colors.red },
		ErrorMsg = { fg = colors.red },
		NvimInternalError = { fg = colors.red },
		WarningMsg = { fg = colors.orange },
		Directory = { fg = colors.blue },
		Conceal = { fg = colors.brown },

		-- Syntax
		Normal = { fg = colors.foreground, bg = transparent and "NONE" or colors.background },
		Identifier = { fg = colors.foreground },
		Comment = { fg = colors.comments, italic = true },
		NonText = { fg = colors.background },
		Keyword = { fg = colors.purple },
		Repeat = { fg = colors.purple },
		Conditional = { fg = colors.purple },
		Statement = { fg = colors.purple },
		Include = { fg = colors.purple },
		Function = { fg = colors.blue },
		String = { fg = colors.green },
		Delimiter = { fg = colors.cyan },
		Operator = { fg = colors.cyan },
		PreProc = { fg = colors.cyan },
		Special = { fg = colors.violet },
		Constant = { fg = colors.orange },
		Todo = { fg = colors.orange },
		Title = { fg = colors.yellow },
		Type = { fg = colors.yellow },
		Tag = { fg = colors.yellow },
		SpellBad = { undercurl = true, sp = colors.orange },
		SpellCap = { undercurl = true, sp = colors.blue },
		SpellRare = { undercurl = true, sp = colors.violet },
		SpellLocal = { undercurl = true, sp = colors.cyan },
		Noise = { fg = colors.cyan },
		SpecialKey = { fg = colors.line_numbers },

		-- Git
		DiffAdd = { bg = colors.diff_add_background },
		DiffDelete = { bg = colors.background, fg = colors.line_numbers },
		DiffChange = { bg = colors.diff_add_background },
		DiffText = { bg = colors.diff_add_highlight },
		gitcommitHeader = { fg = colors.purple },
		gitcommitOverflow = { fg = colors.red },
		gitcommitUnmerged = { fg = colors.green },
		gitcommitSelectedFile = { fg = colors.green },
		gitcommitDiscardedFile = { fg = colors.red },
		gitcommitUnmergedFile = { fg = colors.yellow },
		gitcommitSelectdType = { fg = colors.green },
		gitcommitSummary = { fg = colors.blue },
		gitcommitDiscardedType = { fg = colors.red },

		-- LSP
		DiagnosticError = { fg = colors.red },
		DiagnosticUnderlineError = { fg = "NONE", undercurl = true, sp = colors.red },
		DiagnosticWarn = { fg = colors.orange },
		DiagnosticUnderlineWarn = { fg = "NONE", undercurl = true, sp = colors.orange },
		DiagnosticInfo = { fg = colors.blue },
		DiagnosticUnderlineInfo = { fg = "NONE", undercurl = true, sp = colors.blue },
		DiagnosticHint = { fg = colors.foreground_darker },
		DiagnosticUnderlineHint = { fg = colors.comments, undercurl = true, sp = colors.comments },
		LspReferenceText = { bg = colors.references },
		LspReferenceRead = { bg = colors.references },
		LspReferenceWrite = { bg = colors.references },
		LspDiagnosticsVirtualTextError = { fg = "#9e4057" },
		LspDiagnosticsVirtualTextWarning = { fg = "#9a6054" },

		-- Treesitter
		["@constructor"] = { link = "Type" },
		["@tag"] = { link = "Tag" },
		["@tag.delimiter"] = { fg = colors.foreground_darker },
		["@tag.attribute"] = { link = "Normal" },
		["@variable.builtin"] = { link = "Constant" },
		["@variable"] = { link = "Normal" },
		["@function.builtin"] = { link = "Function" },
		["@constant.builtin"] = { link = "Constant" },
		["@text.literal"] = { fg = colors.foreground_darker },
		["@text.title"] = { link = "Title" },
		["@text.uri"] = { fg = colors.blue, underline = true },
		["@text.reference"] = { fg = colors.green },
		["@text.strong"] = { bold = true },
		["@text.emphasis"] = { italic = true },
		["@type.qualifier"] = { link = "Keyword" },

		-- DEPRECATED: nvim-treesitter has removed these highlight groups
		-- https://github.com/nvim-treesitter/nvim-treesitter/issues/2293#issuecomment-1279974776
		TSConstructor = { fg = colors.yellow },
		TSTag = { fg = colors.yellow },
		TSTagDelimiter = { fg = colors.foreground_darker },
		TSVariableBuiltin = { fg = colors.orange },
		TSVariable = { fg = colors.foreground },
		TSKeywordOperator = { fg = colors.purple },
		TSConstBuiltin = { fg = colors.orange },
		TSFuncBuiltin = { fg = colors.blue },
		TSLiteral = { fg = colors.foreground_darker },
		TSNote = { fg = colors.cyan },

		-- Markdown
		markdownCode = { fg = colors.foreground_darker },
		markdownCodeDelimiter = { fg = colors.foreground_darker },

		-- Vimscript
		vimOption = { fg = colors.yellow },

		-- plasticboy/vim-markdown
		mkdHeading = { fg = colors.green },
		mkdListItem = { fg = colors.cyan },
		mkdCode = { fg = colors.foreground_darker },
		mkdCodeDelimiter = { fg = colors.foreground_darker },

		-- lewis6991/gitsigns.nvim
		GitSignsAdd = { fg = colors.green },
		GitSignsChange = { fg = colors.orange },
		GitSignsDelete = { fg = colors.red },
		GitSignsDeletePreview = { fg = colors.foreground, bg = colors.diff_delete_background },
		GitSignsAddInline = { bg = colors.diff_add_highlight },
		GitSignsDeleteInline = { bg = colors.diff_delete_hightlight },

		-- tpope/vim-fugitive
		diffAdded = { fg = colors.green },
		diffRemoved = { fg = colors.red },

		-- hrsh7th/nvim-cmp
		CmpDocumentation = { bg = colors.background_darker },
		CmpItemAbbrDefault = { fg = colors.foreground },

		CmpItemAbbr = { fg = colors.foreground },
		CmpItemAbbrDeprecated = { fg = colors.foreground_darker, strikethrough = true },
		CmpItemAbbrMatch = { fg = colors.blue },
		CmpItemAbbrMatchFuzzy = { fg = colors.blue },

		CmpItemMenu = { fg = colors.comments },

		CmpItemKindDefault = { fg = colors.foreground_darker },

		CmpItemKindKeyword = { fg = colors.purple },
		CmpItemKindReference = { fg = colors.purple },
		CmpItemKindValue = { fg = colors.purple },
		CmpItemKindVariable = { fg = colors.purple },

		CmpItemKindConstant = { fg = colors.orange },
		CmpItemKindEnum = { fg = colors.orange },
		CmpItemKindEnumMember = { fg = colors.orange },
		CmpItemKindOperator = { fg = colors.orange },
		CmpItemKindField = { fg = colors.orange },

		CmpItemKindFunction = { fg = colors.blue },
		CmpItemKindMethod = { fg = colors.blue },

		CmpItemKindConstructor = { fg = colors.yellow },
		CmpItemKindClass = { fg = colors.yellow },
		CmpItemKindInterface = { fg = colors.yellow },
		CmpItemKindStruct = { fg = colors.yellow },
		CmpItemKindEvent = { fg = colors.yellow },
		CmpItemKindUnit = { fg = colors.yellow },
		CmpItemKindFile = { fg = colors.yellow },
		CmpItemKindFolder = { fg = colors.yellow },

		CmpItemKindModule = { fg = colors.green },
		CmpItemKindProperty = { fg = colors.green },
		CmpItemKindTypeParameter = { fg = colors.green },
		CmpItemKindSnippet = { fg = colors.green },
		CmpItemKindText = { fg = colors.green },

		-- nvim-telescope/telescope.nvim
		TelescopeNormal = { bg = colors.background_darker },
		TelescopeBorder = { fg = colors.background_darker, bg = colors.background_darker },
		TelescopeMatching = { fg = colors.blue },
		TelescopePromptNormal = { bg = colors.references },
		TelescopePromptBorder = { fg = colors.references, bg = colors.references },
		TelescopePromptTitle = { bg = colors.references },
		TelescopePromptPrefix = { fg = colors.blue },
		TelescopeSelectionCaret = { fg = colors.blue, bg = colors.highlight },
		TelescopeSelection = { bg = colors.references },

		-- kyazdani42/nvim-tree.lua
		NvimTreeRootFolder = { fg = colors.green },
		NvimTreeGitDirty = { fg = colors.green },

		-- rcarriga/nvim-notify
		NotifyERRORBorder = { fg = colors.red_dark },
		NotifyERRORIcon = { fg = colors.red },
		NotifyERRORTitle = { fg = colors.red },
		NotifyWARNBorder = { fg = colors.orange_dark },
		NotifyWARNIcon = { fg = colors.orange },
		NotifyWARNTitle = { fg = colors.orange },
		NotifyINFOBorder = { fg = colors.green_dark },
		NotifyINFOIcon = { fg = colors.green },
		NotifyINFOTitle = { fg = colors.green },
		NotifyDEBUGBorder = { fg = colors.foreground_darker },
		NotifyDEBUGIcon = { fg = colors.foreground_darker },
		NotifyDEBUGTitle = { fg = colors.foreground_darker },
		NotifyLogTitle = { fg = colors.yellow },
		NotifyBackground = { bg = colors.background },

		-- folke/lazy.nvim
		LazyNormal = { bg = colors.background_darker },

		-- tamago324/lir.nvim
		LirDir = { fg = colors.blue },
		LirEmptyDirText = { bg = colors.highlight },
		CursorLineLir = { bg = colors.highlight },

		-- folke/noice.nvim
		NoiceCmdlinePopup = { bg = colors.background_darker },
		NoiceMini = { bg = colors.background_darker },

		-- L3MON4D3/LuaSnip
		LuasnipChoice = { fg = colors.orange },
		LuasnipInsert = { fg = colors.cyan },
	}
end

return M
