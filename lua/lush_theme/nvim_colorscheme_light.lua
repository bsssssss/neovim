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
	-- base = hsl("#fff9f4"),
	base = hsl(26, 100, 100),
	normal_text = hsl(0, 0, 0),
	accent = hsl(1, 50, 42),

	r = hsl(0, 58, 50),
	g = hsl(84, 33, 36),
	b = hsl(220, 33, 45),
	v = hsl(286, 33, 45),
	y = hsl(39, 96, 40),
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

		Normal      { bg = "NONE", fg = colors.normal_text },       -- Normal text
		NormalFloat { bg = Normal.bg },                            -- Normal text in floating windows.
		Visual      { bg = colors.base.mix(colors.normal_text, 7).de(25) }, -- Visual mode selection
		VisualNOS   { bg = Visual.bg },                            -- Visual mode selection when vim is "Not Owning the Selection".
		CursorLine  { bg = Visual.bg.li(30) },  -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		ModeMsg     { bold = true },                               -- 'showmode' message (e.g., "-- INSERT -- ")
		LineNr      { fg = colors.normal_text.mix(colors.base, 60).de(50) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		FloatBorder { fg = LineNr.fg }, -- Border of floating windows.

		SnacksIndent      { fg = CursorLine.bg.de(30) },
		SnacksIndentScope { fg = CursorLine.bg.da(12).de(30) },

		OkMsg { fg = colors.g },
		WarningMsg { fg = colors.y },
		ErrorMsg { fg = colors.r },
		MoreMsg { fg = colors.b },

		DiagnosticError            { ErrorMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn             { WarningMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo             { MoreMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint             { fg = colors.v } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk               { OkMsg } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)

		MatchParen     { fg = colors.accent, bg = colors.accent.mix(colors.base, 86), bold = true, underline = true }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|

		Added   { fg = colors.g },
		Removed { fg = colors.r },
		Changed { fg = colors.v },

		GitSignsAdd { fg = Added.fg.li(60).de(45) },
		GitSignsRemove { fg = Removed.fg.li(50) },
		GitSignsDelete { fg = Removed.fg.li(50) },
		GitSignsChange { fg = Changed.fg.li(70).sa(10) },

		Title          { bold = true, fg = colors.accent }, -- Titles for output from ":set all", ":autocmd" etc.

		ColorColumn    { CursorLine }, -- Columns set with 'colorcolumn'
		-- Conceal        { }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		-- Cursor         { }, -- Character under the cursor
		CurSearch      { bg = colors.accent.mix(colors.base, 75), fg = colors.accent }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		-- lCursor        { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM       { }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn   { CursorLine }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		Directory      { fg = colors.b }, -- Directory names (and other special names in listings)
		DiffAdd        { Added }, -- Diff mode: Added line |diff.txt|
		DiffChange     { Changed }, -- Diff mode: Changed line |diff.txt|
		DiffDelete     { Removed }, -- Diff mode: Deleted line |diff.txt|
		DiffText       { }, -- Diff mode: Changed text within a changed line |diff.txt|
		-- EndOfBuffer    { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		-- ErrorMsg       { }, -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		Folded         { bg = CursorLine.bg }, -- Line used for closed folds
		-- FoldColumn     { }, -- 'foldcolumn'
		-- SignColumn     { }, -- Column where |signs| are displayed
		-- IncSearch      { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		-- LineNr         { fg = colors.normal_text.mix(colors.base, 75).de(50) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr   { fg = LineNr.fg.da(20), bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		StatusLine     { bg = CursorLine.bg, fg = colors.normal_text.mix(colors.base, 20) }, -- Status line of current window
		StatusLineNC   { fg = StatusLine.fg.li(30) }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		MsgArea        { fg = StatusLine.fg }, -- Area for messages and cmdline
		-- MsgSeparator   { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		-- MoreMsg        { }, -- |more-prompt|
		-- NonText        { }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		-- FloatTitle     { }, -- Title of floating windows.
		-- NormalNC       { }, -- normal text in non-current windows
		Pmenu          { fg = colors.normal_text.li(20), bg = CursorLine.bg }, -- Popup menu: Normal item.
		PmenuSel       { fg = colors.normal_text.li(20), bold = true, bg = Visual.bg.da(4) }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		-- PmenuSbar      { }, -- Popup menu: Scrollbar.
		PmenuThumb     { bg = CursorLine.bg.li(10) },  -- Popup menu: Thumb of the scrollbar.
		Question       { fg = colors.b.de(50) }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine   { bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search         { bg = CurSearch.bg.mix(colors.base, 50), fg = CurSearch.fg }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		Substitute     { fg = Search.fg, bg = Search.bg, bold = true }, -- |:substitute| replacement text highlighting
		-- SpecialKey     { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		-- SpellBad       { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		-- SpellCap       { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		-- SpellLocal     { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		-- SpellRare      { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		-- TabLine        { }, -- Tab pages line, not active tab page label
		-- TabLineFill    { }, -- Tab pages line, where there are no labels
		TabLineSel     { bold = true, bg = Visual.bg }, -- Tab pages line, active tab page label
		-- Whitespace     { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator   { fg = CursorLine.bg.da(2) }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		-- WildMenu       { }, -- Current match in 'wildmenu' completion
		WinBar         {  }, -- Window bar of current window
		WinBarNC       { fg = StatusLine.fg.li(30) }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- Commented-out groups should chain up to their preferred (*) group
		-- by default.
		--
		-- See :h group-name
		--
		-- Uncomment and edit if you want more specific syntax highlighting.

		Comment        { fg = colors.normal_text.mix(colors.base, 50).de(50) }, -- Any comment

		Constant       {fg = colors.r.de(50).da(8), bold = true}, -- (*) Any constant
		String         { fg = colors.g }, --   A string constant: "this is a string"
		Character      { String }, --   A character constant: 'c', '\n'
		Number         { fg = colors.v }, --   A number constant: 234, 0xff
		Float          { Number }, --   A floating point constant: 2.3e10
		Boolean        { fg = Number.fg, bold = true }, --   A boolean constant: TRUE, false

		Function       { fg = colors.b.da(15) }, --   Function name (also: methods for classes)

		Identifier     { fg = colors.normal_text }, -- (*) Any variable name
		Statement      { }, -- (*) Any statement
		Conditional    { }, --   if, then, else, endif, switch, etc.
		Repeat         { bg = colors.base }, --   for, do, while, etc.
		Label          { fg = colors.v }, --   case, default, etc.
		Operator       { fg = colors.normal_text.li(45) }, --   "sizeof", "+", "*", etc.
		Keyword        { fg = colors.accent, bold = true }, --   any other keyword
		Exception      { Keyword }, --   try, catch, throw

		PreProc        { fg = colors.v }, -- (*) Generic Preprocessor
		Include        { fg = colors.v }, --   Preprocessor #include
		Define         { fg = colors.r }, --   Preprocessor #define
		Macro          { fg = colors.r }, --   Same as Define
		PreCondit      { fg = colors.v }, --   Preprocessor #if, #else, #endif, etc.

		Special        { fg = colors.normal_text.li(42), bold = true }, -- (*) Any special symbol
		SpecialChar    { fg = colors.accent, bold = true }, --   Special character in a constant
		Tag            { fg = colors.v.de(30) }, --   You can use CTRL-] on this
		Delimiter      { fg = colors.accent }, --   Character that needs attention
		SpecialComment { fg = Comment.fg.da(15), bold = true }, --   Special things inside a comment (e.g. '\n')
		Debug          { }, --   Debugging statements

		Type           { fg = colors.normal_text.li(42), bold = true }, -- (*) int, long, char, etc.
		StorageClass   { Type }, --   static, register, volatile, etc.
		Structure      { Type }, --   struct, union, enum, etc.
		Typedef        { Type }, --   A typedef

		Underlined     { gui = "underline", fg = colors.v }, -- Text that stands out, HTML links
		Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error          { ErrorMsg }, -- Any erroneous construct
		Todo           { fg = colors.v, bg = colors.accent.mix(colors.base, 90) }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- These groups are for the native LSP client and diagnostic system. Some
		-- other LSP clients may use these groups, or use their own. Consult your
		-- LSP client's documentation.

		-- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
		--
		LspReferenceText            { bold = true } , -- Used for highlighting "text" references
		LspReferenceRead            { bold = true } , -- Used for highlighting "read" references
		LspReferenceWrite           { underline = true } , -- Used for highlighting "write" references
		-- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		-- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

		-- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
		--
		-- DiagnosticVirtualTextError { fg = DiagnosticError.fg.mix(colors.base, 20).de(10) } , -- Used for "Error" diagnostic virtual text.
		-- DiagnosticVirtualTextWarn  { fg = DiagnosticWarn.fg.mix(colors.base,  20).de(10) } , -- Used for "Warn" diagnostic virtual text.
		-- DiagnosticVirtualTextInfo  { fg = DiagnosticInfo.fg.mix(colors.base,  20).de(10) } , -- Used for "Info" diagnostic virtual text.
		-- DiagnosticVirtualTextHint  { fg = DiagnosticHint.fg.mix(colors.base,  20).de(10) } , -- Used for "Hint" diagnostic virtual text.
		-- DiagnosticVirtualTextOk    { fg = DiagnosticOk.fg.mix(colors.base,    20).de(10) } , -- Used for "Ok" diagnostic virtual text.
		DiagnosticUnderlineError   { undercurl = true, sp = colors.r.mix(colors.base, 20) }, -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn    { undercurl = true, sp = colors.y.mix(colors.base, 20) }, -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo    { undercurl = true, sp = colors.b.mix(colors.base, 20) }, -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint    { undercurl = true, sp = colors.v.mix(colors.base, 20) }, -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk      { undercurl = true, sp = colors.g.mix(colors.base, 20) }, -- Used to underline "Ok" diagnostics.
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
		-- sym"@variable.parameter" { }, -- Identifier

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo
		-- sym"@comment"           { }, -- Comment
		sym"@punctuation"       { fg = colors.normal_text.li(25) }, -- Delimiter
		-- sym"@constant"          { }, -- Constant
		-- sym"@constant.builtin"  { }, -- Special
		-- sym"@constant.macro"    { }, -- Define
		-- sym"@define"            { }, -- Define
		sym"@macro"             { fg = colors.r.de(25).da(8) }, -- Macro
		sym"@lsp.type.macro"    { fg = colors.r.de(25).da(8) }, -- Macro
		-- sym"@string"            { }, -- String
		sym"@string.escape"     { fg = colors.accent, bold = true }, -- SpecialChar
		-- sym"@string.special"    { }, -- SpecialChar
		-- sym"@character"         { }, -- Character
		-- sym"@character.special" { }, -- SpecialChar
		-- sym"@number"            { }, -- Number
		-- sym"@boolean"           { }, -- Boolean
		-- sym"@float"             { }, -- Float
		-- sym"@function"          { }, -- Function
		-- sym"@function.builtin"  { }, -- Special
		-- sym"@function.macro"    { }, -- Macro
		-- sym"@parameter"         { }, -- Identifier
		-- sym"@method"            { }, -- Function
		-- sym"@field"             { }, -- Identifier
		sym"@property"          { fg = colors.normal_text.li(30) }, -- Identifier
		-- sym"@constructor"       { }, -- Special
		-- sym"@conditional"       { }, -- Conditional
		-- sym"@repeat"            { }, -- Repeat
		-- sym"@label"             { }, -- Label
		-- sym"@operator"          { }, -- Operator
		-- sym"@keyword"           { }, -- Keyword
		-- sym"@keyword.operator"     { fg = Operator.fg, bold = true }, -- Keyword
		sym"@keyword.import"       { fg = Special.fg, bold = false }, -- Keyword
		sym"@keyword.directive"    { fg = Special.fg, bold = false }, -- Keyword
		-- sym"@exception"         { }, -- Exception
		-- sym"@type"              { }, -- Type
		sym"@type.class"           { fg = colors.b, bold = true }, -- Type
		-- sym"@type.definition"   { }, -- Typedef
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@namespace"         { }, -- Identifier
		-- sym"@include"           { }, -- Include
		-- sym"@preproc"           { }, -- PreProc
		-- sym"@debug"             { }, -- Debug
		-- sym"@tag"               { }, -- Tag

		sym"@lsp.typemod.keyword.documentation.lua" { fg = Comment.fg, bold = true },
		sym"@lsp.typemod.variable.definition.lua" { fg = Special.fg, italic = true, bold = true },
		sym"@lsp.mod.defaultLibrary.lua" { fg = Function.fg, bold = true },
		sym"@function.builtin.lua" { fg = Function.fg, bold = true },

		sym"@lsp.mod.global" { fg = Special.fg },

		sym"@markup.raw.block.markdown" { fg = Special.fg, bold = false },
		sym"@markup.raw.block.vimdoc" { fg = Special.fg, bold = false },

		sym"@string.special.symbol.supercollider" { fg = String.fg, bold = true },
		sym"@type.supercollider" { fg = Type.fg, bold = true },
		sym"@variable.builtin.supercollider" { fg = Special.fg, bold = false, italic = true },
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
