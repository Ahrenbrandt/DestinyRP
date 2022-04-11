QBCore = exports['qb-core']:GetCoreObject()
PlayerData = QBCore.Functions.GetPlayerData() -- Setting this for when you restart the resource in game
local inRadialMenu = false

-- Functions

local function setupSubItems()
    if PlayerData.metadata["isdead"] then
        if PlayerData.job.name == "police" or PlayerData.job.name == "ambulance" then
            if not Config.MenuItems[4] then
                Config.MenuItems[4] = {
                    id = 'jobinteractions',
                    title = 'Work',
                    icon = 'briefcase',
                    items = {}
                }
            end
            Config.MenuItems[4].items = {
                [1] = {
                    id = 'emergencybutton2',
                    title = Lang:t("options.emergency_button"),
                    icon = '#general',
                    type = 'client',
                    event = 'police:client:SendPoliceEmergencyAlert',
                    shouldClose = true,
                },
            }
        else
            if Config.JobInteractions[PlayerData.job.name] and next(Config.JobInteractions[PlayerData.job.name]) then
                if not Config.MenuItems[4] then
                    Config.MenuItems[4] = {
                        id = 'jobinteractions',
                        title = 'Work',
                        icon = 'briefcase',
                        items = {}
                    }
                end
                Config.MenuItems[4].items = Config.JobInteractions[PlayerData.job.name]
            else
                Config.MenuItems[4] = nil
            end
        end
    else
        if Config.JobInteractions[PlayerData.job.name] and next(Config.JobInteractions[PlayerData.job.name]) then
            if not Config.MenuItems[4] then
                Config.MenuItems[4] = {
                    id = 'jobinteractions',
                    title = 'Work',
                    icon = 'briefcase',
                    items = {}
                }
            end
            Config.MenuItems[4].items = Config.JobInteractions[PlayerData.job.name]
        else
            Config.MenuItems[4] = nil
        end
    end

    local Vehicle = GetVehiclePedIsIn(PlayerPedId())

    CreateThread(function() -- Update for qb-radialmenu
        while true do		
            if inGarageStation and currentgarage ~= nil then
                TriggerEvent('MojiaGarages:client:updateRadialmenu')
            else
                TriggerEvent('MojiaGarages:client:updateRadialmenu')
            end
            Wait(1000)
        end
    end)
    
    RegisterNetEvent('MojiaGarages:client:updateRadialmenu', function()
        local PlayerData = QBCore.Functions.GetPlayerData()
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        local ped = PlayerPedId()
        local veh = QBCore.Functions.GetClosestVehicle(pos)
        if IsPedInAnyVehicle(ped) then
            veh = GetVehiclePedIsIn(ped)
        end
        local plate = QBCore.Functions.GetPlate(veh)		
        --Open garage
        if inGarageStation and currentgarage ~= nil and not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and not IsPedInAnyVehicle(ped, false) then
            exports["qb-radialmenu"]:addSubMenu(3, 'opengarage', {
                id = 'opengarage',
                title = 'Öppna Garage',
                icon = 'car',
                type = 'client',
                event = 'MojiaGarages:client:openGarage',
                shouldClose = true
            })
        else
            exports["qb-radialmenu"]:removeSubMenu(3, 'opengarage')
        end
        --Parkera Fordon
        if inGarageStation and currentgarage ~= nil and not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and Garages[currentgarage].canStoreVehicle and exports["qb-vehiclekeys"]:HasVehicleKey(plate) then
            exports["qb-radialmenu"]:addSubMenu(3, 'storevehicle', {
                id = 'storevehicle',
                title = 'Parkera Fordon',
                icon = 'car',
                type = 'client',
                event = 'MojiaGarages:client:storeVehicle',
                shouldClose = true
            })
        else
            exports["qb-radialmenu"]:removeSubMenu(3, 'storevehicle')
        end
        --Job
        if PlayerData.job then
            if inGarageStation and currentgarage ~= nil and not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.onduty and inJobStation[PlayerData.job.name] and lastjobveh == nil and not IsPedInAnyVehicle(ped) then
                exports["qb-radialmenu"]:addJobSubMenu(PlayerData.job.name, PlayerData.job.name .. 'opengarage', {
                    id = PlayerData.job.name .. 'opengarage',
                    title = 'Öppna Garage',
                    icon = 'car',
                    type = 'client',
                    event = 'MojiaGarages:client:openJobVehList',
                    shouldClose = true
                })
            else
                exports["qb-radialmenu"]:removeJobSubMenu(PlayerData.job.name, PlayerData.job.name .. 'opengarage')
            end
            if inGarageStation and currentgarage ~= nil and not PlayerData.metadata['ishandcuffed'] and not PlayerData.metadata['inlaststand'] and not PlayerData.metadata['isdead'] and not IsPauseMenuActive() and PlayerData.job.onduty and inJobStation[PlayerData.job.name] and lastjobveh == veh and exports["qb-vehiclekeys"]:HasVehicleKey(plate) then
                exports["qb-radialmenu"]:addJobSubMenu(PlayerData.job.name, PlayerData.job.name .. 'storevehicle', {
                    id = PlayerData.job.name .. 'storevehicle',
                    title = 'Parkera Fordon',
                    icon = 'car',
                    type = 'client',
                    event = 'MojiaGarages:client:HideJobVeh',
                    shouldClose = true
                })
            else
                exports["qb-radialmenu"]:removeJobSubMenu(PlayerData.job.name, PlayerData.job.name .. 'storevehicle')
            end
        end
    end)
    

    if Vehicle ~= 0 then
        local AmountOfSeats = GetVehicleModelNumberOfSeats(GetEntityModel(Vehicle))
        if AmountOfSeats == 2 then
            Config.MenuItems[3].items[3].items = {
                [1] = {
                    id = -1,
                    title = Lang:t("options.driver_seat"),
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [2] = {
                    id = 0,
                    title = Lang:t("options.passenger_seat"),
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        elseif AmountOfSeats == 3 then
            Config.MenuItems[3].items[3].items = {
                [4] = {
                    id = -1,
                    title = Lang:t("options.driver_seat"),
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [1] = {
                    id = 0,
                    title = Lang:t("options.passenger_seat"),
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [3] = {
                    id = 1,
                    title = Lang:t("options.other_seats"),
                    icon = 'caret-down',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        elseif AmountOfSeats == 4 then
            Config.MenuItems[3].items[3].items = {
                [4] = {
                    id = -1,
                    title = Lang:t("options.driver_seat"),
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [1] = {
                    id = 0,
                    title = Lang:t("options.passenger_seat"),
                    icon = 'caret-up',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [3] = {
                    id = 1,
                    title = Lang:t("options.rear_left_seat"),
                    icon = 'caret-down',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
                [2] = {
                    id = 2,
                    title = Lang:t("options.rear_right_seat"),
                    icon = 'caret-down',
                    type = 'client',
                    event = 'qb-radialmenu:client:ChangeSeat',
                    shouldClose = false,
                },
            }
        end
    end
end

local function deepcopy(orig) -- modified the deep copy function from http://lua-users.org/wiki/CopyTable
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if not orig.canOpen or orig.canOpen() then
            local toRemove = {}
            copy = {}
            for orig_key, orig_value in next, orig, nil do
                if type(orig_value) == 'table' then
                    if not orig_value.canOpen or orig_value.canOpen() then
                        copy[deepcopy(orig_key)] = deepcopy(orig_value)
                    else
                        toRemove[orig_key] = true
                    end
                else
                    copy[deepcopy(orig_key)] = deepcopy(orig_value)
                end
            end
            for i=1, #toRemove do table.remove(copy, i) --[[ Using this to make sure all indexes get re-indexed and no empty spaces are in the radialmenu ]] end
            if copy and next(copy) then setmetatable(copy, deepcopy(getmetatable(orig))) end
        end
    elseif orig_type ~= 'function' then
        copy = orig
    end
    return copy
end

local function selectOption(t, t2)
    for k, v in pairs(t) do
        if v.items then
            local found, hasAction = selectOption(v.items, t2)
            if found then return true, hasAction end
        else
            if v.id == t2.id and ((v.event and v.event == t2.event) or v.action) and (not v.canOpen or v.canOpen()) then
                return true, v.action
            end
        end
    end
    return false
end

local function setRadialState(bool, sendMessage)
    local items
    if bool then
        setupSubItems()
        items = deepcopy(Config.MenuItems)
    end
    SetNuiFocus(bool, bool)
    if sendMessage then
        SendNUIMessage({
            action = "ui",
            radial = bool,
            items = items
        })
    end
    inRadialMenu = bool
end

local function getNearestVeh()
    local pos = GetEntityCoords(PlayerPedId())
    local entityWorld = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 20.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, PlayerPedId(), 0)
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)
    return vehicleHandle
end

-- Command

RegisterCommand('radialmenu', function()
    if not PlayerData.metadata["isdead"] and not PlayerData.metadata["inlaststand"] and not PlayerData.metadata["ishandcuffed"] and not IsPauseMenuActive() and not inRadialMenu then
        setRadialState(true, true)
        SetCursorLocation(0.5, 0.5)
    end
end)

RegisterKeyMapping('radialmenu', Lang:t("general.command_description"), 'keyboard', 'F1')

-- Events

-- Sets the metadata when the player spawns
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
	TriggerEvent('MojiaGarages:client:updateRadialmenu')
end)

-- Sets the playerdata to an empty table when the player has quit or did /logout
RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
	TriggerEvent('MojiaGarages:client:updateRadialmenu')
end)

-- This will update all the PlayerData that doesn't get updated with a specific event other than this like the metadata
RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
	TriggerEvent('MojiaGarages:client:updateRadialmenu')
end)

local function CheckHasID(id1, id2)
	local has = false
	if Config.MenuItems[id1].items then
		for k, v in pairs(Config.MenuItems[id1].items) do
			if v.id == id2 then
				has = true
			end
		end
	end
	return has
end

local function CheckHasID2(job, id)
	local has = false
	if Config.JobInteractions[job] then
		for k, v in pairs(Config.JobInteractions[job]) do
			if v.id == id then
				has = true
			end
		end
	end
	return has
end

local function addSubMenu(id1, id2, menu)
	if Config.MenuItems[id1].items and not CheckHasID(id1, id2) then
		Config.MenuItems[id1].items[#Config.MenuItems[id1].items + 1] = menu
	end
end

local function addJobSubMenu(job, id, menu)
	if Config.JobInteractions[job] and not CheckHasID2(job, id) then
		Config.JobInteractions[job][#Config.JobInteractions[job] +1 ] =  menu
	end
end

local function removeSubMenu(id1, id2)
	if Config.MenuItems[id1].items and CheckHasID(id1, id2) then
		for k, v in pairs(Config.MenuItems[id1].items) do
			if v.id == id2 then
				Config.MenuItems[id1].items[k] = nil
			end
		end
	end
end

local function removeJobSubMenu(job, id)
	if Config.JobInteractions[job] and CheckHasID2(job, id) then
		for k, v in pairs(Config.JobInteractions[job]) do
			if v.id == id then
				Config.JobInteractions[job][k] = nil
			end
		end
	end
end

exports('addSubMenu', addSubMenu)
exports('addJobSubMenu', addJobSubMenu)
exports('removeSubMenu', removeSubMenu)
exports('removeJobSubMenu', removeJobSubMenu)

RegisterNetEvent('qb-radialmenu:client:noPlayers', function()
    QBCore.Functions.Notify(Lang:t("error.no_people_nearby"), 'error', 2500)
end)

RegisterNetEvent('qb-radialmenu:client:openDoor', function(data)
    local string = data.id
    local replace = string:gsub("door", "")
    local door = tonumber(replace)
    local ped = PlayerPedId()
    local closestVehicle = GetVehiclePedIsIn(ped) ~= 0 and GetVehiclePedIsIn(ped) or getNearestVeh()
    if closestVehicle ~= 0 then
        if closestVehicle ~= GetVehiclePedIsIn(ped) then
            local plate = QBCore.Functions.GetPlate(closestVehicle)
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', false, plate, door)
                else
                    SetVehicleDoorShut(closestVehicle, door, false)
                end
            else
                if not IsVehicleSeatFree(closestVehicle, -1) then
                    TriggerServerEvent('qb-radialmenu:trunk:server:Door', true, plate, door)
                else
                    SetVehicleDoorOpen(closestVehicle, door, false, false)
                end
            end
        else
            if GetVehicleDoorAngleRatio(closestVehicle, door) > 0.0 then
                SetVehicleDoorShut(closestVehicle, door, false)
            else
                SetVehicleDoorOpen(closestVehicle, door, false, false)
            end
        end
    else
        QBCore.Functions.Notify(Lang:t("error.no_vehicle_found"), 'error', 2500)
    end
end)

RegisterNetEvent('qb-radialmenu:client:setExtra', function(data)
    local string = data.id
    local replace = string:gsub("extra", "")
    local extra = tonumber(replace)
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped)
    if veh ~= nil then
        if GetPedInVehicleSeat(veh, -1) == ped then
            SetVehicleAutoRepairDisabled(veh, true) -- Forces Auto Repair off when Toggling Extra [GTA 5 Niche Issue]
            if DoesExtraExist(veh, extra) then
                if IsVehicleExtraTurnedOn(veh, extra) then
                    SetVehicleExtra(veh, extra, 1)
                    QBCore.Functions.Notify(Lang:t("error.extra_deactivated", {extra = extra}), 'error', 2500)
                else
                    SetVehicleExtra(veh, extra, 0)
                    QBCore.Functions.Notify(Lang:t("success.extra_activated", {extra = extra}), 'success', 2500)
                end
            else
                QBCore.Functions.Notify(Lang:t("error.extra_not_present", {extra = extra}), 'error', 2500)
            end
        else
            QBCore.Functions.Notify(Lang:t("error.not_driver"), 'error', 2500)
        end
    end
end)

RegisterNetEvent('qb-radialmenu:trunk:client:Door', function(plate, door, open)
    local veh = GetVehiclePedIsIn(PlayerPedId())
    if veh ~= 0 then
        local pl = QBCore.Functions.GetPlate(veh)
        if pl == plate then
            if open then
                SetVehicleDoorOpen(veh, door, false, false)
            else
                SetVehicleDoorShut(veh, door, false)
            end
        end
    end
end)

local garaIndex = nil
local function SetupGaragesMenu()
    local isingarage, canStoreVehicle = exports["MojiaGarages"]:IsInGarage()
	local GaragesMenu = {
        id = 'garages',
        title = 'Garages',
        icon = 'warehouse',
        items = {}
    }
	if isingarage then
		GaragesMenu.items[#GaragesMenu.items+1] = {
			id = 'opengarage',
			title = 'Open Garage',
			icon = 'warehouse',
			type = 'client',
			event = 'MojiaGarages:client:openGarage',
			shouldClose = false,
		}
		local veh = nil
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local vehout, distance = QBCore.Functions.GetClosestVehicle(pos)
		local vehin = IsPedInAnyVehicle(ped, true)
		if vehin then
			veh = GetVehiclePedIsIn(ped)
		else
			if NetworkGetEntityIsLocal(vehout) and distance <= 5 then
				veh = vehout
			end
		end
		if veh ~= nil then
			local plate = QBCore.Functions.GetPlate(veh)
			if exports["qb-vehiclekeys"]:HasVehicleKey(plate) then
				if canStoreVehicle then
					GaragesMenu.items[#GaragesMenu.items+1] = {
						id = 'storeVehicle',
						title = 'Store Vehicle',
						icon = 'parking',
						type = 'client',
						event = 'MojiaGarages:client:storeVehicle',
						shouldClose = false,
					}
				end
			end
		end
	end
    if #GaragesMenu.items == 0 then
        if garaIndex then
            RemoveOption(garaIndex)
            garaIndex = nil
        end
    else
        garaIndex = AddOption(GaragesMenu, garaIndex)
    end
end

RegisterNetEvent('qb-radialmenu:client:ChangeSeat', function(data)
    local Veh = GetVehiclePedIsIn(PlayerPedId())
    local IsSeatFree = IsVehicleSeatFree(Veh, data.id)
    local speed = GetEntitySpeed(Veh)
    local HasHarnass = exports['qb-smallresources']:HasHarness()
    if not HasHarnass then
        local kmh = speed * 3.6
        if IsSeatFree then
            if kmh <= 100.0 then
                SetPedIntoVehicle(PlayerPedId(), Veh, data.id)
                QBCore.Functions.Notify(Lang:t("info.switched_seats"), {seat = data.title})
            else
                QBCore.Functions.Notify(Lang:t("error.vehicle_driving_fast"), 'error')
            end
        else
            QBCore.Functions.Notify(Lang:t("error.seat_occupied"), 'error')
        end
    else
        QBCore.Functions.Notify(Lang:t("error.race_harness_on"), 'error')
    end
end)

-- NUI Callbacks

RegisterNUICallback('closeRadial', function()
    setRadialState(false, false)
end)

RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData
    local found, action = selectOption(Config.MenuItems, itemData)
    if itemData and found then
        if action then
            action(itemData)
        elseif itemData.type == 'client' then
            TriggerEvent(itemData.event, itemData)
        elseif itemData.type == 'server' then
            TriggerServerEvent(itemData.event, itemData)
        elseif itemData.type == 'command' then
            ExecuteCommand(itemData.event)
        elseif itemData.type == 'qbcommand' then
            TriggerServerEvent('QBCore:CallCommand', itemData.event, itemData)
        end
    end
end)