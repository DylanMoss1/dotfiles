local wezterm = require("wezterm")

wezterm.on("format-window-title", function()
	return ""
end)

local config = wezterm.config_builder()

-- ========== WEZTERM CONFIG ==========

config.window_close_confirmation = "NeverPrompt"

-- config.default_prog = { "ssh", "<name@host>", "-t", "'fish'" }
config.default_prog = { "fish" }

config.color_scheme = "Tokyo Night Moon"
config.font_size = 12.5

config.keys = {
	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = -1 }) },
	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action({ ActivateTabRelative = 1 }) },
	{ key = "w", mods = "CTRL", action = wezterm.action.CloseCurrentTab({ confirm = false }) },
	{ key = "n", mods = "CTRL", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
	{
		key = "n",
		mods = "CTRL|SHIFT",
		-- config.default_prog = { "ssh", "<name@host>", "-t", "'fish'" }
		action = wezterm.action.SpawnCommandInNewWindow({ args = { "fish" } }),
	},
	{ key = "s", mods = "CTRL|SHIFT", action = wezterm.action.Search({ CaseInSensitiveString = "" }) },
	{ key = "l", mods = "CTRL", action = wezterm.action.SendKey({ key = "UpArrow" }) },
	{ key = "h", mods = "CTRL", action = wezterm.action.SendKey({ key = "DownArrow" }) },
}

-- ========== LOAD CUSTOM CONFIG ==========

local custom_config = require("wezterm_custom")
config = custom_config(config)

return config
