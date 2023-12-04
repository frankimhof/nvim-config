require("packer").startup(function(use)
  --packer itself
  use("wbthomason/packer.nvim")
  --telescope
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  --lsp
  use("neovim/nvim-lspconfig")
  --typescript lsp
  use("jose-elias-alvarez/typescript.nvim") --used for better integration of tsserver
  --formatting
  use("stevearc/conform.nvim")
  --linting
  use("mfussenegger/nvim-lint")
  --a better view of diagnostic messages
  use("folke/trouble.nvim")
  --completion
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("folke/neodev.nvim")
  --treesitter (used for syntax highlighting)
  use("nvim-treesitter/nvim-treesitter")
  --navigation
  use("ggandor/leap.nvim")
  --surroundings
  use("tpope/vim-surround")
  --snippets
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")
  use("kitagry/vs-snippets")
  --look
  use("lervag/vimtex") --latex syntax highlighting
  use("joshdick/onedark.vim") --colors
  use({ "catppuccin/nvim", as = "catppuccin" }) --colors
  use("NvChad/nvim-colorizer.lua") -- for colorizing color values
  use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }) --statusline
  --use("kyazdani42/nvim-web-devicons") --icons (using a nerd font installed with brew) brew tap homebrew/cask-fonts brew install --cask font-<FONTNAME>-nerd-font
  use("lukas-reineke/indent-blankline.nvim") --show indent lines
  --ui
  use("stevearc/dressing.nvim")
end)

require("custom.globals")
require("custom.telescope")
require("custom.keymaps")
require("custom.completion")
require("custom.treesitter")
require("neodev").setup({})
require("custom.lsp")
require("custom.snippets")
require("custom.formatting")
require("custom.linting")
--require('latex') need to install mactex first

require("colorizer").setup({
  filetypes = { "typescriptreact", "typescript", "javascript", "css", "html" },
  user_default_options = {
    mode = "background",
    tailwind = "lsp",
    virtualtext = "■",
  },
})

require("lualine").setup({
  sections = {
    lualine_c = { {} }, --don't display filename, because already displayed in winbar
  },
  options = {
    theme = "catppuccin",
    component_separators = "",
  },
})

require("trouble").setup()

require("catppuccin").setup({
  vim.cmd("highlight WinBar guibg=#181825"), --mantle
  --the following code is buggy/not working
  --custom_highlights = function(colors)
  --  return {
  --    WinBar = { bg = colors.mantle},
  --  }
  --end
})

require("leap").add_default_mappings()
