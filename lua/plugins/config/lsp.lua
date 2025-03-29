-- lua/plugins/config/lsp.lua
-- LSP configuration


local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        "pyright",
        "clangd",
        "jdtls",
        "lua_ls",
    },
    automotic_installation = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    pyright = {},
    clangd = {},
    jdtls = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    }
                }
            }
        }
    }
}

mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
            settings = servers[server_name] or {},
            on_attach = function(client,bufnr)
                local bufopts = {noremap = true, silent = true, buffer = bufnr}
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename,bufopts)
            end
        })
    end
})
