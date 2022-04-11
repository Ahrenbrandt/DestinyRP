Citizen.CreateThread(function()
	if IsWeaponValid(`WEAPON_SMOKEGRENADE`) then
		AddTextEntry("WT_GNADE_SMOK", "Smoke grenade")
	end

	while true do
		local playerPed = PlayerPedId()
		local weapon = GetSelectedPedWeapon(playerPed)
		if weapon == `WEAPON_SMOKEGRENADE` then
			if IsPedShooting(playerPed) then
				local playerCoords = GetEntityCoords(playerPed)
				local handle = GetClosestObjectOfType(playerCoords.x, playerCoords.y, playerCoords.z, 50.0, `w_ex_smokegrenade`, false, false, false)
				CreateThread(function()
					Citizen.Wait(math.random(3000, 5000))
					if DoesEntityExist(handle) then
						local grenadeCoords = GetEntityCoords(handle)
						local size = math.random(15, 17) / 10
						local smoketime = math.random(17500, 22500)
						print("Smoke time", smoketime, "\nSmoke Size:", size, "\nSmoke Coords:", grenadeCoords)
						TriggerServerEvent("erp-smokegrenade:explode", grenadeCoords, size, smoketime)
					end
					return
				end)
			end
		else
			Citizen.Wait(300)
		end

		Citizen.Wait(0)
	end
end)

RegisterNetEvent("erp-smokegrenade:explode", function(coords, size, smoketime)
	local playerCoords = GetEntityCoords(PlayerPedId())

	if #(playerCoords - coords) < 80.0 then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Citizen.Wait(0)
		end
		UseParticleFxAssetNextCall("core")
		
		local particle = StartParticleFxLoopedAtCoord("exp_grd_grenade_smoke", coords.x, coords.y, coords.z + 0.2, 0.0, 0.0, 0.0, size, false, false, false, false)
		local particle2 = StartParticleFxLoopedAtCoord("weap_smoke_grenade", coords.x, coords.y, coords.z - 0.4, 0.0, 0.0, 0.0, size, false, false, false, false)

		Citizen.Wait(smoketime)

		StopParticleFxLooped(particle, 0)
		StopParticleFxLooped(particle2, 0)
	end
end)