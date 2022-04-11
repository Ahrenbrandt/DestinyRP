Config = {}

Config.CommandPermission = 'god' -- permission level for creating new doors
Config.AdminAccess = false -- Enable admins to unlock any door
Config.AdminPermission = 'god' -- The permission needed to get AdminAccess if it is enabled
Config.Warnings = false -- if true it will show warnings in the console when certain requirements aren't met
Config.FallbackDistance = 3.0 -- Distance to fall back on when it is not set
Config.EnableSounds = true -- Enable sounds when unlocking/locking doors (doors triggered by scripts can have the sound manually disabled)
Config.EnableAnimation = true -- Enable the animation when unlocking/locking doors (doors triggered by scripts can have the animation manually disabled)

Config.ChangeColor = false -- Change the color of the box of the popup text based on if it is locked or not
Config.DefaultColor = 'rgb(19, 28, 74)' -- The default color of the box of the popup text if Config.ChangeColor is false
Config.LockedColor = 'rgb(219 58 58)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is locked
Config.UnlockedColor = 'rgb(27 195 63)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is unlocked

Config.Consumables = { ['ticket'] = 1, ['paperclip'] = 1 } -- The items will get removed once used on a door that has the item on it

Config.DoorList = {
	--- door1 for pacific opened with security card B
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vec3(261.83, 221.39, 106.41),
		textCoords = vec3(261.83, 221.39, 106.41),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locked = true,
		pickable = true,
		distance = 1.5,
	},
	--door2 for pacific opened with thermite right near the vault door
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vec3(252.98, 220.65, 101.8),
		textCoords = vec3(252.98, 220.65, 101.8),
		authorizedJobs = { 'police' },
		objYaw = 160.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- door3 for pacific opened with thermite after passing the door near vault
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vec3(261.68, 215.62, 101.81),
		textCoords = vec3(261.68, 215.62, 101.81),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Paleto Door 1 opened with security card A
	{
		objName = 'v_ilev_cbankvaulgate01',
		objCoords  = vec3(-105.77, 6472.59, 31.81),
		textCoords = vec3(-105.77, 6472.59, 31.81),
		objYaw = 45.0,
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Paleto Door 2 opened with thermite
	{
		objName = 'v_ilev_cbankvaulgate02',
		objCoords  = vec3(-106.26, 6476.01, 31.98),
		textCoords = vec3(-105.5, 6475.08, 31.99),
		objYaw = -45.0,
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- First Pacific Door opened with lockpick
	{
		objName = 'hei_v_ilev_bk_gate_pris',
		objCoords  = vec3(257.41, 220.25, 106.4),
		textCoords = vec3(257.41, 220.25, 106.4),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Second Pacific Door opened with lockpick
	{
		objName = 'v_ilev_bk_door',
		objCoords  = vec3(265.19, 217.84, 110.28),
		textCoords = vec3(265.19, 217.84, 110.28),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(314.61, -285.82, 54.49),
		textCoords = vec3(313.3, -285.45, 54.49),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(148.96, -1047.12, 29.7),
		textCoords = vec3(148.96, -1047.12, 29.7),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-351.7, -56.28, 49.38),
		textCoords = vec3(-351.7, -56.28, 49.38),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-1208.12, -335.586, 37.759),
		textCoords = vec3(-1208.12, -335.586, 37.759),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-2956.18, 483.96, 16.02),
		textCoords = vec3(-2956.18, 483.96, 16.02),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Prison Door 1
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vec3(1844.9, 2604.8, 44.6),
		textCoords = vec3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 13
	},
	-- Prison Door 2
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vec3(1818.5, 2604.8, 44.6),
		textCoords = vec3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 13
	},
	-- Prison Door 3
	{
		objName = 'prop_gate_prison_01',
		objCoords = vec3(1799.237, 2616.303, 44.6),
		textCoords = vec3(1795.941, 2616.969, 48.0),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = true,
		distance = 10
	},
	------------------------------------------Always add new doors below this line for your bank robberies to work!!!---------------------------------
				------------------------------------------End Fixed Doors!!!---------------------------------
				{
					objName = "gabz_mrpd_door_05",
					objYaw = 180.0,
					objCoords = vec3(440.5201, -986.2335, 30.82319),
					textCoords = vec3(440.5201, -986.2335, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
				{ 
					textCoords = vec3(434.7444, -980.7556, 30.8153),
					authorizedJobs = { 'police' },

					locked = false,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = -1547307588,
							objYaw = 90.0,
							objCoords = vec3(434.7444, -983.0781, 30.8153)
						},
			
						{
							objName = -1547307588,
							objYaw = 270.0,
							objCoords = vec3(434.7444, -980.7556, 30.8153)
						}
					}
				},

				{
					objName = "gabz_mrpd_door_04",
					objYaw = 90.0,
					objCoords = vec3(445.4067, -984.2014, 30.82319),
					textCoords = vec3(445.4067, -984.2014, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
				{ -- DOOR NUM.5 , COP TALKER.
					textCoords = vec3(438.1971, -993.9113, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_01",
							objYaw = 90.0,
							objCoords = vec3(438.1971, -996.3167, 30.82319)
						},
			
						{
							objName = "gabz_mrpd_door_01",
							objYaw = -90.0,
							objCoords = vec3(438.1971, -993.9113, 30.82319)
						}
					}
				},
			
				{ -- DOOR NUM.6 , Door side station exit.
					textCoords = vec3(440.7392, -998.7462, 30.8153),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_reception_entrancedoor",
							objYaw = 0.0,
							objCoords = vec3(440.7392, -998.7462, 30.8153)
						},
			
						{
							objName = "gabz_mrpd_reception_entrancedoor",
							objYaw = 180.0,
							objCoords = vec3(443.0618, -998.7462, 30.8153)
						}
					}
				},
			
				{
					objName = "gabz_mrpd_door_05",
					objYaw = 135.0,
					objCoords = vec3(452.2663, -995.5254, 30.82319),
					textCoords = vec3(452.2663, -995.5254, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
				--[[{
					objName = "gabz_mrpd_door_02",
					objYaw = 225.0,
					objCoords = vec3(458.0894, -995.5247, 30.82319),
					textCoords = vec3(458.0894, -995.5247, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},--]]
			
				{ -- DOOR 9
					objName = "gabz_mrpd_door_05",
					objYaw = 270.0,
					objCoords = vec3(458.6543, -990.6498, 30.82319),
					textCoords = vec3(458.6543, -990.6498, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
				
				{
					objName = "gabz_mrpd_door_04",
					objYaw = 270.0,
					objCoords = vec3(458.6543, -976.8864, 30.82319),
					textCoords = vec3(458.6543, -976.8864, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				{ -- DOOR NUM.11 , Door side station exit.
					textCoords = vec3(455.8862, -972.2543, 30.81531),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_reception_entrancedoor",
							objYaw = 0.0,
							objCoords = vec3(455.8862, -972.2543, 30.81531)
						},
			
						{
							objName = "gabz_mrpd_reception_entrancedoor",
							objYaw = 180.0,
							objCoords = vec3(458.2087, -972.2543, 30.81531)
						}
					}
				},
			
			
				{ -- DOOR NUM.12
					textCoords = vec3(469.4406, -987.4377, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_01",
							objYaw = -90.0,
							objCoords = vec3(469.4406, -985.0313, 30.82319)
						},
			
						{
							objName = "gabz_mrpd_door_01",
							objYaw = 90.0,
							objCoords = vec3(469.4406, -987.4377, 30.82319)
						}
					}
				},
			
			
				{ -- DOOR NUM.13
					textCoords = vec3(475.3837, -984.3722, 30.82319),
					authorizedJobs = { 'police' },

					locked = false,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_02",
							objYaw = 0.0,
							objCoords = vec3(472.9781, -984.3722, 30.82319)
						},
			
						{
							objName = "gabz_mrpd_door_02",
							objYaw = 180.0,
							objCoords = vec3(475.3837, -984.3722, 30.82319)
						}
					}
				},
			
			
				{  -- DOOR NUM.14 - Ambulance stuff
					textCoords = vec3(479.7534, -988.6204, 30.82319),
					authorizedJobs = { 'police', 'ambulance' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_04",
							objYaw = -90.0,
							objCoords = vec3(479.7534, -986.2151, 30.82319)
						},
			
						{
							objName = "gabz_mrpd_door_05",
							objYaw = -90.0,
							objCoords = vec3(479.7534, -988.6204, 30.82319)
						}
					}
				},
			
			
			
				-- Door 15:
				{ 
					textCoords = vec3(472.9777, -989.8247, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_04",
							objYaw = -180.0,
							objCoords = vec3(475.3837, -989.8247, 30.82319)
						},
			
						{
							objName = "gabz_mrpd_door_05",
							objYaw = 180.0,
							objCoords = vec3(472.9777, -989.8247, 30.82319)
						}
					}
				},
			
			
				-- 16
				{
					objName = "gabz_mrpd_door_03",
					objYaw = 90.0,
					objCoords = vec3(479.7507, -999.629, 30.78917),
					textCoords = vec3(479.7507, -999.629, 30.78917),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- 17
				{
					objName = "gabz_mrpd_door_04",
					objYaw = 90.0,
					objCoords = vec3(476.7512, -999.6307, 30.82319),
					textCoords = vec3(476.7512, -999.6307, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- 18
				{
					objName = "gabz_mrpd_door_03",
					objYaw = 180.0,
					objCoords = vec3(487.4378, -1000.189, 30.78697),
					textCoords = vec3(487.4378, -1000.189, 30.78697),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
				-- Door 19:
				{ 
					textCoords = vec3(485.6133, -1002.902, 30.78697),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_03",
							objYaw = -180.0,
							objCoords = vec3(488.0184, -1002.902, 30.78697)
						},
			
						{
							objName = "gabz_mrpd_door_03",
							objYaw = 0.0,
							objCoords = vec3(485.6133, -1002.902, 30.78697)
						}
					}
				},
			
			
			
				-- GGGGGGGGGGGG DONE FLOOR 1 !!!!!!!!!!!!!!!!!!!!!!!
				-- FLOOR 2 [ called main due size ]
			
				-- Door 2 | [Missing 1 due helicopter floor, will be in the end of config].
				{
					objName = "gabz_mrpd_door_04",
					objYaw = 180.0,
					objCoords = vec3(459.9454, -981.0742, 35.10398),
					textCoords = vec3(459.9454, -981.0742, 35.10398),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- Door 3
				{
					objName = "gabz_mrpd_door_05",
					objYaw = 0.0,
					objCoords = vec3(459.9454, -990.7053, 35.10398),
					textCoords = vec3(459.9454, -990.7053, 35.10398),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- Door 4
				{
					objName = "gabz_mrpd_door_05",
					objYaw = 135.0,
					objCoords = vec3(448.9868, -981.5785, 35.10376),
					textCoords = vec3(448.9868, -981.5785, 35.10376),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
			
				-- Door 5
				{
					objName = "gabz_mrpd_door_04",
					objYaw = 45.0,
					objCoords = vec3(448.9868, -990.2007, 35.10376),
					textCoords = vec3(448.9868, -990.2007, 35.10376),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- Door 6
				{
					objName = "gabz_mrpd_door_05",
					objYaw = 135.0,
					objCoords = vec3(448.9846, -995.5264, 35.10376),
					textCoords = vec3(448.9846, -995.5264, 35.10376),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
			
				-- NO Door 1 [ Shitty helicopters - GABZ FUCK U ITS WRONG DOOR NAME -_- ]
			
				
			
				-- GGGGGGGGGGGG DONE FLOOR 2 !!!!!!!!!!!!!!!!!!!!!!!
				-- FLOOR 0
			
				-- Door 3
				{
					objName = "gabz_mrpd_room13_parkingdoor",
					objYaw = -90.0,
					objCoords = vec3(464.1591, -974.6656, 26.3707),
					textCoords = vec3(464.1591, -974.6656, 26.3707),
					authorizedJobs = { 'police' },

					locked = false,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- Door 4
				{
					objName = "gabz_mrpd_room13_parkingdoor",
					objYaw = 90.0,
					objCoords = vec3(464.1566, -997.5093, 26.3707),
					textCoords = vec3(464.1566, -997.5093, 26.3707),
					authorizedJobs = { 'police' },

					locked = false,
					pickable = true,
					distance = 2.0,
					size = 2
				},
				
			
				-- Door 5:
				{ 
					textCoords = vec3(471.3753, -987.4374, 26.40548),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_04",
							objYaw = -90.0,
							objCoords = vec3(471.3753, -985.0319, 26.40548)
						},
			
						{
							objName = "gabz_mrpd_door_05",
							objYaw = -90.0,
							objCoords = vec3(471.3753, -987.4374, 26.40548)
						}
					}
				},
			
			
				
				-- Door 10:
				{ 
					textCoords = vec3(479.0624, -987.4376, 26.40548),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_02",
							objYaw = -90.0,
							objCoords = vec3(479.0624, -985.0323, 26.40548)
						},
			
						{
							objName = "gabz_mrpd_door_02",
							objYaw = 90.0,
							objCoords = vec3(479.0624, -987.4376, 26.40548)
						}
					}
				},
			
				-- Door 11
				{
					objName = "gabz_mrpd_door_04",
					objYaw = -90.0,
					objCoords = vec3(482.6694, -983.9868, 26.40548),
					textCoords = vec3(482.6694, -983.9868, 26.40548),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- Door 12 -- FUCK U GABZ U FORGOT THE X -_-
			
			
				-- Door 13
				{
					objName = "gabz_mrpd_door_04",
					objYaw = -90.0,
					objCoords = vec3(482.6699, -992.2991, 26.40548),
					textCoords = vec3(482.6699, -992.2991, 26.40548),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- Door 14
				{
					objName = "gabz_mrpd_door_04",
					objYaw = -90.0,
					objCoords = vec3(482.6703, -995.7285, 26.40548),
					textCoords = vec3(482.6703, -995.7285, 26.40548),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
				
				-- Door 15:
				{ 
					textCoords = vec3(479.6638, -997.91, 26.4065),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_02",
							objYaw = 180.0,
							objCoords = vec3(482.0686, -997.91, 26.4065)
						},
			
						{
							objName = "gabz_mrpd_door_02",
							objYaw = 0.0,
							objCoords = vec3(479.6638, -997.91, 26.4065)
						}
					}
				},
			
				-- Door 16
				{
					objName = "gabz_mrpd_door_02",
					objYaw = 180.0,
					objCoords = vec3(478.2892, -997.9101, 26.40548),
					textCoords = vec3(478.2892, -997.9101, 26.40548),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
				-- Door 17
				{
					objName = "gabz_mrpd_door_01",
					objYaw = 89.25,
					objCoords = vec3(479.06, -1003.173, 26.4065),
					textCoords = vec3(479.06, -1003.173, 26.4065),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
				-- Door 18
				{
					objName = "gabz_mrpd_cells_door",
					objYaw = 180.0,
					objCoords = vec3(481.0084, -1004.118, 26.48005),
					textCoords = vec3(481.0084, -1004.118, 26.48005),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
			
				-- Door 19
				{
					objName = "gabz_mrpd_cells_door",
					objYaw = 180.0,
					objCoords = vec3(484.1764, -1007.734, 26.48005),
					textCoords = vec3(484.1764, -1007.734, 26.48005),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
				
			
				-- Door 20
				{
					objName = "gabz_mrpd_cells_door",
					objYaw = 0.0,
					objCoords = vec3(486.9131, -1012.189, 26.48005),
					textCoords = vec3(486.9131, -1012.189, 26.48005),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- Door 21
				{
					objName = "gabz_mrpd_cells_door",
					objYaw = 0.0,
					objCoords = vec3(483.9127, -1012.189, 26.48005),
					textCoords = vec3(483.9127, -1012.189, 26.48005),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
			
				-- Door 22
				{
					objName = "gabz_mrpd_cells_door",
					objYaw = 0.0,
					objCoords = vec3(480.9128, -1012.189, 26.48005),
					textCoords = vec3(480.9128, -1012.189, 26.48005),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
				{
					objName = -1406685646,
					objYaw = 0.0,
					objCoords = vec3(441.13, -977.93, 30.82319),
					textCoords = vec3(441.13, -977.93, 30.82319),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
				-- Door 23
				{
					objName = "gabz_mrpd_cells_door",
					objYaw = 0.0,
					objCoords = vec3(477.9126, -1012.189, 26.48005),
					textCoords = vec3(477.9126, -1012.189, 26.48005),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
			
			
				-- Door 24
				{
					objName = "gabz_mrpd_cells_door",
					objYaw = -90.0,
					objCoords = vec3(476.6157, -1008.875, 26.48005),
					textCoords = vec3(476.6157, -1008.875, 26.48005),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},
				
			
				--[[ Door 25
				{
					objName = "gabz_mrpd_door_01",
					objYaw = 180.0,
					objCoords = vec3(475.9539, -1006.938, 26.40639),
					textCoords = vec3(475.9539, -1006.938, 26.40639),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.0,
					size = 2
				},]]
			
				-- Door 26 missing.
				
			
				-- Door 7
				{ 
					textCoords = vec3(471.3758, -1010.198, 26.40548),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_02",
							objYaw = -90.0,
							objCoords = vec3(471.3679, -1007.793, 26.40548)
						},
			
						{
							objName = "gabz_mrpd_door_02",
							objYaw = 90.0,
							objCoords = vec3(471.3758, -1010.198, 26.40548)
						}
					}
				},
			
			
				-- Door 8
				{ 
					textCoords = vec3(467.3686, -1014.406, 26.48382),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_03",
							objYaw = 180.0,
							objCoords = vec3(469.7743, -1014.406, 26.48382)
						},
			
						{
							objName = "gabz_mrpd_door_03",
							objYaw = 0.0,
							objCoords = vec3(467.3686, -1014.406, 26.48382)
						}
					}
				},
			
			
			
				-- Door 9
				{ 
					textCoords = vec3(467.5222, -1000.544, 26.40548),
					authorizedJobs = { 'police' },

					locked = true,
					pickable = true,
					distance = 2.5,
					doors = {
						{
							objName = "gabz_mrpd_door_01",
							objYaw = 180.0,
							objCoords = vec3(469.9274, -1000.544, 26.40548)
						},
			
						{
							objName = "gabz_mrpd_door_01",
							objYaw = 0.0,
							objCoords = vec3(467.5222, -1000.544, 26.40548)
						}
					}
				},

	-- Luxury Cars
	-- Entrance Doors
	{
		textCoords = vec3(-803.0223, -223.8222, 37.87975),
		authorizedJobs = { 'cardealer', 'police' },
		locked = true,
		pickable = true,
		distance = 3.5,
		doors = {
			{
				objName = 'prop_doorluxyry2',
				objYaw = 120.0,
				objCoords = vec3(-803.0223, -222.5841, 37.87975)
			},

			{
				objName = 'prop_doorluxyry2',
				objYaw = -60.0,
				objCoords = vec3(-801.9622, -224.5203, 37.87975)
			}
		}
	},
	-- Side Entrance Doors
	{
		textCoords = vec3(-777.1855, -244.0013, 37.333889),
		authorizedJobs = { 'cardealer', 'police' },
		locked = true,
		pickable = true,
		distance = 3.5,
		doors = {
			{
				objName = 'prop_doorluxyry',
				objYaw = -160.0,
				objCoords = vec3(-778.1855, -244.3013, 37.33388)
			},

			{
				objName = 'prop_doorluxyry',
				objYaw = 23.0,
				objCoords = vec3(-776.1591, -243.5013, 37.33388)
			}
		}
	},
	-- Garage Doors
	{
		textCoords = vec3(-768.1264, -238.9737, 37.43247),
		authorizedJobs = { 'cardealer', 'police' },
		locked = true,
		pickable = true,
		distance = 13.0,
		doors = {
			{
				objName = 'prop_autodoor',
				objCoords = vec3(-770.6311, -240.0069, 37.43247)
			},

			{
				objName = 'prop_autodoor',
				objCoords = vec3(-765.6217, -237.9405, 37.43247)
			}
		}
	},
	-- Pickle Rental
	-- Front door 1
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-21.71276, -1392.778, 29.63847),
		textCoords = vec3(-22.31276, -1392.778, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = -180.0,
		locked = true,
		pickable = true,
		distance = 2.5
	},
	-- Front door 2
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-32.67987, -1392.064, 29.63847),
		textCoords = vec3(-32.10987, -1392.064, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = 0.0,
		locked = true,
		pickable = true,
		distance = 2.5
	},
	-- Door to cellar
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-24.22668, -1403.067, 29.63847),
		textCoords = vec3(-24.22668, -1402.537, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = 90.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Back door
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-21.27107, -1406.845, 29.63847),
		textCoords = vec3(-21.27107, -1406.245, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = 90.0,
		locked = true,
		pickable = false,
		distance = 2.0
	},
    -- Burger Shot

	-- Employess area entrance
	{
        objName = -1300743830,
        objYaw = 124.05,
        objCoords  = vector3(-1178.958, -891.9232, 13.984591),
        textCoords = vector3(-1178.958, -891.9232, 13.984591),
        authorizedJobs = { 'burgershot' },
        locked = true,
        pickable = false,
        distance = 1.0,
    },
	-- Entrance
    {
        textCoords = vector3(-1184.246, -884.8125, 14.032447),
        authorizedJobs = { 'burgershot' },
        locked = true,
        pickable = false,
        distance = 2.5,
        doors = {
            {
                objName = 1934064671,
                objYaw = 124.06,
                objCoords  = vector3(-1183.637, -885.0944, 13.984714)

            },
            {
                objName = -186646702,
                objYaw = 124.02,
                objCoords  = vector3(-1184.539, -884.0463, 13.984724)
            }
        }
    },
	-- Entrance
    {
        textCoords = vector3(-1197.574, -884.5406, 14.023283),
        authorizedJobs = { 'burgershot' },
        locked = true,
        pickable = false,
        distance = 2.5,
        doors = {
            {
                objName = 1934064671,
                objYaw = 213.95,
                objCoords  = vector3(-1197.307, -884.1141, 13.984729)
            },
            {
                objName = -186646702,
                objYaw = 214.01,
                objCoords  = vector3(-1198.444, -884.5676, 13.981176)
            }
        }
    },
	{
        objName = -1448591934,
        objYaw = 33.98,
        objCoords  = vector3(-1200.344, -892.5028, 13.995201),
        textCoords = vector3(-1200.344, -892.5028, 13.995201),
        authorizedJobs = { 'burgershot' },
        locked = true,
        pickable = false,
        distance = 1.0,
    },
    -- {
    --     objName = -1448591934,
    --     objYaw = 123.97,
    --     objCoords  = vector3(-1195.453, -897.5706, 14.004565),
    --     textCoords = vector3(-1195.453, -897.5706, 14.004565),
    --     authorizedJobs = { 'burgershot' },
    --     locking = false,
    --     locked = true,
    --     pickable = false,
    --     distance = 1.0,
    -- },
    {
		objName = -1300743830,
        objYaw = 304.0,
        objCoords  = vector3(-1199.335, -903.278, 13.998657),
        textCoords = vector3(-1199.335, -903.278, 13.998657),
        authorizedJobs = { 'burgershot' },
        locked = true,
        pickable = false,
        distance = 1.0,
    },
	{
		objName = -1448591934,
        objYaw = 123.92,
        objCoords  = vector3(-1194.609, -899.8288, 14.004565),
        textCoords = vector3(-1194.609, -899.8288, 14.004565),
        authorizedJobs = { 'burgershot' },
        locked = true,
        pickable = false,
        distance = 1.0,
    },

	{
		textCoords = vec3(455.86, -981.31, 26.86),
		authorizedJobs = { 'police' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'p_jewel_door_l',
				objYaw = 306.00003051758,
				objCoords  = vec3(-631.955384, -236.333268, 38.206532)
			},

			{
				objName = 'p_jewel_door_r1',
				objYaw = 306.00003051758,
				objCoords  = vec3(-630.426514, -238.437546, 38.206532)
			}
		}
	},

}