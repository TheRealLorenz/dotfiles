
local options = {
  compatible = false,
  number = true,
  relativenumber = true,
  mouse = "a",
  hlsearch = true,
  incsearch = true,
  tabstop = 2,
  softtabstop = 2,
  expandtab = true,
  shiftwidth = 2,
  autoindent = true,
  swapfile = false,
  clipboard = 'unnamedplus',
  ttyfast = true,
  showmode = false,
  termguicolors = true,
  timeoutlen = 500,
  colorcolumn = '80',
  listchars = { eol = '↵', trail = '·', tab = '>-', nbsp = '␣' },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
