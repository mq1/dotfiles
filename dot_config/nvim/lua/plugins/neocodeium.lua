return {
	"monkoose/neocodeium",
	lazy = false, -- otherwise it won't load for some reason
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
