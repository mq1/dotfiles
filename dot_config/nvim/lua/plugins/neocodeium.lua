return {
	"monkoose/neocodeium",
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
