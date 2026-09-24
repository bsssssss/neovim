--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require("lush")
local hsl = lush.hsl

local colors = {
	base = hsl("#202022"),
	w = hsl(14, 12, 74),
	accent = hsl(19, 70, 62),

	r = hsl(0, 31, 52),
	g = hsl(93, 5, 52),
	b = hsl(225, 10, 62),
	v = hsl(269, 10, 55),
	y = hsl(30, 36, 57),

	r2 = hsl(10, 18, 54),
	b2 = hsl(217, 10, 58),
}

-- colors.b = colors.b.mix(colors.base,11)

local text = {
	normal = colors.w.mix(colors.base, 15),
	dim = colors.w.mix(colors.base, 25),
	ghost = colors.w.mix(colors.base, 57),
}

local overlay = {
	shade1 = colors.base.mix(colors.w, 3),
	shade2 = colors.base.mix(colors.w, 20),
	shade3 = colors.base.mix(colors.w, 33),
	shade4 = colors.base.mix(colors.w, 50),
}

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym
	return {
		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
		-- groups, mostly used for styling UI elements.
		-- Comment them out and add your own properties to override the defaults.
		-- An empty definition `{}` will clear all styling, leaving elements looking
		-- like the 'Normal' group.
		-- To be able to link to a group, it must already be defined, so you may have
		-- to reorder items as you go.
		--
		-- See :h highlight-groups
		--

		Normal      { fg = text.normal, bg = "NONE" },       -- Normal text
		NormalFloat { Normal },                            -- Normal text in floating windows.
		FloatBorder { fg = overlay.shade2 }, -- Border of floating windows.
		Visual      { bg = overlay.shade2.da(23) }, -- Visual mode selection
		VisualNOS   { bg = Visual.bg },                            -- Visual mode selection when vim is "Not Owning the Selection".
		CursorLine  { bg = overlay.shade1  },  -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		ModeMsg     { fg = colors.y, bold = true },                               -- 'showmode' message (e.g., "-- INSERT -- ")

		SnacksIndent      { fg = overlay.shade1.li(2) },
		SnacksIndentScope { fg = overlay.shade2.da(20) },

		OkMsg { fg = colors.g },
		WarningMsg { fg = colors.y.mix(colors.base, 10) },
		ErrorMsg { fg = colors.r },
		MoreMsg { fg = colors.b },

		DiagnosticError            { ErrorMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn             { WarningMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo             { MoreMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint             { fg = colors.v } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk               { OkMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)

		MatchParen     { fg = colors.accent, bg = Visual.bg, bold = true }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		Added   { fg = colors.g },
		Removed { fg = colors.r },
		Changed { fg = colors.v },

		GitSignsAdd { fg = Added.fg.mix(colors.base, 50) },
		GitSignsRemove { fg = Removed.fg.mix(colors.base, 60) },
		GitSignsDelete { fg = Removed.fg.mix(colors.base, 60) },
		GitSignsChange { fg = Changed.fg.mix(colors.base, 75) },

		Title          { bold = true, fg = colors.y }, -- Titles for output from ":set all", ":autocmd" etc.

		ColorColumn    { CursorLine }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor         { }, -- Character under the cursor
		CurSearch      { bg = colors.accent.mix(colors.base, 85), fg = colors.accent }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		-- CursorColumn   { }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		Directory      { fg = colors.b.de(10).da(9) }, -- Directory names (and other special names in listings)
		DiffAdd        { Added }, -- Diff mode: Added line |diff.txt|
		DiffChange     { Changed }, -- Diff mode: Changed line |diff.txt|
		DiffDelete     { Removed }, -- Diff mode: Deleted line |diff.txt|
		DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		-- ErrorMsg       { }, -- Error messages on the command line
		Winseparator   { fg = colors.base }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- VertSplit      { }, -- Column separating vertically split windows
		Folded         { bg = CursorLine.bg }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- Substitute     { }, -- |:substitute| replacement text highlighting
		LineNr         { fg = overlay.shade2 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr   { fg = text.dim.da(15), bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		MsgArea        { fg = text.dim }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		-- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		Pmenu          { fg = text.ghost, bg = CursorLine.bg }, -- Popup menu: Normal item.
		PmenuSel       { fg = text.normal, bold = true }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- diagnostics
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		PmenuThumb     { bg = CursorLine.bg.li(10) },  -- Popup menu: Thumb of the scrollbar.
		Question       { fg = colors.b.de(50) }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine   { bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search         { bg = CurSearch.bg.mix(colors.base, 70), fg = CurSearch.fg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine     { bg = CursorLine.bg, fg = text.dim }, -- Status line of current window
		StatusLineNC   { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		TabLine        { fg = colors.w.da(50) }, -- Tab pages line, not active tab page label
		TabLineFill    { fg = colors.w.da(50) }, -- Tab pages line, where there are no labels
		TabLineSel     { bg = Visual.bg.da(10), bold = true, fg = colors.w.da(20) }, -- Tab pages line, active tab page label
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		WinBar         { fg = colors.w.da(20) }, -- Window bar of current window
		WinBarNC       { fg = colors.w.da(50) }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment        { fg = text.ghost }, -- Any comment

		Constant       { fg = colors.r2 }, -- (*) Any constant
		String         { fg = colors.g }, --   A string constant: "this is a string"
		Character      { String }, --   A character constant: 'c', '\n'
		Number         { fg = colors.v }, --   A number constant: 234, 0xff
		Boolean        { fg = Number.fg, bold = true }, --   A boolean constant: TRUE, false
		Float          { Number }, --   A floating point constant: 2.3e10

		Function       { fg = colors.b }, --   Function name (also: methods for classes)

		Special        { fg = colors.base.li(35).ro(10).de(30), bold = true }, -- (*) Any special symbol
		Identifier     { fg = colors.w }, -- (*) Any variable name
		Statement      { }, -- (*) Any statement
		Conditional    { fg = colors.y }, --   if, then, else, endif, switch, etc.
		Repeat         { fg = colors.y }, --   for, do, while, etc.
		Label          { fg = colors.b }, --   case, default, etc.
		Operator       { fg = colors.base.mix(colors.w, 66).de(40) }, --   "sizeof", "+", "*", etc.
		Keyword        { fg = colors.y }, --   any other keyword
		Exception      { Keyword }, --   try, catch, throw

		PreProc        { fg = colors.v }, -- (*) Generic Preprocessor
		Include        { fg = colors.v }, --   Preprocessor #include
		Define         { fg = colors.r }, --   Preprocessor #define
		Macro          { fg = colors.r }, --   Same as Define
		PreCondit      { fg = colors.v }, --   Preprocessor #if, #else, #endif, etc.

		SpecialChar    { fg = colors.y, bold = false }, --   Special character in a constant
		Tag            { fg = colors.v }, --   You can use CTRL-] on this
		Delimiter      { fg = colors.accent }, --   Character that needs attention
		SpecialComment { fg = Comment.fg.li(10), bold = true }, --   Special things inside a comment (e.g. '\n')
		Debug          { }, --   Debugging statements

		Type           { fg = Special.fg, bold = false }, -- (*) int, long, char, etc.
		StorageClass   { Type }, --   static, register, volatile, etc.
		Structure      { Type }, --   struct, union, enum, etc.
		Typedef        { Type }, --   A typedef

		Underlined     { gui = "underline", fg = colors.v }, -- Text that stands out, HTML links
		Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error          { ErrorMsg }, -- Any erroneous construct
		Todo           { fg = colors.v, bg = colors.accent.mix(colors.base, 82) }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		LspReferenceText            { bg = Visual.bg } , -- Used for highlighting "text" references
		LspReferenceRead            { bg = Visual.bg } , -- Used for highlighting "read" references
		LspReferenceWrite           { bg = Visual.bg, underline = true } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		DiagnosticVirtualTextError { fg = DiagnosticError.fg.mix(colors.base, 14).de(10) } , -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn  { fg = DiagnosticWarn.fg.mix(colors.base,  20).de(0) } , -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo  { fg = DiagnosticInfo.fg.mix(colors.base,  50).de(0) } , -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint  { fg = DiagnosticHint.fg.mix(colors.base,  40).de(0) } , -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk    { fg = DiagnosticOk.fg.mix(colors.base,    10).de(0) } , -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError   { undercurl = true, sp = colors.r.mix(colors.base, 40) }, -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn    { undercurl = true, sp = colors.y.mix(colors.base, 40) }, -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo    { undercurl = true, sp = colors.b.mix(colors.base, 40) }, -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint    { undercurl = true, sp = colors.v.mix(colors.base, 40) }, -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk      { undercurl = true, sp = colors.g.mix(colors.base, 40) }, -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		DapUIValue { fg = colors.v },
		DapUIVariable { fg = Special.fg },
		DapUIScope { fg = Comment.fg, bold = true },

		TelescopeTitle { Title },
		TelescopeBorder { FloatBorder },
		TelescopeResultsNormal { Comment },

		WhichKey { fg = colors.y, bold = true },
		WhichKeyDesc { fg = text.dim },
		WhichKeyGroup { fg = colors.v },

		-- Tree-Sitter syntax groups.
		--
		-- See :h treesitter-highlight-groups, some groups may not be listed,
		-- submit a PR fix to lush-template!
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be
		-- specially handled to be valid lua code, we do this via the special
		-- sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		sym"@variable"           { Identifier }, -- Identifier
		sym"@variable.parameter" { fg = Identifier.fg.da(0) }, -- Identifier
		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		sym"@punctuation"       { fg = Operator.fg }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		sym"@macro"             { fg = colors.r.de(30).da(8) }, -- Macro
		sym"@lsp.type.macro"    { fg = colors.r.de(30).da(8) }, -- Macro
		-- sym"@string"            { }, -- String
		-- sym"@string.escape"     { }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		sym"@function.builtin"  { fg = Function.fg, bold = true }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		sym"@property"          { fg = text.dim.li(0) }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		sym"@keyword"           { Keyword }, -- Keyword
		-- sym"@keyword.modifier"    { Special }, -- Keyword
		sym"@keyword.directive" { fg = Type.fg, bold = false }, -- Keyword
		sym"@keyword.import"    { fg = Type.fg, bold = false }, -- Keyword
		-- sym"@keyword.function"    { Special },
		-- sym"@keyword.repeat"      { Special },
		-- sym"@keyword.conditional" { Special },
		sym"@keyword.return"      { fg = colors.y, bold = true },
		sym"@keyword.operator"    { fg = colors.y, bold = false }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@type"              { }, -- Type
		-- sym"@type.class"           { fg = colors.b2, bold = true }, -- Type
		-- sym"@lsp.type.class"       { fg = colors.b2, bold = true },
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag
		sym"@module" { fg = Operator.fg },


		sym"@keyword.lua"                           { Special },
		sym"@keyword.function.lua"                  { Special },
		sym"@lsp.typemod.keyword.documentation.lua" { fg = Comment.fg, bold = true },
		sym"@lsp.typemod.variable.definition.lua"   { fg = Special.fg, italic = true, bold = true },
		sym"@lsp.mod.defaultLibrary.lua"            { fg = Function.fg, bold = true },

		sym"@markup.raw.block.markdown"             { fg = Special.fg, bold = false },
		sym"@markup.raw.block.vimdoc"               { fg = Special.fg, bold = false },

		sym"@string.special.symbol.supercollider"   { fg = String.fg, bold = false },
		sym"@variable.builtin.supercollider"        { fg = Special.fg.li(0), italic = true, bold = true },

		-- LSP

		sym"@lsp.mod.global" { fg = Constant.fg, bold = true },
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
