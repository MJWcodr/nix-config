-- Functional Wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Map keybindings for Terminal
-- Exit terminal mode
map("t", "<Esc>", "<C-\\><C-n>") -- exit terminal mode

-- open terminal in normal mode
map("n", "<leader>t", ":sp | terminal<CR>") -- split window

-- Map keybindings for completion
-- control + j/k to navigate completion menu
map("i", "<C-j>", "pumvisible() ? \"\\<C-n>\" : \"\\<C-j>\"", { expr = true }) -- move to next item in completion menu
map("i", "<C-k>", "pumvisible() ? \"\\<C-p>\" : \"\\<C-k>\"", { expr = true }) -- move to previous item in completion menu

-- control + space to open completion menu
map("i", "<C-Space>", "compe#complete()", { expr = true }) -- open completion menu

-- Map keybindings for telescope
map("n", "<C-f>", ":Telescope find_files<CR>") -- find files

-- Map keybindings for "bufferline"
map("n", "<Tab>", ":BufferLineCycleNext<CR>") -- next buffer
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>") -- previous buffer
map("n", "<S-q>", ":BufferLinePickClose<CR>") -- Close multiple buffers

map("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>") -- go to buffer 1
map("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>") -- go to buffer 2
map("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>") -- go to buffer 3
map("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>") -- go to buffer 4

-- Change window with arrow keys + shift
map("n", "<S-Up>", ":wincmd k<CR>") -- move to window above
map("n", "<S-Down>", ":wincmd j<CR>") -- move to window below
map("n", "<S-Left>", ":wincmd h<CR>") -- move to window left
map("n", "<S-Right>", ":wincmd l<CR>") -- move to window right

-- Move window with arrow keys + alt
map("n", "<A-Up>", ":wincmd K<CR>") -- move window above
map("n", "<A-Down>", ":wincmd J<CR>") -- move window below
map("n", "<A-Left>", ":wincmd H<CR>") -- move window left
map("n", "<A-Right>", ":wincmd L<CR>") -- move window right

-- Split window with arrow keys + ctrl
map("n", "<C-Up>", ":wincmd s<CR>") -- split window vertically
map("n", "<C-Down>", ":wincmd s<CR>") -- split window vertically
map("n", "<C-Left>", ":wincmd v<CR>") -- split window horizontally
map("n", "<C-Right>", ":wincmd v<CR>") -- split window horizontally

-- Map keybindings for "nvim-tree"
map("n", "<C-n>", ":NvimTreeToggle<CR>") -- toggle nvim-tree
