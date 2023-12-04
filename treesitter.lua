require("nvim-treesitter.configs").setup({
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "typescript",
    "tsx",
    "javascript",
    "json",
    "rust",
    "yaml",
    "html",
    "scss",
    "lua",
    "vim",
    "yaml",
    "dockerfile"
  },
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
