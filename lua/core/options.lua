local opt = vim.opt


-- Line Numbers
opt.number = true
opt.relativenumber = true


-- Tabs & Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true


-- Line wrapping
opt.wrap = false

-- Search settings
opt.ignorecase = true
opt.smartcase = true


-- Cursor Line
opt.cursorline = true


-- Appereance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")


-- Split windows
opt.splitright = true
opt.splitbelow = true


-- Consider hyphenated words as a single word
opt.iskeyword:append("-")
