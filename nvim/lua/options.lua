vim.opt.number = true
vim.opt.relativenumber = true

-- F7 and F8 for tab
vim.api.nvim_set_keymap('n', '<F7>', ':tabp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F8>', ':tabn<CR>', { noremap = true })

-- Scroll offset
vim.opt.scrolloff = 8

-- Set highlight on search
vim.o.hlsearch = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 500

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- make windows the samue width when closing one
vim.opt.equalalways = true

-- Allows neovim to send the Terminal details of the current window
vim.opt.title = true

vim.wo.fillchars = 'eob: '

vim.cmd [[colorscheme github_dark]]
