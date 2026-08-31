return {
	"monkoose/neocodeium",
	event = "VeryLazy",
	opts = {},
	keys = {
		{
			"ƒ",
			function()
				require("neocodeium").accept()
			end,
			mode = "i",
			desc = "Neocodeium accept",
			silent = true,
		},
	},
}
