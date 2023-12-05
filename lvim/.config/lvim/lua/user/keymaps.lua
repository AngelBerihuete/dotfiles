-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.keys.normal_mode["<C-l>"] = "<cmd> TmuxNavigateRight<CR>"
lvim.keys.normal_mode["<C-h>"] = "<cmd> TmuxNavigateLeft<CR>"
lvim.keys.normal_mode["<C-j>"] = "<cmd> TmuxNavigateDown<CR>"
lvim.keys.normal_mode["<C-k>"] = "<cmd> TmuxNavigateUp<CR>"
--
-- send code with ctrl+Enter
-- just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u

-- lvim.keys.normal_mode["<C-CR>"] = "<Plug>SlimeSendCell"
-- lvim.keys.normal_mode["<S-CR>"] = "<Plug>SlimeSendCell"
-- lvim.keys.imap["<C-CR>"] = "<esc><Plug>SlimeSendCell<cr>i"
-- lvim.keys.imap["<S-CR>"] = "<esc><Plug>SlimeSendCell<cr>i"


-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.which_key.mappings["k"] = {
  name = "spellcheck",
  s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
  ['/'] = { '<cmd>setlocal spell!<cr>', 'spellcheck' },
  n = { ']s', 'next' },
  p = { '[s', 'previous' },
  g = { 'zg', 'good' },
  r = { 'zg', 'rigth' },
  w = { 'zw', 'wrong' },
  b = { 'zw', 'bad' },
  l = {
    name = 'run',
    s = { '<cmd>set spelllang=es<CR>', 'set Spanish' },
    e = { '<cmd>set spelllang=en<CR>', 'set English' },
  },
  ['?'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
}

-- QUARTO mappings from
-- https://github.com/jmbuhr/quarto-nvim-kickstarter/blob/main/lua/config/keymap.lua

lvim.builtin.which_key.mappings["t"] = {
  name = "Code2Terminal",
  m = { "<cmd>mark_terminal<cr>", "Mark terminal" },
  s = { "<cmd>set_terminal<cr>", "Set terminal" },
  t = { "<cmd>toggle_slime_tmux_nvim<cr>", "Toogle slime tmux nvim" },
  c = { ':SlimeConfig<cr>', 'slime config' },
  n = { ':split term://$SHELL<cr>', 'new terminal' },
  r = { ':split term://R<cr>', 'new R terminal' },
  p = { ':split term://python<cr>', 'new python terminal' },
  i = { ':split term://ipython<cr>', 'new ipython terminal' },
  j = { ':split term://julia<cr>', 'new julia terminal' },
}

lvim.builtin.which_key.mappings["o"] = {
  name = 'otter',
  a = { require 'otter'.dev_setup, 'activate' },
}

lvim.builtin.which_key.mappings["Q"] = {
  name = 'quarto',
  a = { ":QuartoActivate<cr>", 'activate' },
  p = { ":lua require'quarto'.quartoPreview()<cr>", 'preview' },
  q = { ":lua require'quarto'.quartoClosePreview()<cr>", 'close' },
  h = { ":QuartoHelp ", 'help' },
  r = {
    name = 'run',
    r = { ':QuartoSendAbove<cr>', 'to cursor' },
    a = { ':QuartoSendAll<cr>', 'all' },
  },
  e = { ":lua require'otter'.export()<cr>", 'export' },
  E = { ":lua require'otter'.export(true)<cr>", 'export overwrite' },
}

lvim.builtin.which_key.mappings["Z"] = {
  name = "ChatGPT",
  c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
  e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
  g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
  t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
  k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
  d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
  a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
  o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
  s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
  f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
  x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
  r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
  l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
}
-- vim.opt.spelllang = {en_us, es}
-- lvim.keys.normal_mode['coo'] = { 'o# %%<cr>', 'new code chunk below' }
-- lvim.keys.normal_mode['cOo'] = { 'O# %%<cr>', 'new code chunk above' }
-- lvim.keys.normal_mode['cob'] = { 'o```{bash}<cr>```<esc>O', "bash code chunk" }
-- lvim.keys.normal_mode['cor'] = "o```{r}<cr>```<esc>O"
-- lvim.keys.normal_mode['cop'] = { 'o```{python}<cr>```<esc>O', "python code chunk" }
-- lvim.keys.normal_mode['coj'] = { 'o```{julia}<cr>```<esc>O', "julia code chunk" }
-- lvim.keys.normal_mode['col'] = { 'o```{julia}<cr>```<esc>O', "julia code chunk" }
-- lvim.keys.normal_mode['<m-i>'] = { 'o```{r}<cr>```<esc>O', "r code chunk" }
-- lvim.keys.normal_mode['<cm-i>'] = { 'o```{python}<cr>```<esc>O', "r code chunk" }
-- lvim.keys.normal_mode['<m-I>'] = { 'o```{python}<cr>```<esc>O', "r code chunk" }



-- ['<c-e>'] = { "<esc>:FeMaco<cr>i", "edit code" },
-- lvim.keys.imap['<m-->'] = { ' <- ', "assign" }
-- lvim.keys.imap ['<m-m>'] = { ' |>', "pipe" }
-- lvim.keys.imap ['<m-i>'] = { '```{r}<cr>```<esc>O', "r code chunk" }
-- lvim.keys.imap['<cm-i>'] = { '<esc>o```{python}<cr>```<esc>O', "r code chunk" }
-- lvim.keys.imap ['<m-I>'] = { '<esc>o```{python}<cr>```<esc>O', "r code chunk" }
