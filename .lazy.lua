vim.keymap.set({ "n", "t", "i" }, "<F9>", function()
	vim.cmd("wall")
	Snacks.terminal.focus("./utils/codeload3.sh -p /dev/ttyUSB0 -B 115200 serial main.fs", {
		win = {
			wo = { winhighlight = "Normal:Normal" },
			position = "bottom", -- Can be "bottom", "top", "left", "right"
			height = 0.4, -- Takes up 40% of the screen height
		},
		interactive = true, -- Keeps terminal open after command finishes
		auto_close = false,
	})
end, { desc = "Upload code" })

vim.keymap.set({ "n", "t", "i" }, "<F8>", function()
	Snacks.terminal("echo 'reboot'> /dev/ttyUSB0", {
		env = { TERMINAL_ID = "MAIN" },
		win = {
			wo = { winhighlight = "Normal:Normal" },
			position = "bottom", -- Can be "bottom", "top", "left", "right"
			height = 0.4, -- Takes up 40% of the screen height
		},
		interactive = false, -- Keeps terminal open after command finishes
		auto_close = true,
	})
	-- require("toggleterm").exec("echo 'reboot'> /dev/ttyACM0", 1)
end, { desc = "Reset device" })

vim.keymap.set({ "n", "t", "i" }, "<F5>", function()
	Snacks.terminal.focus("cu -l /dev/ttyUSB0 -s 115200", {
		win = {
			wo = { winhighlight = "Normal:Normal" },
			position = "bottom", -- Can be "bottom", "top", "left", "right"
			height = 0.4, -- Takes up 40% of the screen height
		},
		interactive = true, -- Keeps terminal open after command finishes
		auto_close = true,
	})
end, { desc = "Device console" })


return {}
