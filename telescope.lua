local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local utils = require("telescope.utils")
--local trouble = require'trouble.providers.telescope'

-- Mappings
vim.api.nvim_set_keymap("n", "<leader>gs", ":Telescope git_status<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gb", ":Telescope git_branches<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gc", ":Telescope git_commits<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true })
-- obsolete now vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope file_browser<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>bu", ":Telescope buffers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ch", ":Telescope command_history<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>rgw", ":Telescope grep_string<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>rgl", ":Telescope live_grep<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>reg", ":Telescope registers<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>mar", ":Telescope marks<CR>", { noremap = true })

--- Create a git commit
---@param prompt_bufnr number: The prompt bufnr
actions.git_commit = function(prompt_bufnr)
  local cwd = action_state.get_current_picker(prompt_bufnr).cwd
  local commit_message = action_state.get_current_line()

  if commit_message == "" then
    print("Please enter a commit message first")
  else
    local confirmation = vim.fn.input(string.format('Commit with message "%s"? [y/n]: ', commit_message))
    if string.len(confirmation) == 0 or string.sub(string.lower(confirmation), 0, 1) ~= "y" then
      print("\nCommit aborted")
      return
    end

    actions.close(prompt_bufnr)

    local _, ret, stderr = utils.get_os_command_output({ "git", "commit", "-m", commit_message }, cwd)
    if ret == 0 then
      print("Commit successfull")
    else
      print(string.format("Error while committing"))
    end
  end
end

require("telescope").setup({
  defaults = {
      mappings = {
        i = {
          ["<C-h>"] = "which_key"
        },
      }
   },
  --   mappings = {
  --     i = { ["<c-t>"] = trouble.open_with_trouble },
  --     n = { ["<c-t>"] = trouble.open_with_trouble },
  --   },
  pickers = {
    find_files = {
      hidden = true,
    },
    git_status = {
      mappings = {
        n = {
          ["<leader>gcm"] = actions.git_commit,
        },
        i = {
          ["<leader>gcm"] = actions.git_commit,
        },
      },
    },
    buffers = {
      show_all_buffers = true,
      sort_last_used = true,
      mappings = {
        n = {
          ["<leader>d"] = actions.delete_buffer,
        },
        i = {
          ["<leader>d"] = actions.delete_buffer,
        },
      },
    },
  },
})
