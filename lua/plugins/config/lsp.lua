-- lua/plugins/config/lsp.lua
-- LSP configuration

local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

mason.setup()
mason_lspconfig.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    ensure_installed = {
        "pyright",
        "clangd",
        "cmake",
        "jdtls",
        "lua_ls",
        "html",
        "cssls",
        "eslint",
        "jsonls",
        "grammarly",
        "glint",
    },
    automatic_installation = true, -- Исправлена опечатка
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    pyright = {},
    ruff_lsp = {},
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
    },
    html = {},
    cssls = {},
    tsserver = {},
}

mason_lspconfig.setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
            settings = servers[server_name] or {},
            on_attach = function(client, bufnr)
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            end
        })
    end
})

require("conform").setup({
    formatters_by_ft = {
        python = { "black" },
        lua = { "stylua" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
