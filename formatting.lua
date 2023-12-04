local conform = require("conform")
conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },
  },
})

-- format with conform
vim.keymap.set("n", "<leader>for", function()
  conform.format()
end, { noremap = true })
