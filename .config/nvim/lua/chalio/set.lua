vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard (cut, copy, paste)
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true

vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.tabstop = 3 -- insert 2 spaces for a tab
vim.opt.softtabstop = 3 -- tabstuff
vim.opt.shiftwidth = 3 -- the number of spaces inserted for each indentation
vim.opt.expandtab = true -- more tab stuff

vim.opt.swapfile = false -- creates a swapfile
vim.opt.wrap = false -- display lines as one long line
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

vim.cmd("set nocompatible") -- stop vim's weird behaivior
vim.opt.showtabline = 1 -- always show tabs
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.backup = false -- creates a backup file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.smartcase = true -- smart case
vim.opt.updatetime = 750 -- faster completion (4000ms is default)

vim.opt.undofile = true -- enable persistent undo
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.shortmess:append("c")
vim.cmd([[set iskeyword+=-]]) -- treats word with apherson like one word
vim.cmd([[au BufEnter * set fo-=c fo-=r fo-=o]]) -- remove new line with commentary

vim.cmd([[
 	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
  	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
]])
--Keep folds after closing session
vim.cmd([[

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
 ]])

 --Highlight yank
vim.api.nvim_exec(
	[[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
	false
)
