return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    -- Example: { "^scratch/" } -- ignore all files in scratch directory
                    -- Example: { "%.npz" } -- ignore all npz files
                    "%.o",
                    "%.dll",
                    "%.exe",
                    "%.cache",
                    "%.pdf",
                    "%.pdb",
                    "%.jar",
                    "%.class",
                    "%.jpg",
                    "%.jpeg",
                    "%.png",
                    "%.svg",
                    "%.otf",
                    "%.ttf",
                    "%.lock",
                    "%.ipynb",
                    "obj/",
                    "target/debug/",
                    "target/release/",
                    "bin/Debug/",
                    "bin/Release/",
                    "__pycache__/*",
                    "__pycache__/",
                    "node%_modules/*",
                    "node%_modules/",
                },
            }
        })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
    end
}
    
