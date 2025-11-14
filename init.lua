require("config.lazy")
vim.cmd[[colorscheme catppuccin]]
-- Neovide settings
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    if vim.g.neovide then

      vim.opt.guifont = { "Iosevka Nerd Font Mono", ":h24" }
      vim.g.neovide_opacity = 0.85

      -- Padding
      vim.g.neovide_padding_top = 15
      vim.g.neovide_padding_bottom = 15
      vim.g.neovide_padding_left = 15
      vim.g.neovide_padding_right = 15
    end
  end,
})

