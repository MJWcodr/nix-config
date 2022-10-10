local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

-- Install your plugins here
return packer.startup(function(use)
  -- basic plugins
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "github/copilot.vim" -- Copilot is a vim plugin, that generates auto-completion suggestions for you
  use "nvim-lua/completion-nvim" -- Completion for Neovim
  use "nvim-lua/telescope.nvim" -- A vim plugin for exploring and navigating files and directories
  use "kassio/neoterm" --  Wrapper of some vim/neovim's :terminal functions.
  use "nvim-treesitter/nvim-treesitter" -- A vim plugin for syntax highlighting and code navigation
  use "rhysd/clever-split.vim" -- A vim plugin for splitting windows
  use "SirVer/ultisnips" -- A vim plugin for snippets
  use "junegunn/fzf.vim" -- A vim plugin for fuzzy finder
  use "LnL7/vim-nix" -- A vim plugin for nix
  
  -- code completion
  use "neovim/nvim-lspconfig" -- LSP configuration for Neovim
  use 'hrsh7th/cmp-nvim-lsp' -- LSP completion for Neovim
  use 'hrsh7th/cmp-buffer' -- LSP completion for buffers
  use 'hrsh7th/cmp-path' -- LSP completion for paths
  use 'hrsh7th/cmp-cmdline' -- LSP completion for command line
  use 'hrsh7th/nvim-cmp' -- LSP completion for Neovim
  use "simrat39/rust-tools.nvim" -- Rust tools for Neovim
  use "quangnguyen30192/cmp-nvim-ultisnips" -- Ultisnips for CMP
  
  -- add spell checking
  use "lewis6991/spellsitter.nvim" -- A vim plugin for spell checking


  -- colorscheme
  use({
  	'projekt0n/github-nvim-theme',
	  config = function()
	  require('github-theme').setup({
	    })
	  end
  })

  -- setup nvim tree
  use "kyazdani42/nvim-tree.lua" -- A file explorer for Neovim
  require("nvim-tree").setup()

  -- setup asychronous LSP
  use "w0rp/ale" -- Asynchronous Lint Engine
  vim.g.ale_fixers = {
    ['*'] = {'remove_trailing_lines', 'trim_whitespace'},
    javascript = {'prettier', 'eslint'},
    typescript = {'prettier', 'eslint'},
    lua = {'luafmt'}
  }
  vim.g.ale_linters = {
    javascript = {'eslint'},
    typescript = {'eslint'},
    lua = {'luacheck'}
  }

  vim.g.ale_fix_on_save = 1
  
  vim.g.ale_lint_on_enter = 1
  vim.g.ale_sign_error = ''
  vim.g.ale_sign_warning = ''
  vim.g.ale_sign_info = ''
  vim.g.ale_sign_style_error = ''
  vim.g.ale_sign_style_warning = ''
  vim.g.ale_sign_style_info = ''

  -- A startup screen for Neovim
  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()

	require"startup".setup()
    end
  }

  -- After packer
  local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
  },

  -- You should specify your *installed* sources.
  sources = {
    { name = 'buffer' },
    { name = 'nvim_lsp' },
    { name = 'ultisnips' },
    { name = 'pylsp'}
  },
})

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
