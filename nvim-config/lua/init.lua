-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.winborder = 'rounded'  -- Options: 'single', 'double', 'rounded', 'solid', or 'shadow'


require("QuickFixCompanion")

require("toggleterm").setup()

require("mycodecompanion")

require("markview").setup({
  preview = {
    filetypes = { "markdown", "markdown_inline","codecompanion" },
    ignore_buftypes = {},
    icon_provider = "devicons", -- "mini" or "devicons"
  },
})

require('outline').setup({
  winwidth = 35,
  auto_preview = true,
  auto_close = false,
  auto_refresh = true,
  show_numbers = true,
  show_relative_numbers = false,
  show_file_icons = true,
  show_git_status = true,
})
require('completion')
--require('lsp')

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 35,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})

vim.lsp.enable("ts_ls")
vim.lsp.enable("luals")
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('dartls')
require('mylsp')

vim.diagnostic.config({
  virtual_text = true,      -- show inline error/warning messages
  virtual_lines = false,    -- optionally disable virtual_lines if used
  signs = true,             -- show signs in the sign column (gutter)
})

require("nulllinter")
require('whitespace-nvim').setup({
  -- configuration options and their defaults

  -- `highlight` configures which highlight is used to display
  -- trailing whitespace
  highlight = 'DiffDelete',

  -- `ignored_filetypes` configures which filetypes to ignore when
  -- displaying trailing whitespace
  ignored_filetypes = { 'TelescopePrompt', 'Trouble', 'help', 'dashboard' },

  -- `ignore_terminal` configures whether to ignore terminal buffers
  ignore_terminal = true,

  -- `return_cursor` configures if cursor should return to previous
  -- position after trimming whitespace
  return_cursor = true,
})

-- remove trailing whitespace with a keybinding
vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)

require('haunt').setup{
    window = {
      width_frac = 0.7,
      height_frac = 0.7,
      winblend = 0,
      title_pos = "center",
    },
  }

require('lualine').setup({
  options = {
    theme = 'solarized_light',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'dashboard', 'NvimTree', 'Outline', 'markview' },
      winbar = { 'dashboard', 'NvimTree', 'Outline', 'markview' },
    },
  },
    tabline = {
      lualine_a = { 'buffers' },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'tabs' },
    },
})

require'nvim-treesitter.configs'.setup{highlight={enable=false}}
