-- ===================================
--     Plugin Manager and Plugins
-- ===================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'machakann/vim-highlightedyank',
  'tpope/vim-commentary',
  'nvim-lualine/lualine.nvim'
})

-- ===================================
--      Lualine Configuration
-- ===================================

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'powerline_dark',
    section_separators = {'', ''},
    component_separators = {'|', '|'},
    disabled_filetypes = {},
    always_active = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})
-- ===================================
--testing 
--      General Neovim Settings
-- ===================================

-- Remap 'jj' to Escape in Insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- leader key maps
vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<leader>d', '"_dd', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':wq<CR>', { noremap = true, silent = true })



--
-- end of leader maps
-- Set clipboard option for system clipboard
vim.o.clipboard = 'unnamedplus'

-- Show context lines around the cursor
vim.o.scrolloff = 5

-- Enable incremental searching
vim.o.incsearch = true

-- Re-map 'Q' to format a block of text
vim.api.nvim_set_keymap('n', 'Q', 'gq', { noremap = false, silent = true })

-- Enable line numbers
vim.o.number = true
vim.o.cursorline = true

-- ===================================
--      Plugin-Specific Settings
-- ===================================

-- Highlight yanked text
vim.g.highlightedyank_highlight_duration = 200
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, 'Highlightedyank', { bg = 'green', fg = 'white' })
  end
})

-- ===================================
--    VS Code Specific Settings
-- ===================================

if vim.g.vscode then
else
end
