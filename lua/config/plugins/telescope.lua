return {
    {
        "nvim-telescope/telescope.nvim",

        dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/which-key.nvim",
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
            -- vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            -- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            -- vim.keymap.set('n', '<leader>pws', function()
            --     local word = vim.fn.expand("<cword>")
            --     builtin.grep_string({ search = word })
            -- end)
            -- vim.keymap.set('n', '<leader>pWs', function()
            --     local word = vim.fn.expand("<cWORD>")
            --     builtin.grep_string({ search = word })
            -- end)
            -- vim.keymap.set('n', '<leader>ps', function()
            --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
            -- end)
            -- vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

            local wk = require("which-key")
            wk.register({
                ["<leader>p"] = {
                    name = "Project",
                    f = { "<cmd>Telescope find_files<cr>", "Project File" },
                    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
                    g = { "<cmd>Telescope git_files<cr>", "Git Files" },
                    n = { "<cmd>enew<cr>", "New File" },
                    s = {
                        function()
                            local word = vim.fn.input("Grep > ")
                            builtin.grep_string({ search = word })
                        end,
                        "Grep word (input)"
                    },
                    w = {
                        function()
                            local word = vim.fn.expand("<cword>")
                            builtin.grep_string({ search = word })
                        end,
                        "Grep word (cword)"
                    },
                    W = {
                        function()
                            local word = vim.fn.expand("<cWORD>")
                            builtin.grep_string({ search = word })
                        end,
                        "Grep word (cWORD)"
                    },
                    t = { builtin.help_tags, "Help Tags" }
                },
            })
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
        end
    }
}
