-- General options
--
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = { "*.lua", "*.py" },
  timeout = 1000,
}

-- lvim.lsp.diagnostics.virtual_text = false
vim.diagnostic.config({virtual_text=false})
lvim.builtin.terminal.active = true

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- -- Change theme settings
-- lvim.colorscheme = "lunar"
-- lvim.builtin.theme.tokyonight.options.style = "moon"
-- catppuccin-macchiato
lvim.colorscheme = "catppuccin-frappe"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }
-- automatically install python syntax highlighting

vim.g.spellfile_URL = "http://ftp.vim.org/vim/runtime/spell/"


