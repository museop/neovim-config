local mapKey = function(from, to, mode, opts)
    local options = { noremap = true, silent = true }
    mode = mode or "n"

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(mode, from, to, options)
end

vim.g.mapleader = " "

mapKey("<leader>pv", vim.cmd.Ex)

mapKey('jj', '<ESC>', 'i')

mapKey("K", ":m '<-2<CR>gv=gv", "v")
mapKey("J", ":m '>+1<CR>gv=gv", "v")

mapKey("<C-d>", "<C-d>zz")
mapKey("<C-u>", "<C-u>zz")

mapKey("<leader>y", "\"+y")
mapKey("<leader>y", "\"+y", 'v')
mapKey("<leader>Y", "\"+Y")

mapKey("Q", "<nop>")

mapKey("<C-k>", "<cmd>cnext<CR>zz")
mapKey("<C-j>", "<cmd>cprev<CR>zz")
mapKey("<leader>k", "<cmd>lnext<CR>zz")
mapKey("<leader>j", "<cmd>lprev<CR>zz")

mapKey("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

