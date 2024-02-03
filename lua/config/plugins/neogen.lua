return {
    "danymat/neogen",

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "L3MON4D3/LuaSnip",
    },

    config = function()
        require('neogen').setup{
            snippnet_engine = 'luasnip',
        }

        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<leader>nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
        vim.api.nvim_set_keymap("n", "<leader>nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)

    end

    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
}
