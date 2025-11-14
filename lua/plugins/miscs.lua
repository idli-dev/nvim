return {
	{
		-- Plugin for html tags
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	{ "jamespeapen/swayconfig.vim" },
}
