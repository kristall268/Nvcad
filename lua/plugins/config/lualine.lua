--lua/plugins/lualine.nvim
-- Lualine configuration

return{
    "nvim-lualine/lualine.nvim",
    dependencies = {'nvim-tree/nvim-web-devicons', 'folke/tokyonight,nvim'},
    config = function()
        local lualine = require("lualine")
        local lazy_status = require("lazy.status")
        local tokyonight_colors = require("tokyonight.colors").setup()

        -- Custom color palette
        local colors = {
            blue = tokyonight_colors.blue,
            green = tokyonight_colors.green,
            violet = tokyonight_colors.purple,
            magenta = tokyonight_colors.magenta,
            red = tokyonight_colors.red,
            orange = tokyonight_colors.orange,
            yellow = tokyonight_colors.yellow,
            fg = tokyonight_colors.fg,
            bg = tokyonight_colors.bg_dark,
            inactive_bg = tokyonight_colors.bg_sidebar,
        }
        local tokyonight_theme = {
            normal = {
                a = {bg = colors.blue, fg = colors.bg, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.fg},
            },
            insert = {
                a = {bg = colors.green, fg = colors.bg, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.fg},
            },
            visual = {
                a = {bg = colors.violet, fg = colors.bg, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.fg},
            },
            replace = {
                a = {bg = colors.red, fg = colors.bg, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.fg},
            },
            command = {
                a = {bg = colors.yellow, fg = colors.bg, gui = 'bold'},
                b = {bg = colors.bg, fg = colors.fg},
                c = {bg = colors.bg, fg = colors.fg},
            },
            inactive = {
                a = {bg = colors.inactive_bg, fg = colors.fg},
                b = {bg = colors.inactive_bg, fg = colors.fg},
                c = {bg = colors.inactive_bg, fg = colors.fg},
            },
        }

        lualine.setup({
            options = {
                theme =  "tokyonight",
                component_separator = {left = '', right = ''},
                section_separator = {left = '', right = ''},
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                }
            },
            sections = {
                lualine_a = {
                    {'mode', separator = {left = ''}, right_padding = 2}
                },
                lualine_b = {
                    {'branch', icon = ''},
                    {'diff', symbols = {added = '', modified = '', removed = ''}},
                },
            },
        })
    end
}
