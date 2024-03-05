local which_key =  require("which-key")

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  f = {
    name = "Find",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlights" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  m = {
    name = "Mark Files",
    [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
    s = { "<cmd>Telescope harpoon marks<cr>", "Search Files" },
    m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon Add File" },
    ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next File" },
    [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev File" },
  }
}

which_key.register(mappings, opts)
