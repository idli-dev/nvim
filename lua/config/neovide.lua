-- Detect Neovide
if not vim.g.neovide then
  return
end

vim.g.neovide_opacity = 0.75        -- main content opacity
vim.g.neovide_normal_opacity = 0.75 -- background highlight always fully opaque

-- Comfortable font for notes
vim.o.guifont = "JetBrainsMono Nerd Font:h18"
vim.g.neovide_refresh_rate = 60     -- normal (respects laptop screens)
vim.g.neovide_refresh_rate_idle = 5 -- battery saver when unfocused
vim.g.neovide_no_idle = false       -- allow idle mode (saves power)
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_theme = "dark" -- sync with system (dark/light)
vim.g.neovide_padding_top = 15
vim.g.neovide_padding_bottom = 15
vim.g.neovide_padding_left = 15
vim.g.neovide_padding_right = 15
