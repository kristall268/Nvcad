

require("core.options")
require("core.keymap")
require("plugins")


vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
       if vim.fn.argc() == 0 then
           vim.api.nvim_command('NvimTreeOpen')
        end
    end
})

