require("nvim-treesitter.configs").setup({
    ensure_installed = { "c","cpp","c_sharp","python","css","javascript","java","html", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
    sync_install =  true,
    auto_install = true,
    ignore_install = {},

    highlight = {
        enable = true,
        disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
})
