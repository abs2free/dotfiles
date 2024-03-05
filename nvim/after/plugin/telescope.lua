-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

-- Enable telescope fzf native, if installed
require("telescope").load_extension('fzf')
require("telescope").load_extension('project')
require("telescope").load_extension('harpoon')
require("telescope").load_extension("undo")


-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

local leaderSearchFun  = function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', leaderSearchFun, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })


vim.keymap.set( 'n', '<C-p>', ":lua require'telescope'.extensions.project.project{}<CR>", {noremap = true, silent = true})

-- Default mappings (insert mode):
-- Key	Description
-- <c-d>	delete currently selected project
-- <c-v>	rename currently selected project
-- <c-a>	create a project*
-- <c-s>	search inside files within your project
-- <c-b>	browse inside files within your project
-- <c-l>	change to the selected project's directory without opening it
-- <c-r>	find a recently opened file within your project
-- <c-f>	find a file within your project (same as <CR>)

-- local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup {
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules" },
    layout_config = {
      preview_width = 0.6,
      prompt_position = "top",
    },
--    path_display = { "smart" },
    prompt_position = "top",
    prompt_prefix = " ",
    selection_caret = " ",
    sorting_strategy = "ascending",
    mappings = {
      i = {
        ["<c-t>"] = trouble.open_with_trouble ,
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
      n = {
        ["<c-t>"] = trouble.open_with_trouble ,
      },
    },
  },
  pickers = {
    buffers = {
      prompt_prefix = "﬘ ",
    },
    commands = {
      prompt_prefix = " ",
    },
    git_files = {
      prompt_prefix = " ",
      show_untracked = true,
    },
    find_files = {
      prompt_prefix = " ",
      find_command = { "rg", "--files", "--hidden" },
    },
  },
   extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
