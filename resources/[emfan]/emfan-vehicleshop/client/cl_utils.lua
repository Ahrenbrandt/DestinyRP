
-- exports['qb-target']:AddBoxZone("OrderCar", vector3(-55.22, -1097.15, 26.32), 1.0, 1.0, {
--     name = "OrderCar",
--     heading = 200.74,
--     debugPoly = false,
--     minZ = 27.24-1,
--     maxZ = 27.24+1,
--     }, {
--         options = {
--         {
--             event = "emfan-vehicleshop:client:OrderCar",
--             icon = "fa-solid fa-cars",
--             label = Lang:t('info.order_car'),
--         },
--     },
--     distance = 2.5
-- })

exports['qb-target']:AddBoxZone("OrderedVehicles", vector3(-32.99, -1115.03, 27.26), 1.0, 1.0, {
    name = "OrderedVehicles",
    heading = 200.74,
    debugPoly = false,
    minZ = 27.24-1,
    maxZ = 27.24+1,
    }, {
        options = {
        {
            event = "emfan-vehicleshop:client:CheckOrders",
            icon = "fas fa-car",
            label = Lang:t('info.check_vehicle_orders'),
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("StartPickup", vector3(Config.Peds[2]['Coords']['X'], Config.Peds[2]['Coords']['Y'], Config.Peds[2]['Coords']['Z']), 1.0, 1.0, {
    name = "StartPickup",
    heading = Config.Peds[1]['Coords']['H'],
    debugPoly = false,
    minZ = Config.Peds[2]['Coords']['Z'] - 1.0,
    maxZ = Config.Peds[2]['Coords']['Z'] + 1.0,
    }, {
        options = {
            {
            event = "emfan-vehicleshop:client:StartPickup",
            icon = "fas fa-truck-flatbed",
            label = Lang:t('info.start_pick_up'),
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("DoPickup", vector3(Config.Peds[1]['Coords']['X'], Config.Peds[1]['Coords']['Y'], Config.Peds[1]['Coords']['Z']), 1.0, 1.0, {
    name = "DoPickup",
    heading = Config.Peds[1]['Coords']['H'],
    debugPoly = false,
    minZ = Config.Peds[1]['Coords']['Z'] - 1,
    maxZ = Config.Peds[1]['Coords']['Z'] + 1,
    }, {
        options = {
            {
            event = "emfan-vehicleshop:client:DoPickup",
            icon = "fa fa-truck-ramp",
            label = Lang:t('info.pick_up_vehicles'),
        },
    },
    distance = 2.5
})

exports['qb-target']:AddBoxZone("OpenVehicleManagement", vector3(Config.VehicleManagementPosition['x'], Config.VehicleManagementPosition['y'], Config.VehicleManagementPosition['z']), 1.0, 1.0, {
    name = "OpenVehicleManagement",
    heading = 200.74,
    debugPoly = false,
    minZ = Config.VehicleManagementPosition['z']-1.0,
    maxZ = Config.VehicleManagementPosition['z']+1.0,
    }, {
        options = {
        {
            event = "emfan-vehicleshop:client:ManageVehicles",
            icon = "fas fa-business-time",
            label = Lang:t('info.manage_store_vehicles'),
        },
    },
    distance = 2.5
})


-- Name: PDM | 2022-03-16T22:35:31Z
CreateThread(function()
    if Config.PolyZones == true then 
        local EventLimit = 0
        local PDM = PolyZone:Create({
            vector2(-54.534141540527, -1070.3449707031),
            vector2(-21.057968139648, -1081.7098388672),
            vector2(-19.502052307129, -1075.2078857422),
            vector2(-3.6425023078918, -1081.6635742188),
            vector2(-6.8971519470215, -1086.4416503906),
            vector2(-9.9650993347168, -1093.7541503906),
            vector2(-6.6473693847656, -1095.2386474609),
            vector2(-15.595590591431, -1119.8198242188),
            vector2(-62.60994720459, -1120.3013916016),
            vector2(-68.318168640137, -1117.6635742188),
            vector2(-75.116241455078, -1106.9359130859),
            vector2(-59.760601043701, -1067.3397216797)
        }, {
            name="PDM",
        })
        insidePDM = false
        while true do
            local plyPed = PlayerPedId()
            local coord = GetEntityCoords(plyPed)
            insidePDM = PDM:isPointInside(coord)
            Wait(5000)
            -- print("PDM: ", insidePDM)
            if insidePDM and EventLimit == 0 then
                EventLimit = 1
                QBCore.Functions.TriggerCallback('emfan-vehicleshop:server:CheckDeloadAvail', function(cb)
                    if cb == true then
                        TriggerEvent('emfan-vehicleshop:client:DeloadVehicles')
                    else
                        EventLimit = 0
                        return
                    end
                end)
                
            end
        end
    elseif Config.PolyZones == false then
        local EventLimit = 0
        while true do
            Wait(5000)
            local xPlayer = PlayerPedId()
            local xPlayerCoords = GetEntityCoords(xPlayer)
            local xDist = #(xPlayerCoords - Config.ShopLocation)
            if xDist < 50.0 then 
                insidePDM = true
                if insidePDM and EventLimit == 0 then
                    EventLimit = 1
                    QBCore.Functions.TriggerCallback('emfan-vehicleshop:server:CheckDeloadAvail', function(cb)
                        if cb == true then
                            TriggerEvent('emfan-vehicleshop:client:DeloadVehicles')
                        else
                            EventLimit = 0
                            return
                        end
                    end)
                end
            end
        end
    end
end)

