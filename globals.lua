-- BASIC STUFF
vim.g.mapleader = " " --cmd('let mapleader =" "')
vim.opt.autoread = true --this is used when undoing git commits: it rereads the buffer
--vim.cmd(":filetype indent on") --loads filetype-specific indentation file from /indent
-- show winbar with relative filepath on the right and file-modified-sign
vim.o.winbar = "%=%f %m "
vim.o.hidden = true
-- orientation
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.cursorline = true
vim.o.showmatch = true
vim.o.scrolloff = 10
vim.go.cmdheight = 2
-- indentation
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- layout
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.wrap = false --don't wrap!
vim.o.signcolumn = "yes"
-- search
vim.o.incsearch = true
vim.o.hlsearch = true

-- Lua syntax highlighting inside .vim files
vim.g.vimsyn_embed = "l"

-- COLORS
vim.o.termguicolors = true
--vim.g.onedark_terminal_italics = 1
--vim.cmd("colorscheme onedark")
vim.cmd.colorscheme("catppuccin-mocha")
-- red CursorLineNr
vim.cmd("highlight CursorLineNr guifg=#E00000")
-- red MatchParen
vim.cmd("highlight MatchParen gui=bold guifg=red guibg=bg")
-- syntax
vim.cmd("syntax on")
-- folds
vim.cmd("highlight Folded guibg=NONE")
vim.cmd("highlight FoldColumn guibg=NONE")
-- shortcut for opening lua vrc files directory
--vim.api.nvim_set_keymap("n", "<leader>vrc", "<cmd>:lua vimrc_files()<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>vrc", ":lua vimrc_files()<CR>", { noremap = true })

-- CUSTOM FUNCTIONS
function _G.vimrc_files()
  require("telescope.builtin").find_files({
    prompt_title = "< Vim Files >",
    cwd = "~/.config/nvim",
  })
end
