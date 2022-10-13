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
map("n", "<Tab>", ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>")
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>")

-- Map keybindings for nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>")
