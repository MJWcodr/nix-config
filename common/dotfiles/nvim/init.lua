-- My NeoVim config
-- Author: @mjwcodr

-- load plugins
require("user.plugins")
require("user.lsp_config")

-- set user theme
require("github-theme").setup()

-- set vim variables
require("user.variables")

-- set user keybindings
require("user.keybindings")

