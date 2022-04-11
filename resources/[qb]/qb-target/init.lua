function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-------------------------------------------------------------------------------
-- Settings
-------------------------------------------------------------------------------

Config = {}

-- It's possible to interact with entities through walls so this should be low
Config.MaxDistance = 5.0

-- Enable debug options
Config.Debug = false

-- Supported values: true, false
Config.Standalone = false

-- Enable outlines around the entity you're looking at
Config.EnableOutline = false

-- Enable default options (Toggling vehicle doors)
Config.EnableDefaultOptions = true

-- Disable the target eye whilst being in a vehicle
Config.DisableInVehicle = false

-- Key to open the target
Config.OpenKey = 'LMENU' -- Left Alt
Config.OpenControlKey = 19 -- Control for keypress detection also Left Alt for the eye itself, controls are found here https://docs.fivem.net/docs/game-references/controls/

-- Key to open the menu
Config.MenuControlKey = 238 -- Control for keypress detection on the context menu, this is the Right Mouse Button, controls are found here https://docs.fivem.net/docs/game-references/controls/

-------------------------------------------------------------------------------
-- Target Configs
-------------------------------------------------------------------------------

-- These are all empty for you to fill in, refer to the .md files for help in filling these in

Config.CircleZones = {

}

Config.BoxZones = {
	["Police Eve"] = {
		name = "Eve",
		coords = vector3(473.95, -1004.41, 26.27),
		length = 1,
		width = 4,
		heading = 0,
		debugPoly = false,
		minZ = 25.27,
		maxZ = 27.47,
		options = {
			{
				event = "police:OpenEvidence",
				icon = "fas fa-archive",
				label = "Evidence",
				job = "police",
			},
		},
		distance = 1.2
	},
	["Police Clothing"] = {
		name = "Police clothing",
		coords = vector3(461.71, -995.32, 30.69),
		length = 1,
		width = 4,
		heading = 0,
		debugPoly = false,
		minZ = 29.79,
		maxZ = 31.59,
		options = {
			{
				event = "cui_character:open",
				icon = "	fas fa-archive",
				label = "Clothing",
				job = "police",
			},
		},
		distance = 1.2
	},
	["armory"] = {
		   name = "Armory",
		   coords = vector3(482.57, -994.55, 30.69),
		   length = 1,
		   width = 1,
		   heading = 359,
		   debugPoly = false,
		   minZ = 29.79,
		   maxZ = 31.59,
		   options = {
			   {
				   event = "police:openPDArmory",
				   icon = "	fas fa-archive",
				   label = "Öppna Förråd",
				   job = "police",
			   },
		   },
		   distance = 1.2
	   },
	   ["mrpdpersonalstash"] = {
        name = "MissionRowPersonalStash",
        coords = vector3(479.75, -996.72, 30.69),
        length = 0.85,
        width = 0.47,
        heading = 0.0,
        debugPoly = false,
        minZ = 30.62,
        maxZ = 30.72,
        options = {
            {
              type = "client",
              event = "police:openPerStash",
              icon = "fas fa-archive",
              label = "Personal Stash",
              job = "police",
            },
        },
        distance = 2.5
    },
	["MrpdFingerprint"] = {
        name = "MrpdFingerprint",
        coords = vector3(473.7, -1014.07, 26.27),
        length = 0.5,
        width = 0.5,
        heading = 0.0,
        debugPoly = false,
        minZ = 23.57,
        maxZ = 26.37,
        options = {
            {
              type = "client",
              event = "fingerprint",
              icon = "fas fa-fingerprint",
              label = "fingerprint",
              job = "police",
            },
        },
        distance = 2.5
    },
	["missionrow"] = {
		name = "MissionRowDutyClipboard",
		coords = vector3(441.7989, -982.0529, 30.67834),  --duty target 
		length = 0.45,
		width = 0.35,
		heading = 11.0,
		debugPoly = false,
		minZ = 30.77834,
		maxZ = 30.87834,
		options = {
			{
			  type = "client",
			  event = "qb-policejob:ToggleDuty",
			  icon = "fas fa-sign-in-alt",
			  label = "Sign In / Out",
			  job = "police",
			},
		},
		distance = 3.5
	},
	['CQCMugshot'] = {
		name = 'CQCMugshot',
		coords = vector3(473.07, -1012.56, 26.27),
		debugPoly = false,
		length = 0.2,
		width = 0.2,
		heading = 0,
		maxZ = 27.07,
		minZ = 25.27,
		options = {
			{
				icon = 'fas fa-camera',
				label = 'Take Suspects Mugshots',
				job = {
					['police'] = 0,
					['sast'] = 0,
				},
				event = 'cqc-mugshot:client:takemugshot',
				type = 'client'
			},
		},
		distance = 2.0,
	},
   }

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetEntities = {

}

Config.TargetModels = {
	["stealing"] = {
		models = {
			"v_ret_247shelves01",
			"v_ret_247shelves02",
			"v_ret_247shelves03",
			"v_ret_247shelves04",
			"v_ret_247shelves05"
		},
		options = {
			{
				type = "client",
				event = "qb-shoplifting:client:doStuff",
				icon = "fas fa-toolbox",
				label = "Shoplift",
			}
		},
		distance = 1.0
	},
	
		["stealAlc"] = {
		models = {
			"v_ret_ml_liqshelfc",
		},
		options = {
			{
				type = "client",
				event = "qb-shoplifting:client:shopLiftAcohol",
				icon = "fas fa-toolbox",
				label = "Shoplift Alcohol",
			}
		},
		distance = 1.0
	},
    ["youtool shops"] = {
        models = {
            "s_m_m_lathandy_01",
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-wrench",
                label = "Buy Tools",
            },
        },
        distance = 2.5,
    },
	["mt-hunting"] = {
        models = {
            "cs_hunter",
        },
        options = {
            {
                type = "client",
                event = "mt-hunting:client:LojaCaca",
                icon = "fas fa-circle",
                label = "Talk to employee",
            },
        },
        distance = 2.5,
    },
    ["sea world"] = {
        models = {
            "cs_dom",
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-circle",
                label = "Buy Gear",
            },
        },
        distance = 2.5,
    },
	["burgershotgarage"] = {
		models = {
			"ig_floyd"
		},
		options = {
			{
				type = "client",
				event = "garage:BurgerShotGarage",
				icon = "fas fa-car",
				label = "BurgerShot Garage",
				job = "burgershot",
			}
		},
		distance = 2.5,
	},
	["Bank"] = {
        models = {
            `ig_bankman`,
        },
        options = {
            {
                type = "client",
                event = "qb-banking:client:bank:openUI",
                icon = "fas fa-money-check",
                label = "Bank",
            },
        },
        distance = 2.5
    },
	["atm"] = {
        models = {
			"prop_atm_02",
			"prop_atm_03",
			"prop_fleeca_atm",
			"prop_atm_01",
        },
        options = {
            {
                type = "client",
                event = "qb-banking:client:atm:openUI",
                icon = "fas fa-money-check",
                label = "ATM",
            },
        },
        distance = 2.5
    },
	["VehicleRental"] = {
        models = {
            `a_m_y_business_03`,
        },
        options = {
            {
                type = "client",
                event = "qb-rental:openMenu",
                icon = "fas fa-car",
                label = "Hyr Fordon",
            },
        },
        distance = 4.0
    },
    ["24/7 shops"] = {
        models = {
            "mp_m_shopkeep_01",
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-store",
                label = "Öppna Affären",
            },
        },
        distance = 2.5,
    },
    ["youtool shops"] = {
        models = {
            "s_m_m_lathandy_01",
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-wrench",
                label = "Köp verktyg",
            },
        },
        distance = 2.5,
    },
	["Police1 Shop"] = {
        models = {
            "csb_cop",
        },
        options = {
            {
                type = "client",
                event = "garage:menu1",
                icon = "fas fa-store",
                label = "Open Police Garage",
            },
        },
        distance = 2.5,
    },

	["OrderVehicle"] = {
        models = {
            `a_m_y_business_01`,
        },
        options = {
            {
                type = "client",
                event = "emfan-vehicleshop:client:OrderCar",
                icon = "fas fa-car",
                label = "Beställ Fordon",
            },
        },
        distance = 4.0
    },

    ["sea world"] = {
        models = {
            "cs_dom",
        },
        options = {
            {
                type = "client",
                event = "qb-shops:marketshop",
                icon = "fas fa-circle",
                label = "Buy Gear",
            },
        },
        distance = 2.5,
    },
}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {

}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

}

Config.Peds = {
	{ -------City hall------
	model = 'a_f_m_fatcult_01',
	coords = vector4(-550.98, -190.79, 37.22, 204.12),
	gender = 'female',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	{ -------Tuner Shop------
	model = 's_m_y_xmech_01',
	coords = vector4(149.0, -3050.15, 6.04, 56.86),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
    scenario = "WORLD_HUMAN_CLIPBOARD",
},
	{  -------Bank------
	model = `ig_bankman`,
	coords = vector4(-112.22, 6471.01, 30.63, 134.18),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,

	
},

{  -------Bank------
model = `a_m_y_business_01`,
coords = vector4(-55.97812, -1099.215, 25.422346, 54.024173),
gender = 'male',
freeze = true,
invincible = true,
blockevents = true,


},

{ --mt-hunting
	model = 'cs_hunter',
	coords = vector4(-776.04, 5602.91, 32.74, 270.54),
	gender = 'male',
	freeze = true,
	invincible = false,
	blockevents = false,
},
	{  -------Bank------
	model = `ig_bankman`,
	coords = vector4(1174.8, 2708.2, 37.09, 178.52),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	{  -------Bank------
	model = `ig_bankman`,
	coords = vector4(-2961.14, 483.09, 14.7, 83.84),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	{  -------Bank------
	model = `ig_bankman`,
	coords = vector4(-1211.9, -331.9, 36.78, 20.07),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	{  -------Bank------
	model = `ig_bankman`,
	coords = vector4(-351.23, -51.28, 48.04, 341.73),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	{  -------Bank------
	model = `ig_bankman`,
	coords = vector4(149.46, -1042.09, 28.37, 335.43),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	{  -------Bank------
	model = `ig_bankman`,
	coords = vector4(313.84, -280.58, 53.16, 338.31),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	{  -------Bank------
	model = `ig_bankman`,
	coords = vector4(241.44, 227.19, 105.29, 170.43),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
    {  -------Youtool Shop------
	model = `s_m_m_lathandy_01`,
	coords = vector4(45.48, -1748.85, 28.55, 55.1),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{  -------Youtool Shop------
	model = `s_m_m_lathandy_01`,
	coords = vector4(2748.07, 3472.72, 54.70, 238.96),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-3242.23, 999.97, 11.85, 351.66),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(24.5, -1346.63, 28.60, 273.18),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-47.18, -1758.46, 28.45, 39.64),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-706.02, -913.9, 18.35, 86.17),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-1486.75, -377.57, 39.20, 132.60),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
	-- San Andreas Ave Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-1221.30, -907.82, 11.40, 34.60),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Carrson Ave
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(372.6, 327.06, 102.55, 258.49),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- North Rockford
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-1819.96, 794.04, 137.10, 126.36),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Great Ocean South
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-3039.89, 584.21, 6.90, 16.15),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Great Ocean Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(-2966.41, 391.62, 14.05, 84.40),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Mirror Park
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1164.72, -323.04, 68.25, 93.92),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Vespucci Boulevard Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1134.32, -983.25, 45.45, 278.23),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Route 68
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(549.24, 2670.37, 41.25, 94.15),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Sandy
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1959.72, 3740.68, 31.40, 297.43),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Sandy Shores Robs Liquor
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1165.25, 2710.80, 38.16, 183.01),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Grape Seed
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1697.8, 4923.14, 41.10, 321.33),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- Great Ocean North
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(1728.33, 6416.21, 34.05, 241.78),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
-- LS Freeway
{
	model = 'mp_m_shopkeep_01',
	coords = vector4(2677.32, 3279.69, 54.30, 323.82),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{---by youtool
	model = 'mp_m_shopkeep_01',
	coords = vector4(2557.28, 380.78, 107.65, 359.83),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
{ --sea world
	model = 'cs_dom',
	coords = vector4(-1686.39, -1072.48, 12.15, 50.1),
	gender = 'male',
	freeze = true,
	invincible = true,
	blockevents = true,
},
}

-------------------------------------------------------------------------------
-- Functions
-------------------------------------------------------------------------------
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCount() return true end
local function CitizenCheck() return true end

CreateThread(function()
	if not Config.Standalone then
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCount = function(item)
			for _, v in pairs(PlayerData.items) do
				if v.name == item then
					return true
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	else
		local firstSpawn = false
		AddEventHandler('playerSpawned', function()
			if not firstSpawn then
				SpawnPeds()
				firstSpawn = true
			end
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCount(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end