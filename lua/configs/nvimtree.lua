local options = {
  view = {
    adaptive_size = false,
    width = 50,
  },
  actions = {
    open_file = {
      resize_window = false
    }
  },
  update_focused_file = {
    enable = true,
    update_root = true,
  },
  renderer = {
    group_empty = true,
  }
}
return options
