vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/MeanderingProgrammer/treesitter-modules.nvim",
})

local group = vim.api.nvim_create_augroup('User_Treesitter', {
  clear = true
})

vim.api.nvim_create_autocmd("BufReadPre", {
  group = group,
  callback = function()
    require("treesitter-modules").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc", "query",
        "bash", "html", "css", "javascript", "typescript", "tsx",
        "json", "yaml", "toml", "markdown", "markdown_inline",
        "python", "go", "c", "cpp",
        "gitignore", "gitcommit",
      },
      auto_install = true,

      fold = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<cr>",
          node_incremental = "<cr>",
          node_decremental = "<bs>",
        },
      },
      indent = { enable = true },
    })
  end,
})
