-- mini.lua: Advanced config for mini.nvim with QoL improvements

return {
  "nvim-mini/mini.nvim", -- main plugin repo

  -- Plugin setup configuration
  config = function()
    require("mini.surround").setup({
      mappings = {
        add = "sa", -- Add surrounding (e.g., "sa" to add parentheses)
        delete = "sd", -- Delete surrounding (e.g., "sd" to delete surrounding parens)
        find = "sf", -- Find surrounding (e.g., "sf" to find surrounding)
        replace = "sr", -- Replace surrounding (e.g., "sr" to replace surrounding)
      },
    })

    require("mini.pairs").setup({})
    require("mini.indentscope").setup({})
    require("mini.comment").setup({
      mappings = {
        comment = "gc",   -- Map to 'gc' for comment toggle
        comment_line = "gcc", -- Map to 'gcc' for line comments
      },
    })
  end,
}
