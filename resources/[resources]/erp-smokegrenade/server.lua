RegisterServerEvent("erp-smokegrenade:explode", function(coords, size, smoketime)
    TriggerClientEvent("erp-smokegrenade:explode", -1, coords, size, smoketime)
end)