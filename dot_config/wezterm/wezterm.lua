local wezterm = require("wezterm")

return {
	enable_wayland = true,
	font = wezterm.font("FiraMono Nerd Font Mono"),
	font_rules = {
		{
			italic = true,
			font = wezterm.font("FiraMono Nerd Font Mono", { italic = false }),
		},
	},
	font_size = 11.0,
	enable_tab_bar = true,
	window_background_opacity = 0.9,
	window_close_confirmation = "NeverPrompt",
	skip_close_confirmation_for_processes_named = {
		"bash",
		"fish",
		"chezmoi",
	},
	harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
	show_update_window = false,
	check_for_updates = false,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	keys = {
		{ key = "t", mods = "ALT", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
		{ key = "w", mods = "ALT", action = wezterm.action({ CloseCurrentTab = { confirm = true } }) },
		{ key = "1", mods = "ALT", action = wezterm.action({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = wezterm.action({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = wezterm.action({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = wezterm.action({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = wezterm.action({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT", action = wezterm.action({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT", action = wezterm.action({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT", action = wezterm.action({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT", action = wezterm.action({ ActivateTab = 8 }) },
	},
    color_scheme = "Gruvbox dark, soft (base16)"
}
