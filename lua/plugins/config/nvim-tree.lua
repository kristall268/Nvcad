

require("nvim-tree").setup({
    on_attach = "default",
    hijack_cursor = false,
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_netrw = true,

    sort = {
        sorter = "case_sensitive",
        folders_first = true,
        files_first = false,
    },
    -- View options
    view = {
        cursorline = true,
        debounce_delay  = 30,
        side = "left",
        preserve_window_proportions = true,
        signcolumn = "auto",
        adaptive_size = true,
        width = 40,
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },

    },        
    renderer = {
        add_trailing = true,
        group_empty = false,
        full_name = true,


        decorators = {
            {
                enable = true,
                component = function(file)
                    local git_status = require("nvim-tree.git").git_status(file.path)
                    if git_status then
                        if git_status.modified then
                            return "M"
                        elseif git_status.added then
                            return "A"
                        elseif git_status.deleted then
                            return "D"
                        elseif git_status.renamed then
                            return "R"
                        elseif git_status.untracked then
                            return "U"
                        elseif git_status.conflicted then
                            return "C"
                        end
                    end
                    return ""
                end,
                type = "git",
            },
        },
        -- hightlight on files
        highlight_git = "name",
        highlight_diagnostics = "name",
        highlight_opened_files = "name",
        highlight_modified = "none",
        highlight_hidden = "none",
        highlight_bookmarks = "none",
        highlight_clipboard = "name",
        icons = {
            web_devicons = {
                file = {
                    enable = true,
                    color = true,
                },
                folder = {
                    enable = true,
                    color = true,
                }
            },
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
                modified = true,
                hidden = true,
                diagnostics = true,
                bookmarks = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                modified = "",
                hidden = "",
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌"
                },
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            }
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_root = {
            enable = false,
            ignore_list = {}
        },
        exclude = false,
    },
    -- system_open = {
    --     cmd = "",
    --     args = {}
    -- },

    git = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
        disable_for_dirs = {},
        timeout = 400,
        cygwin_support = false,
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        show_on_open_dirs = false,
        debounce_delay = 500,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    modified = {
        enable = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
    },
    filters = {
        enable = true,
        git_ignored = true,
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        no_bookmark = false,
        custom = {},
        exclude = {},
    },

    live_filter = {
        prefix = "[FILTER]:",
        always_show_folders = true,
    },
    
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 500,
            exclude = {},
        },
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = "cursor",
                border = "shadow",
                style = "minimal",
            },
        },
        open_file = {
            quit_on_open = false,
            eject = false,
            resize_window = true,
            relative_path = true,
            window_picker = {
                enable = true,
                picker = "default",
                chars = "ABCDEFGHIJKLMNOPQRSTUVMXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    trash = {
        cmd = "gio trash",
    },
    tab = {
        sync = {
            open = false,
            close = false,
            ignore = {},
        },
    },
    notify = {
        threshold = vim.log.levels.INFO,
        absolute_path = true,
    },
    help = {
        sort_by = "key",
    },

    ui = {
        confirm = {
            remove = true,
            trash = true,
            default_yes = false,
        },
    },
    log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          dev = false,
          diagnostics = false,
          git = false,
          profile = false,
          watcher = false,
        },
    },
})
