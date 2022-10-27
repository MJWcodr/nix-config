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

-- Set the compile path for packer
packer.reset("compile_path", fn.stdpath("config").."$DOTFILES/nvim/plugin/packer_compiled.lua")

-- Install your plugins here
return packer.startup(function(use)
  -- basic plugins
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "github/copilot.vim" -- Copilot is a vim plugin, that generates auto-completion suggestions for you
  use "nvim-lua/completion-nvim" -- Completion for Neovim
  use "nvim-lua/telescope.nvim" -- A vim plugin for exploring and navigating files and directories
  use "nvim-treesitter/nvim-treesitter" -- A vim plugin for syntax highlighting and code navigation
  use "junegunn/fzf.vim" -- A vim plugin for fuzzy finder
  
  -- code completion
  use "neovim/nvim-lspconfig" -- LSP configuration for Neovim
  use 'hrsh7th/cmp-nvim-lsp' -- LSP completion for Neovim
  use 'hrsh7th/cmp-buffer' -- LSP completion for buffers
  use 'hrsh7th/cmp-path' -- LSP completion for paths
  use 'hrsh7th/cmp-cmdline' -- LSP completion for command line
  use 'hrsh7th/nvim-cmp' -- LSP completion for Neovim

  -- Nix support
  use "LnL7/vim-nix" -- Vim syntax highlighting for Nix

  -- Smooth scrolling
  use "karb94/neoscroll.nvim" -- Smooth scrolling for Neovim
  
 -- Spellchecking
  use "vigoux/LanguageTool.nvim" -- Language Tool

  -- Status line
  use "glepnir/galaxyline.nvim" -- A vim plugin for status line

  -- Add Markdown support
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })  

  use({'jakewvincent/mkdnflow.nvim',
    rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    config = function()
        require('mkdnflow').setup({})
    end
}) -- Markdown flow

  -- Add Tabs at the top
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  vim.opt.termguicolors = true
  require("bufferline").setup{}

  -- Add Leap Motion support
  use "ggandor/leap.nvim" -- A vim plugin for fast cursor movement
  require("leap").add_default_mappings()
  
  -- Syntax highlighting for Kitty terminal
  use "fladson/vim-kitty"

  -- Color Scheme
  use({
  'projekt0n/github-nvim-theme',
	config = function()
	require('github-theme').setup({
	})
	end
  })

  -- Setup nvim tree
  use "kyazdani42/nvim-tree.lua" -- A file explorer for Neovim
  require("nvim-tree").setup()

  -- Icons for nvim tree
  use "kyazdani42/nvim-web-devicons" -- Icons for Neovim

  -- Setup asychronous LSP
  use "w0rp/ale" -- Asynchronous Lint Engine
  vim.g.ale_fixers = {
    ['*'] = {'remove_trailing_lines'},
    javascript = {'prettier', 'eslint'},
    typescript = {'prettier', 'eslint'},
    lua = {'luafmt'},
    markdown = {'prettier'},
  }
  vim.g.ale_linters = {
    javascript = {'eslint'},
    typescript = {'eslint'},
    lua = {'luacheck'},
    markdown = {'mdl', 'writegood'},
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
    { name = 'pylsp'},
    { name = 'path' },
    { name = 'markdownlint' },
    { name = 'write-good' },
    { name = 'luacheck' },
    { name = 'luafmt' },
    { name = 'prettier' },
    { name = 'eslint' },
    { name = 'remove_trailing_lines' },
    { name = 'trim_whitespace' },
  },
})
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
