data:extend {
  -- PLAYER SETTINGS
  {
    type = "bool-setting",
    name = "multiplayer-ui-show-distance",
    setting_type = "runtime-per-user",
    default_value = true,
    order = "aa"
  },
  {
    type = "bool-setting",
    name = "multiplayer-ui-show-online-time",
    setting_type = "runtime-per-user",
    default_value = true,
    order = "ba"
  },
  {
    type = "bool-setting",
    name = "multiplayer-ui-show-afk-time",
    setting_type = "runtime-per-user",
    default_value = false,
    order = "ca"
  },
  {
    type = "bool-setting",
    name = "multiplayer-ui-show-group",
    setting_type = "runtime-per-user",
    default_value = false,
    order = "da"
  },
  {
    type = "bool-setting",
    name = "multiplayer-ui-show-armor",
    setting_type = "runtime-per-user",
    default_value = true,
    order = "ea"
  },
  {
    type = "bool-setting",
    name = "multiplayer-ui-show-offline",
    setting_type = "runtime-per-user",
    default_value = false,
    order = "fa"
  },
  {
    type = "int-setting",
    name = "multiplayer-ui-max-players",
    setting_type = "runtime-per-user",
    default_value = 5,
    order = "ga"
  },
  {
    type = "bool-setting",
    name = "multiplayer-ui-debug-log",
    setting_type = "startup",
    default_value = false,
    order = "ha"
  }
}
