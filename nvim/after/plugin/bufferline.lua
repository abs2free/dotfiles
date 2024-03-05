vim.opt.termguicolors = true

-- bufferline 左右Tab切换
vim.keymap.set("n", "<C-h>", ":BufferLineCyclePrev<CR>", {})
vim.keymap.set("n", "<C-l>", ":BufferLineCycleNext<CR>", {})

require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
    }
}
