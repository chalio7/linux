vim.g.mapleader= " "

local keymap = vim.keymap.set

--Should be default
keymap("n", "Y", "y$")
keymap("n", "V", "v$")
keymap("n", "vv", "V")
keymap("n", "j", "gj")
keymap("n", "k", "gk")
keymap("n", "J", "mzJ`z") -- "J" no longer moves cursor to the end of the line
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "U", "<C-r>")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<esc><esc>", ":noh<return><esc>")

--Windows navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

--Move text
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Ident
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- paste on visual without losing paste?
keymap("v", "p", '"_dP')
-- keymap("x", "<leader>p", [["_dP]])

--Substitution
keymap("n", "<leader>s", ":%s//g<left><left>")

--Write
keymap("n", "<leader>w", ":up!<CR>")

-- Nerd Tree
keymap("n", "<leader>tr", ":NvimTreeToggle<CR>")

-- terminal
keymap("n", "<leader>te", ":ToggleTerm<CR>")

-- Compile
keymap("n", "<leader>p", ":!opout <c-r>%<CR><CR>")
keymap("n", "<leader>c", [[:w! | !compiler <c-r>%<CR>]])

-- spellchecker
keymap("n", "<F5>", ":setlocal spell! spelllang=en<CR>")
keymap("n", "<F6>", ":setlocal spell! spelllang=es |:call ToggleDeadKeys()<CR>")

-- Spelling
keymap("n", "<leader>o", "z=")
