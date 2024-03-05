vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")


require("telescope").setup({
  extensions = {
    undo = {
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.8,
      },
      use_delta = true,
      use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
      side_by_side = false,
      diff_context_lines = vim.o.scrolloff,
      entry_format = "state #$ID, $STAT, $TIME",
      mappings = {
        i = {
          -- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
          -- you want to replicate these defaults and use the following actions. This means
          -- installing as a dependency of telescope in it's `requirements` and loading this
          -- extension from there instead of having the separate plugin definition as outlined
          -- above.
          ["<cr>"] = require("telescope-undo.actions").yank_additions,
          ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
          ["<C-cr>"] = require("telescope-undo.actions").restore,
        },
        -- n = {
        --   ["y"] = require("telescope-undo.actions").yank_additions,
        --   ["Y"] = require("telescope-undo.actions").yank_deletions,
        --   ["u"] = require("telescope-undo.actions").restore,
        -- },
      },
    },
  },
})
