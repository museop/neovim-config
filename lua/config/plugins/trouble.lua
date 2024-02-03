return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to configuraiton section below
            })

            vim.keymap.set("n", "<leader>tt", function()
                require("trouble").toggle()
            end)

            vim.keymap.set("n", "[d", function()
                require("trouble").next({skip_groups = true, jump = true})
            end)

            vim.keymap.set("n", "]d", function()
                require("trouble").previous({skip_groups = true, jump = true})
            end)
        end
    }
}
