-- General options
--
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.wrap = true -- wrap lines
vim.diagnostic.config({ virtual_text = false })

vim.opt.textwidth = 80
vim.opt.wrapmargin = 0
-- vim.opt.formatoptions += t
vim.opt.linebreak = true

-- use treesitter folding
vim.opt.foldenable = true
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
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
lvim.log.level = "info"
lvim.builtin.terminal.active = true

vim.g.spellfile_URL = "http://ftp.vim.org/vim/runtime/spell/"



-- Setup Lsp.
-- local capabilities = require("lvim.lsp").common_capabilities()

-- require("lvim.lsp.manager").setup("texlab", {
--   on_attach = require("lvim.lsp").common_on_attach,
--   on_init = require("lvim.lsp").common_on_init,
--   capabilities = capabilities,
-- })

-- setup linting
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", args = { "--ignore=E203" }, filetypes = { "python" } },
  -- { command = "chktex", filetypes = { "tex" }, }
}

-- setup formatting
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "black" },
  { command = "latexindent", filetypes = { "tex" } },
}

lvim.format_on_save.enabled = true
lvim.format_on_save = {
  enabled = true,
  pattern = { "*.lua", "*.py", "*.tex" },
  timeout = 1000,
}

-- ************************
-- Treesitter configuration
-- ************************
--
-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

lvim.builtin.treesitter.ensure_installed = {
  'r', 'python', 'markdown', 'markdown_inline',
  'julia', 'bash', 'yaml', 'lua', 'vim',
  'query', 'vimdoc', 'latex', 'html', 'css',
}

lvim.builtin.treesitter.highlight = {
  enable = true,
  disable = { "latex" },
  -- additional_vim_regex_highlighting = false,
  -- optional (with quarto-vim extension and pandoc-syntax)
  additional_vim_regex_highlighting = { 'latex', 'markdown' },
  --
  -- note: the vim regex based highlighting from
  -- quarto-vim / vim-pandoc sets the wrong comment character
  -- for some sections where there is `$` math.
}

lvim.builtin.treesitter.indent = {
  enable = true
}

lvim.builtin.treesitter.incremental_selection = {
  enable = true,
  keymaps = {
    init_selection = "gnn",
    node_incremental = "grn",
    scope_incremental = "grc",
    node_decremental = "grm",
  },
}

lvim.builtin.treesitter.textobjects = {
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ['af'] = '@function.outer',
      ['if'] = '@function.inner',
      ['ac'] = '@class.outer',
      ['ic'] = '@class.inner',
      ['ao'] = '@codechunk.outer',
      ['io'] = '@codechunk.inner',
    },
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      [']m'] = '@function.outer',
      [']c'] = '@codechunk.inner',
      [']]'] = '@class.outer',
    },
    goto_next_end = {
      [']M'] = '@function.outer',
      [']['] = '@class.outer',
    },
    goto_previous_start = {
      ['[m'] = '@function.outer',
      ['[c'] = '@codechunk.inner',
      ['[['] = '@class.outer',
    },
    goto_previous_end = {
      ['[M'] = '@function.outer',
      ['[]'] = '@class.outer',
    },
  },
}
