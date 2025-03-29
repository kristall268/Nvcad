-- Nvim-tree setup with auto-open on launch
local function open_nvim_tree(data)
    -- Buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- Change to the directory
    vim.cmd.cd(data.file)

    -- Open the tree
    require("nvim-tree.api").tree.open()
end

-- Setup nvim-tree with auto-open configuration
require("nvim-tree").setup({
    -- Previous configuration remains the same
    view = {
        width = 30,
        side = "left",
        preserve_window_proportions = true,
    },
    -- Other configurations from previous setup...
})

-- Auto-open nvim-tree when opening a directory
vim.api.nvim_create_autocmd({"VimEnter"}, {
    callback = open_nvim_tree,
    nested = true,
})

-- Optional: Open nvim-tree automatically on startup
vim.api.nvim_create_autocmd({"VimEnter"}, {
    callback = function()
        -- Only open if no file was specified
        if vim.fn.argc() == 0 then
            require("nvim-tree.api").tree.open()
        end
    end
})