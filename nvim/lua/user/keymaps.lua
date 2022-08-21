vim.g.mapleader = ' '
-- require('mapx').setup {
--   global = true
-- }

local wk = require("which-key")

wk.register({
  b = {
    name = "Buffer",
    d = { ":BufferClose<CR>", "Close Buffer" },
    n = { ":BufferNext<CR>", "Next Buffer" },
    p = { ":BufferPrevious<CR>", "Previous Buffer" },
    m = {
      name = "Move",
      l = { ":BufferMoveNext<CR>", "Right" },
      h = { ":BufferMovePrevious<CR>", "Left" },
    },
  },
  f = {
    name = "Telescope",
    f = { ":Telescope find_files<CR>", "Find Files" },
    g = { ":Telescope live_grep<CR>", "Live Grep" },
    b = { ":Telescope buffers<CR>", "Buffers" },
    h = { ":Telescope help_tags<CR>", "Help Tags" },
  },
  e = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
  ["/"] = { ":CommentToggle<CR>", "Comment Line" },
  h = { ":nohls<CR>", "Disable Highlight Search" },
  i = {
    name = "ISwap",
    s = { ":ISwap<CR>", "ISwap" },
    w = { ":ISwapWith<CR>", "ISwapWith" },
  },
  g = { ":LazyGit<CR>", "Open LazyGit" },
}, { prefix = "<leader>" })

wk.register({
  e = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
  ["/"] = { ":'<,'>CommentToggle<CR>", "Comment Selected Lines"},
  v = { ":VBox<CR>", "Draw Venn Diagramm" }
}, { prefix = "<leader>", mode = "v" })
