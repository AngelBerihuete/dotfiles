lvim.builtin.treesitter.ensure_installed = {
  'r', 'python', 'markdown', 'markdown_inline',
  'julia', 'bash', 'yaml', 'lua', 'vim',
  'query', 'vimdoc', 'latex', 'html', 'css',
}

lvim.builtin.treesitter.highlight = {
  enable = true,
  additional_vim_regex_highlighting = false,
  -- optional (with quarto-vim extension and pandoc-syntax)
  -- additional_vim_regex_highlighting = { 'markdown' },
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

