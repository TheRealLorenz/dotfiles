
-- General vim config
local set = vim.opt

set.compatible = false
set.number = true
set.relativenumber = true
set.mouse = "v"
set.mouse = "a"
set.hlsearch = true
set.incsearch = true
set.tabstop = 2
set.softtabstop = 2
set.expandtab = true
set.shiftwidth = 2
set.autoindent = true
set.swapfile = false
set.clipboard = "unnamedplus"
set.ttyfast = true
set.showmode = false
set.termguicolors = true
set.listchars = { eol = '↵', space = '·', tab = '>-', nbsp = '␣' }

-- Plugins config
require'plugins'
require'mycmpconfig'
require'mylspconfig'
require'treesitter'
require'tree'
vim.g.dashboard_default_executive = 'telescope'

---- Keymaps
vim.g.mapleader = ' '
require'mapx'.setup{global = true}

-- Disable hlsearch
nnoremap("<Leader>h", ":nohls<CR>", "silent")

-- File explorer
nnoremap("<Leader>e", ":NvimTreeToggle<CR>", "silent")

-- Exiting
nnoremap("<Leader>q", ":q<CR>", "silent")

-- Buffer manipulation (all begin with b)
nnoremap("<Leader>bd", ":BufferClose<CR>", "silent")
nnoremap("<Leader>bn", ":BufferNext<CR>", "silent")
nnoremap("<Leader>bp", ":BufferPrevious<CR>", "silent")
nnoremap("<Leader>bmn", ":BufferMoveNext<CR>", "silent")
nnoremap("<Leader>bmp", ":BufferMovePrevious<CR>", "silent")
nnoremap("<S-l>", ":BufferNext<CR>", "silent")
nnoremap("<S-h>", ":BufferPrevious<CR>", "silent")


-- Buffer movement
nnoremap("<C-h>", ":wincmd h<CR>", "silent")
nnoremap("<C-j>", ":wincmd j<CR>", "silent")
nnoremap("<C-k>", ":wincmd k<CR>", "silent")
nnoremap("<C-l>", ":wincmd l<CR>", "silent")

