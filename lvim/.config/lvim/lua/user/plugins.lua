-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {"christoomey/vim-tmux-navigator", lazy = false},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
  'Fymyte/rasi.vim',
  ft = 'rasi',
  },
  {
    --nvim-colorizer
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  -- Python IDE
  "AckslD/swenv.nvim",
  "stevearc/dressing.nvim",
  "mfussenegger/nvim-dap-python",
  "nvim-neotest/neotest",
  "nvim-neotest/neotest-python",
  -- Jump inside the file
  {"phaazon/hop.nvim",
  event = "BufRead",
  config = function()
    require("hop").setup()
    vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
    vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
  end,
  },
  -- Search and replace
  {
  "windwp/nvim-spectre",
  event = "BufRead",
  config = function()
    require("spectre").setup()
  end,
  },
  -- Quarto plugin
  {
    'quarto-dev/quarto-nvim',
    'jmbuhr/otter.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-treesitter/nvim-treesitter-textobjects',
    -- 'neovim/nvim-lspconfig',
    -- 'nvim-treesitter/nvim-treesitter'
 -- send code from python/r/qmd documets to a terminal or REPL
  -- like ipython, R, bash
  {
    'jpalardy/vim-slime',
    init = function()

      vim.b['quarto_is_' .. 'python' .. '_chunk'] = false
      Quarto_is_in_python_chunk = function()
        require 'otter.tools.functions'.is_otter_language_context('python')
      end

      vim.cmd [[
      let g:slime_dispatch_ipython_pause = 100
      function SlimeOverride_EscapeText_quarto(text)
      call v:lua.Quarto_is_in_python_chunk()
      if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
      return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
      else
      return a:text
      end
      endfunction
      ]]

      local function mark_terminal()
        vim.g.slime_last_channel = vim.b.terminal_job_id
        vim.print(vim.g.slime_last_channel)
      end

      local function set_terminal()
        vim.b.slime_config = { jobid = vim.g.slime_last_channel }
      end

      vim.b.slime_cell_delimiter = "# %%"

      -- slime, neovvim terminal
      vim.g.slime_target = "neovim"
      vim.g.slime_python_ipython = 1

      -- -- slime, tmux
      -- vim.g.slime_target = 'tmux'
      -- vim.g.slime_bracketed_paste = 1
      -- vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }

      local function toggle_slime_tmux_nvim()
        if vim.g.slime_target == 'tmux' then
          pcall(function()
            vim.b.slime_config = nil
            vim.g.slime_default_config = nil
          end
          )
          -- slime, neovvim terminal
          vim.g.slime_target = "neovim"
          vim.g.slime_bracketed_paste = 0
          vim.g.slime_python_ipython = 1
        elseif vim.g.slime_target == 'neovim' then
          pcall(function()
            vim.b.slime_config = nil
            vim.g.slime_default_config = nil
          end
          )
          -- -- slime, tmux
          vim.g.slime_target = 'tmux'
          vim.g.slime_bracketed_paste = 1
          vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
        end
      end
    end
  },
  }
}


