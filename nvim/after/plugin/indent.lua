vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "tab:»·"
vim.opt.listchars:append "trail:·"
vim.opt.listchars:append "extends:>"
-- vim.opt.listchars:append "eol:↴"


require("ibl").setup()
-- require("ibl").setup{
--     space_char_blankline = " ",
--     show_current_context = true,
--     show_current_context_start = true,
-- }
