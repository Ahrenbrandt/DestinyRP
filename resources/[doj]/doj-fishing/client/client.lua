
local QBCore = exports['qb-core']:GetCoreObject()
local fishing = false
local pause = false
local pausetimer = 0
local correct = 0
local genderNum = 0
local peds = {} 

--============================================================== For testing

if Config.TestFish then 
	RegisterCommand("startfish", function(source)
		TriggerEvent("fishing:fishstart")
	end)

	RegisterCommand('spawnfish', function()
	 	TriggerServerEvent('fishing:server:catch') 
	end)
end

--============================================================== Threads
CreateThread(function()
	while true do
		Wait(1200)
		if pause and fishing then
			pausetimer = pausetimer + 1
		end
	end
end)

CreateThread(function()
	while true do
		Wait(1)
		if fishing then
				if IsControlJustReleased(0, 23) then
					input = 1
			   	end

			if IsControlJustReleased(0, Config.StopFishing) then
				endFishing()
				QBCore.Functions.Notify('Du slutade fiska', 'error')
			end

			if fishing then
				playerPed = PlayerPedId()
				local pos = GetEntityCoords(playerPed)
				if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z -3.0)  then
				else
					endFishing()
					QBCore.Functions.Notify('Vattnet är inte tillräckligt djupt för att fiska', 'error')
				end
				if IsEntityDead(playerPed) or IsEntityInWater(playerPed) then
					endFishing()
					QBCore.Functions.Notify('Fisket tog slut', 'error')
				end
			end
			
			if pausetimer > 3 then
				input = 99
			end
			
			if pause and input ~= 0 then
				pause = false
				if input == correct then
					TriggerEvent('fishing:SkillBar')
				else
					QBCore.Functions.Notify('Fisken rymde!', 'error')
					exports['textUi']:DrawTextUi('hide')
					loseBait()
				end
			end
		end
	end
end)

CreateThread(function()
	while true do

		local wait = math.random(Config.FishingWaitTime.minTime , Config.FishingWaitTime.maxTime)
		Wait(wait)
		if fishing then
			pause = true
			correct = 1
			TriggerEvent('3dme:triggerDisplay', 'Fiskespö börjar dra!')
			exports['textUi']:DrawTextUi('show', "Tryck på [F] för att fånga fisk!")
			input = 0
			pausetimer = 0
		end
	end
end)

CreateThread(function()
	while true do
		Wait(500)
		for k = 1, #Config.PedList, 1 do
			v = Config.PedList[k]
			local playerCoords = GetEntityCoords(PlayerPedId())
			local dist = #(playerCoords - v.coords)

			if dist < 50.0 and not peds[k] then
				local ped = nearPed(v.model, v.coords, v.heading, v.gender, v.animDict, v.animName, v.scenario)
				peds[k] = {ped = ped}
			end

			if dist >= 50.0 and peds[k] then
				for i = 255, 0, -51 do
					Wait(50)
					SetEntityAlpha(peds[k].ped, i, false)
				end
				DeletePed(peds[k].ped)
				peds[k] = nil
			end
		end
	end
end)

--============================================================== Events

RegisterNetEvent('fishing:client:progressBar', function()
	exports['progressBars']:drawBar(1000, 'Öppna Tackel Låda')
end)

RegisterNetEvent('fishing:client:attemptTreasureChest', function()
	local ped = PlayerPedId()
	attemptTreasureChest()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			QBCore.Functions.Progressbar("accepted_key", "Sätter in nyckel..", (math.random(2000, 5000)), false, true, {
				disableMovement = true,
				disableCarMovement = true,
				disableMouse = false,
				disableCombat = true,
			}, {
				animDict = "mini@repair",
				anim = "fixing_a_player",
				flags = 16,
			}, {}, {}, function() -- Done
				ClearPedTasks(ped)
				openedTreasureChest()
			end, function() -- Cancel
				ClearPedTasks(ped)
				QBCore.Functions.Notify("Avbröt!", "error")
			end)
		else
		  QBCore.Functions.Notify("Du har ingen nyckel till det här låset!", "error")
		end
	  end, 'fishingkey')
end)


RegisterNetEvent('fishing:SkillBar', function(message)
	exports['textUi']:DrawTextUi('hide')
	if Config.Skillbar == "reload-skillbar" then
		local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
		if finished ~= 100 then
			QBCore.Functions.Notify('The Fish Got Away!', 'error')
			loseBait()
		else
			local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
			if finished2 ~= 100 then
				QBCore.Functions.Notify('The Fish Escaped!', 'error')
				loseBait()
			else
				local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
				if finished3 ~= 100 then
					QBCore.Functions.Notify('The Fish Got Away!', 'error')
					loseBait()
				else
					catchAnimation()
				end
			end
		end
	elseif Config.Skillbar == "np-skillbar" then 
		local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
		if finished ~= 100 then
			QBCore.Functions.Notify('The Fish Got Away!', 'error')
			loseBait()
		else
			catchAnimation()
		end
	elseif Config.Skillbar == "qb-skillbar" then
		local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
		Skillbar.Start({
			duration = math.random(2500,5000),
			pos = math.random(10, 30),
			width = math.random(10, 20),
		}, function()
			catchAnimation()
		end, function()
			QBCore.Functions.Notify('Fisken rymde!', 'error')
			loseBait()
		end)
	end
end) 

RegisterNetEvent('fishing:client:spawnFish', function(args)
	local time = 10000
	local args = tonumber(args)
	if args == 1 then 
		RequestTheModel("A_C_KillerWhale")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_KillerWhale`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_KillerWhale`)
		Wait(time)
		DeletePed(ped)	
	elseif args == 2 then 
		RequestTheModel("A_C_dolphin")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_dolphin`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_dolphin`)
		Wait(time)
		DeletePed(ped)
	elseif args == 3 then
		RequestTheModel("A_C_sharkhammer")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_sharkhammer`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_sharkhammer`)
		Wait(time)
		DeletePed(ped)
	elseif args == 4 then
		RequestTheModel("A_C_SharkTiger")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_SharkTiger`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_SharkTiger`)
		Wait(time)
		DeletePed(ped)
	elseif args == 5 then
		RequestTheModel("A_C_stingray")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `A_C_stingray`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`A_C_stingray`)
		Wait(time)
		DeletePed(ped)
	else
		RequestTheModel("a_c_fish")
		local pos = GetEntityCoords(PlayerPedId())
		local ped = CreatePed(29, `a_c_fish`, pos.x, pos.y, pos.z, 90.0, true, false)
		SetEntityHealth(ped, 0)
		DecorSetInt(ped, "propHack", 74)
		SetModelAsNoLongerNeeded(`a_c_fish`)
		Wait(time)
		DeletePed(ped)
	end
end)

RegisterNetEvent('fishing:client:useFishingBox', function(BoxId)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", 'FishingBox_'..BoxId, {maxweight = 18000000, slots = 250})
	TriggerEvent("inventory:client:SetCurrentStash", 'FishingBox_'..BoxId) 
end) 

RegisterNetEvent('fishing:fishstart', function()
	local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed) 
	if IsPedSwimming(playerPed) then return QBCore.Functions.Notify("Du kan inte bada och fiska samtidigt.", "error") end 
	if IsPedInAnyVehicle(playerPed) then return QBCore.Functions.Notify("Du måste lämna ditt fordon för att börja fiska.", "error") end 
	if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z - 3.0)  then
		local time = 1000
		QBCore.Functions.Notify('Använda fiskespö', 'primary', time)
		Wait(time)
		exports['textUi']:DrawTextUi('show', "Tryck på [X] för att när som helst stoppa fisket")
		fishAnimation()
	else
		QBCore.Functions.Notify('Du måste gå längre bort från stranden', 'error')
	end
end, false)

RegisterNetEvent('doj:client:ReturnBoat', function(args)
	local ped = PlayerPedId()
	local args = tonumber(args)
	if IsPedInAnyVehicle(ped) then
		if args == 1 then 
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.LaPuerta.x, Config.PlayerReturnLocation.LaPuerta.y, Config.PlayerReturnLocation.LaPuerta.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.LaPuerta.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		elseif args == 2 then
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.PaletoCove.x, Config.PlayerReturnLocation.PaletoCove.y, Config.PlayerReturnLocation.PaletoCove.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.PaletoCove.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		elseif args == 3 then
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.ElGordo.x, Config.PlayerReturnLocation.ElGordo.y, Config.PlayerReturnLocation.ElGordo.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.ElGordo.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		elseif args == 3 then
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.ActDam.x, Config.PlayerReturnLocation.ActDam.y, Config.PlayerReturnLocation.ActDam.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.ActDam.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		else
			local boat = GetVehiclePedIsIn(ped,true) 
			QBCore.Functions.DeleteVehicle(boat)
			SetEntityCoords(ped, Config.PlayerReturnLocation.AlamoSea.x, Config.PlayerReturnLocation.AlamoSea.y, Config.PlayerReturnLocation.AlamoSea.z, 0, 0, 0, false) 
			SetEntityHeading(ped, Config.PlayerReturnLocation.AlamoSea.w)
			TriggerServerEvent('fishing:server:returnDeposit')
		end
	end
end)

RegisterNetEvent('doj:client:rentaBoat', function(args)
	local args = tonumber(args)
	local chance = math.random(1, 20)

	QBCore.Functions.TriggerCallback('fishing:server:checkMoney', function(isSuccess)
		if isSuccess then 
			if chance == 10 then
				TriggerServerEvent("fishing:server:addTackleBox")
			end
			if args == 1 then 
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Hyr-en-båt")
					exports['lj-fuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.LaPuerta.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.LaPuerta, true) 
			elseif args == 2 then 
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Hyr-en-båt")
					exports['lj-fuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.PaletoCove.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.PaletoCove, true) 
			elseif args == 3 then 
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Hyr-en-båt")
					exports['lj-fuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.ElGordo.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.ElGordo, true) 
			elseif args == 3 then
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Hyr-en-båt")
					exports['lj-fuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.ActDam.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.ActDam, true) 
			else
				QBCore.Functions.SpawnVehicle(Config.RentalBoat, function(boat)
					SetVehicleNumberPlateText(boat, "Hyr-en-båt")
					exports['lj-fuel']:SetFuel(boat, 100.0)
					SetEntityHeading(boat, Config.BoatSpawnLocation.AlamoSea.w)
					TaskWarpPedIntoVehicle(PlayerPedId(), boat, -1)
					TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(boat))
					SetVehicleEngineOn(boat, true, true)
				end, Config.BoatSpawnLocation.AlamoSea, true) 
			end  
		end
	end)
end)

RegisterNetEvent('doj:client:BoatMenu', function(data)
	local ped = PlayerPedId()
    local inVehicle = IsPedInAnyVehicle(ped)
	if data.location == 1 then 
        if Config.Fish24hours then
            if inVehicle then
                ReturnBoatLaPuerta()
            else
                BoatMenuLaPuerta()
            end
        else
            if GetClockHours() >= 6 and GetClockHours() <= 21 then
                if inVehicle then
                    ReturnBoatLaPuerta()
                else
                    BoatMenuLaPuerta()
                end
            else
                QBCore.Functions.Notify('För sent att fiska!, Öppet från 06:00 / 21:00', 'error')
            end
        end
	elseif data.location == 2 then
        if Config.Fish24hours then
            if inVehicle then
                ReturnBoatPaletoCove()
            else
                BoatMenuPaletoCove()
            end
        else
            if GetClockHours() >= 6 and GetClockHours() <= 21 then
                if inVehicle then
                    ReturnBoatPaletoCove()
                else
                    BoatMenuPaletoCove()
                end
            else
                QBCore.Functions.Notify('För sent att fiska!, Öppet från 06:00 / 21:00', 'error')
            end
        end
    elseif data.location == 3 then
        if Config.Fish24hours then
            if inVehicle then
                ReturnBoatElGordo()
            else
                BoatMenuElGordo()
            end
        else
            if GetClockHours() >= 6 and GetClockHours() <= 21 then
                if inVehicle then
                    ReturnBoatElGordo()
                else
                    BoatMenuElGordo()
                end
            else
                QBCore.Functions.Notify('För sent att fiska!, Öppet från 06:00 / 21:00', 'error')
            end
        end
    elseif data.location == 4 then
		if Config.Fish24hours then
			if inVehicle then
				ReturnBoatActDam()
			else
				BoatMenuActDam()
			end
		else
			if GetClockHours() >= 6 and GetClockHours() <= 21 then
				if inVehicle then
					ReturnBoatActDam()
				else
					BoatMenuActDam()
				end
			else
				QBCore.Functions.Notify('För sent att fiska!, Öppet från 06:00 / 21:00', 'error')
			end
		end
	else
        if Config.Fish24hours then
            if inVehicle then
                ReturnBoatAlamoSea()
            else
                BoatMenuAlamoSea()
            end
        else
            if GetClockHours() >= 6 and GetClockHours() <= 21 then
                if inVehicle then
                    ReturnBoatAlamoSea()
                else
                    BoatMenuAlamoSea()
                end
            else
                QBCore.Functions.Notify('För sent att fiska!, Öppet från 06:00 / 21:00', 'error')
            end
        end
	end
end)

RegisterNetEvent('fishing:client:anchor', function()
    local currVeh = GetVehiclePedIsIn(PlayerPedId(), false)
    if currVeh ~= 0 then
        local vehModel = GetEntityModel(currVeh)
        if vehModel ~= nil and vehModel ~= 0 then
            if DoesEntityExist(currVeh) then
                if IsThisModelABoat(vehModel) or IsThisModelAJetski(vehModel) or IsThisModelAnAmphibiousCar(vehModel) or IsThisModelAnAmphibiousQuadbike(vehModel) then
                    if IsBoatAnchoredAndFrozen(currVeh) then
						QBCore.Functions.Notify('Hämtar ankare', 'success')
                        Wait(2000)
						QBCore.Functions.Notify('Ankare inaktiverat', 'primary')
                        SetBoatAnchor(currVeh, false)
                        SetBoatFrozenWhenAnchored(currVeh, false)
                        SetForcedBoatLocationWhenAnchored(currVeh, false)
                    elseif not IsBoatAnchoredAndFrozen(currVeh) and CanAnchorBoatHere(currVeh) and GetEntitySpeed(currVeh) < 3 then
                        SetEntityAsMissionEntity(currVeh,false,true)
						QBCore.Functions.Notify('Tappa ankare', 'primary')
                        Wait(2000)
						QBCore.Functions.Notify('Ankare aktiverat', 'success')
                        SetBoatAnchor(currVeh, true)
                        SetBoatFrozenWhenAnchored(currVeh, true)
                        SetForcedBoatLocationWhenAnchored(currVeh, true)
                    end
                end
            end
        end
    end
end)

--============================================================== Functions

loseBait = function()
	local chance = math.random(1, 15)
	if chance <= 5 then
		TriggerServerEvent("fishing:server:removeFishingBait")
		loseBaitAnimation()
	end
end

loseBaitAnimation = function()
	local ped = PlayerPedId()
	local animDict = "gestures@f@standing@casual"
	local animName = "gesture_damn"
	DeleteEntity(rodHandle)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(100)
	end
	TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 0, 0, 0, 48, 0)
	RemoveAnimDict(animDict)
	exports['textUi']:DrawTextUi('show', "Fisken tog ditt bete!")
	Wait(2000)
	exports['textUi']:DrawTextUi('hide')
	fishAnimation()
end

RequestTheModel = function(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end

catchAnimation = function()
	local ped = PlayerPedId()
	local animDict = "mini@tennis"
	local animName = "forehand_ts_md_far"
	DeleteEntity(rodHandle)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(100)
	end
	TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 0, 0, 0, 48, 0)
	local time = 1750
	QBCore.Functions.Notify('Fisk fångad!', 'success', time)
	Wait(time)
	TriggerServerEvent('fishing:server:catch') 
	loseBait()
	if math.random(1, 100) < 50 then
		TriggerServerEvent('hud:server:RelieveStress', 50)
	end
	PlaySoundFrontend(-1, "OK", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
	RemoveAnimDict(animDict)
	endFishing()
end

fishAnimation = function()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			local ped = PlayerPedId()
			local animDict = "amb@world_human_stand_fishing@idle_a"
			local animName = "idle_c"
			RequestAnimDict(animDict)
			while not HasAnimDictLoaded(animDict) do
				Wait(100)
			end
			TaskPlayAnim(ped, animDict, animName, 1.0, -1.0, 1.0, 11, 0, 0, 0, 0)
			fishingRodEntity()
			fishing = true
			Wait(3700)
			exports['textUi']:DrawTextUi('hide') 
		else
		  endFishing()
		  QBCore.Functions.Notify("Du har inget fiskebete", "error")
		end
	end, 'fishbait')
end

fishingRodEntity = function()
	local ped = PlayerPedId()
    local pedPos = GetEntityCoords(ped)
	local fishingRodHash = `prop_fishing_rod_01`
	local bone = GetPedBoneIndex(ped, 18905)
    rodHandle = CreateObject(fishingRodHash, pedPos, true)
    AttachEntityToEntity(rodHandle, ped, bone, 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
end

endFishing = function() 
	local ped = PlayerPedId()
    if rodHandle ~= 0 then
		DeleteObject(rodHandle)
		ClearPedTasks(ped)
		fishing = false
		rodHandle = 0
		exports['textUi']:DrawTextUi('hide')
    end
end

attemptTreasureChest = function()
	local ped = PlayerPedId()
	local animDict = "veh@break_in@0h@p_m_one@"
	local animName = "low_force_entry_ds"
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do
		Wait(100)
	end
	TaskPlayAnim(ped, animDict, animName, 1.0, 1.0, 1.0, 1, 0.0, 0, 0, 0)
	RemoveAnimDict(animDict)
	QBCore.Functions.Notify('Försöker öppna skattkistan', 'primary', 1500)
	Wait(1500)
	ClearPedTasks(PlayerPedId())
end

openedTreasureChest = function()
	if math.random(1,15) == 10 then
		TriggerServerEvent("QBCore:Server:RemoveItem", "fishingkey", 1)
		TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fishingkey"], "remove", 1)
		QBCore.Functions.Notify("Den korroderade nyckeln har spruckit", "error", 7500)
	end
	TriggerServerEvent("QBCore:Server:RemoveItem", "fishinglootbig", 1)
	TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["fishinglootbig"], "remove", 1)
	QBCore.Functions.Notify("Skattkistan öppnad! Var noga med att samla allt ditt byte!!", "success", 7500)
	local ShopItems = {} 
	ShopItems.label = "Treasure Chest"
	ShopItems.items = Config.largeLootboxRewards
	ShopItems.slots = #Config.largeLootboxRewards
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end

nearPed = function(model, coords, heading, gender, animDict, animName, scenario)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
		Wait(1)
	end

	if gender == 'male' then
		genderNum = 4
	elseif gender == 'female' then 
		genderNum = 5
	else
		print("Inget kön anges! Kontrollera din konfiguration!")
	end	

	ped = CreatePed(genderNum, GetHashKey(v.model), coords, heading, false, true)
	SetEntityAlpha(ped, 0, false)

	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Wait(1)
		end
		TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end
	if scenario then
		TaskStartScenarioInPlace(ped, scenario, 0, true) 
	end
	for i = 0, 255, 51 do
		Wait(50)
		SetEntityAlpha(ped, i, false)
	end

	return ped
end
