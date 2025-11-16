return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },

  keys = {
    { "<leader>ff", "<cmd>Telescope find_files theme=dropdown<cr>" },
    { "<leader>fn", "<cmd>Telescope find_files cwd=~/.config/nvim theme=dropdown<cr>" },
    { "<leader>fd", "<cmd>Telescope find_files cwd=~/dotfiles hidden=true theme=dropdown<cr>" },
    { "<leader>fg", "<cmd>Telescope live_grep theme=dropdown<cr>" },
    { "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<cr>" },
    { "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<cr>" },
  },

  config = function()
    require("telescope").setup({
      defaults = {
        -- Small-screen layout tuning
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            width = 0.90,
            height = 0.95,
            preview_height = 0.35,
            preview_cutoff = 20, -- hide preview on small windows
          },
          horizontal = {
            width = 0.90,
            height = 0.90,
            preview_width = 0.45,
            preview_cutoff = 60,
          },
        },

        sorting_strategy = "ascending",
        scroll_strategy = "cycle",

        borderchars = {
          "─", -- top
          "│", -- right
          "─", -- bottom
          "│", -- left
          "┌", -- top-left
          "┐", -- top-right
          "┘", -- bottom-right
          "└", -- bottom-left
        },
      },
    })

    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("fzf")
  end,
}
