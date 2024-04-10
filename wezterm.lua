local wezterm = require("wezterm")
local act = wezterm.action

return {
    window_frame = {
        font = wezterm.font {
            family = "Manrope",
            weight = "Medium"
        },
        active_titlebar_bg = "#232a31",
        inactive_titlebar_bg = "#232a31"
    },

    font = wezterm.font_with_fallback {
        {
            family = "JetBrains Mono NF",
            harfbuzz_features = {"zero=1"}
        }, "Noto Color Emoji", "Manrope"
    },
    enable_scroll_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    default_cursor_style = "BlinkingBar",

    colors = {
        background = "#232a31",
        foreground = "#f4f2ff",

        cursor_bg = "#f5eb94",
        cursor_fg = "#232a31",
        cursor_border = "#f5eb94",
        compose_cursor = "#efa3ce",

        selection_bg = "#f5eb94",
        selection_fg = "#232a31",

        scrollbar_thumb = "#394550",
        split = "#394550",

        ansi = {
            "#232a31", "#fabdd4", "#7cd5a1", "#f5eb94", "#55b8e2", "#efa3ce", "#61d6c6", "#f4f2ff"
        },
        brights = {
            "#c2c0cd", "#f56684", "#7cd5a1", "#f7df6e", "#55b8e2", "#d7b8ea", "#61d6c6", "#f2f0fd"
        },

        tab_bar = {
            background = "#232a31",
            inactive_tab_edge = "#303942",
            active_tab = {
                bg_color = "#55b8e2",
                fg_color = "#232a31"
            },

            inactive_tab = {
                bg_color = "#232a31",
                fg_color = "#f2f0fd"
            },

            inactive_tab_hover = {
                bg_color = "#2598c2",
                fg_color = "#232a31"
            },

            new_tab = {
                bg_color = "#303942",
                fg_color = "#f4f2ff"
            },

            new_tab_hover = {
                bg_color = "#2598c2",
                fg_color = "#232a31"
            }

        }

    },

    window_background_opacity = 0.87,

    keys = {
        {
            key = "'",
            mods = "CTRL",
            action = act.ActivateTabRelative(1)
        }, {
            key = ";",
            mods = "CTRL",
            action = act.ActivateTabRelative(-1)
        }, {
            key = "\\",
            mods = "CTRL",
            action = act.SplitVertical {
                domain = "CurrentPaneDomain"
            }
        }, {
            key = "\\",
            mods = "SHIFT|CTRL",
            action = act.SplitHorizontal {
                domain = "CurrentPaneDomain"
            }
        }, {
            key = "k",
            mods = "CTRL",
            action = act.ClearScrollback "ScrollbackAndViewport"
        }, {
            key = "k",
            mods = "SHIFT|CTRL",
            action = act.Multiple {
                act.ClearScrollback "ScrollbackAndViewport", act.SendKey {
                    key = "L",
                    mods = "CTRL"
                }
            }
        }
    }
}
