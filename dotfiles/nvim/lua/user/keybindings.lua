-- Functional Wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map keybindings for Terminal
-- exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>")

-- open terminal in normal mode
map("n", "<leader>t", ":sp | terminal<CR>")

-- Map keybindings for normal mode navigation
-- map("n", "<UP>", "<Nop>")
-- map("n", "<DOWN>", "<Nop>")
-- map("n", "<LEFT>", "<Nop>")
-- map("n", "<RIGHT>", "<Nop>")

-- Map keybindings for completion
-- control + j/k to navigate completion menu
map("i", "<C-j>", "pumvisible() ? \"\\<C-n>\" : \"\\<C-j>\"", { expr = true })
map("i", "<C-k>", "pumvisible() ? \"\\<C-p>\" : \"\\<C-k>\"", { expr = true })

-- control + space to open completion menu
map("i", "<C-Space>", "compe#complete()", { expr = true })

-- Map keybindings for telescope
map("n", "<C-f>", ":Telescope find_files<CR>")

-- Map keybindings for "bufferline"


-- Map keybindings for nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")
