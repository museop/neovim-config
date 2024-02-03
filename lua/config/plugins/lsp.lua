return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        local cmp = require'cmp'
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "tsserver",
            },
            handlers = {
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,

               ["lua_ls"] = function ()
                   local lspconfig = require("lspconfig")
                   lspconfig.lua_ls.setup {
                       capabilities = capabilities,
                       settings = {
                           Lua = {
                               diagnostics = {
                                   globals = { "vim" }
                               }
                           }
                       }
                   }
               end,
            }
        })

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
                vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>vrf', function() vim.lsp.buf.format { async = true } end, opts)
                vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
            end,
        })


        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- `Ctrl+p` key to select previous item
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                -- `Ctrl+n` or `Tab` key to select next item
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
                -- `Enter` key to confirm completion
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                -- `Ctrl+Space` to trigger completion menu
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            })
        })
        vim.diagnostic.config({
            update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}

