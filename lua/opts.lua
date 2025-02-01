local opt = vim.opt
local api = vim.api
--cursor

api.nvim_set_hl(0, "InsertCursor", { bg = "#96CBFE" })

opt.guicursor = "i:block-InsertCursor"

--hlsearch
opt.hlsearch = false

--line numbers
opt.number = true
opt.relativenumber = true

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

opt.termguicolors = true

-- Tabwidth
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

opt.scrolloff = 16

-- For Oil.nvim preview split
opt.splitright = true

opt.clipboard = "unnamedplus"

-- Remove tilde on end of buffers
opt.fillchars = { eob = " " }

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
