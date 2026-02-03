local wezterm = require("wezterm")

local act = wezterm.action
local colors = {
    black = "#232a31",
    red = "#f56684",
    green = "#7cd5a1",
    yellow = "#f7df6e",
    blue = "#55b8e2",
    magenta = "#d7b8ea",
    cyan = "#61d6c6",
    foreground = "#f2f0fd",
    moon = "#f5eb94",
    pink = "#fabdd4",
    pluto = "#efa3ce",
    white = "#f4f2ff",
    background = "#303942",
    blue_dark = "#2598c2"
}

return {
    enable_wayland = false,
    window_padding = {
        top = '0.3cell',
        bottom = 1,
        left = '0.5cell',
        right = '0.5cell'
    },

    window_frame = {
        font = wezterm.font {
            family = "Manrope",
            weight = "Medium"
        },
        active_titlebar_bg = colors.black,
        inactive_titlebar_bg = colors.black
    },

    font = wezterm.font_with_fallback {
        {
            family = "JetBrains Mono NF",
            harfbuzz_features = {"zero=1"}
        }, "Noto Color Emoji", "Manrope"
    },
    font_size = 11,

    enable_scroll_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    default_cursor_style = "BlinkingBar",

    colors = {
        background = colors.black,
        foreground = colors.white,

        cursor_bg = colors.moon,
        cursor_fg = colors.black,
        cursor_border = colors.moon,
        compose_cursor = colors.pluto,

        selection_bg = colors.moon,
        selection_fg = colors.black,

        scrollbar_thumb = colors.blue_dark,
        split = colors.magenta,

        ansi = {
            colors.black, colors.pink, colors.green, colors.moon, colors.blue, colors.pluto,
            colors.cyan, colors.white

        },
        brights = {
            "#d2d0dd", colors.red, colors.green, colors.yellow, colors.blue, colors.magenta,
            colors.cyan, colors.foreground
        },

        tab_bar = {
            background = colors.black,
            inactive_tab_edge = colors.background,
            active_tab = {
                bg_color = colors.blue,
                fg_color = colors.black
            },

            inactive_tab = {
                bg_color = colors.black,
                fg_color = colors.foreground
            },

            inactive_tab_hover = {
                bg_color = colors.blue_dark,
                fg_color = colors.black
            },

            new_tab = {
                bg_color = colors.background,
                fg_color = colors.white
            },

            new_tab_hover = {
                bg_color = colors.blue_dark,
                fg_color = colors.black
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
    },

    mouse_bindings = {
        {
            event = {
                Up = {
                    streak = 1,
                    button = "Left"
                }
            },
            mods = "NONE",
            action = wezterm.action.Nop
        }, {
            event = {
                Up = {
                    streak = 2,
                    button = "Left"
                }
            },
            mods = "NONE",
            action = wezterm.action.Nop
        }
    }
}
