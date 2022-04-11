local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

CreateThread(function()
    if Config.SaleAvailableForJob then
        if PlayerData.job.name == Config.jobName then
            for k, v in pairs(Config.location) do
                exports['qb-target']:AddBoxZone(v.name, v.coords, v.length, v.width, {
                    name = v.name,
                    heading = v.heading,
                    debugPoly = v.debug,
                    minZ = v.minz,
                    maxZ = v.maxz,
                }, {
                    options = {
                        {
                          type = "client",
                          action = function(entity) 
                            TriggerEvent('re2-vault:viewStorages', k)
                          end,
                          icon = "fas fa-box-open",
                          label = "Visa lager",
                        },
                        {
                            type = "client",
                            action = function(entity) 
                              TriggerEvent('re2-vault:createStorageFor', k)
                            end,
                            icon = "fas fa-boxes",
                            label = "Skapa Ett Lager För",
                        },
                        {
                            type = "client",
                            action = function(entity) 
                              TriggerEvent('re2-vault:getcitizenId', k)
                            end,
                            icon = "fas fa-key",
                            label = "Ändra lagerlösenord",
                        },
                    },
                    distance = v.distance
                })
            end
        else
            for k, v in pairs(Config.location) do
                exports['qb-target']:AddBoxZone(v.name, v.coords, v.length, v.width, {
                    name = v.name,
                    heading = v.heading,
                    debugPoly = v.debug,
                    minZ = v.minz,
                    maxZ = v.maxz,
                }, {
                    options = {
                        {
                          type = "client",
                          action = function(entity) 
                            TriggerEvent('re2-vault:viewStorages', k)
                          end,
                          icon = "fas fa-box-open",
                          label = "Visa lager",
                        },
                        
                    },
                    distance = v.distance
                })
            end
        end
    else
        for k, v in pairs(Config.location) do
            exports['qb-target']:AddBoxZone(v.name, v.coords, v.length, v.width, {
                name = v.name,
                heading = v.heading,
                debugPoly = v.debug,
                minZ = v.minz,
                maxZ = v.maxz,
            }, {
                options = {
                    {
                      type = "client",
                      action = function(entity) 
                        TriggerEvent('re2-vault:viewStorages', k)
                      end,
                      icon = "fas fa-box-open",
                      label = "Visa lager",
                    },
                    {
                        type = "client",
                        action = function(entity) 
                          TriggerEvent('re2-vault:createStorage', k)
                        end,
                        icon = "fas fa-boxes",
                        label = "Köp ett lager",
                      },
                },
                distance = v.distance
            })
        end
    end
    
    
  end)

AddEventHandler('re2-vault:viewStorages', function(location)
    local player=QBCore.Functions.GetPlayerData()
    local citizenid=player.citizenid
    local p = nil
    local data ={
        cid = citizenid,
        storagelocation = Config.location[location].name,
    }
    local fetchStoragePromise = function(data)
        if p then return end
        p = promise.new()
        QBCore.Functions.TriggerCallback('re2-vault:server:fetchStorage', function(result)
            p:resolve(result)
        end, data)
        return Citizen.Await(p)
    end
    
    local result = fetchStoragePromise(data)
    p = nil
    if result then
        local storagesMenu = {
            {
                header = "Dina lagringer i "..Config.location[location].name,
                isMenuHeader = true
            }
        }

        for k, v in pairs(result) do
            storagesMenu[#storagesMenu+1] = {
                header = v.storagename,
                txt = "Kapacitet : "..(v.storage_size/1000).." -- Ägare : "..v.citizenid,
                params = {
                    event = "re2-vault:openStorageMenu",
                    args = {
                        storageid = v.id
                    }
                }

            }
        end

        storagesMenu[#storagesMenu+1] = {
            header = "Stäng meny",
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu"
            }

        }
        exports['qb-menu']:openMenu(storagesMenu)
    else
        QBCore.Functions.Notify("Det finns inget lager på denna plats", "error")
    end
end)


AddEventHandler('re2-vault:openStorageMenu', function(data)
    local player=QBCore.Functions.GetPlayerData()
    local citizenid=player.citizenid
    -- local storagename=location.."_"..citizenid
    local dialog = exports['iyc-input']:ShowIycInput({
        header = "Lössenord",
        submitText = "Klar",
        inputs = {
            {
                text = "Lössenord", -- text you want to be displayed as a place holder
                name = "password", -- name of the input should be unique otherwise it might override
                type = "password", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })

    if dialog ~= nil then
        local p = nil
        local data ={
            password = dialog.password,
            id = data.storageid
        }
        local openStoragePromise = function(data)
            if p then return end
            p = promise.new()
            QBCore.Functions.TriggerCallback('re2-vault:server:checkThePassword', function(result)
                p:resolve(result)
            end, data)
            return Citizen.Await(p)
        end
    
        local result = openStoragePromise(data)
        p = nil
        if result then
            local v = result[1]
            local storageMenu = {
                {
                    isHeader = true,
                    header = 'Lager '..v.storagename
                },
                {
                    header = '📦 | Öppna Lagret',
                    txt = 'Öppna '..v.storagename .." Lager",
                    params = {
                        event = 're2-vault:openInventory',
                        args = {
                            storagename = v.storage_location..'_'..v.storagename..'_'..v.citizenid,
                            storagesize = v.storage_size
                        }
                    }
                }
            }
            if citizenid == v.citizenid then
                local addmembermenu={
                    header = '➕ | Lägg Till Medlem',
                    txt = 'Lägg Till Medlem Till '..v.storagename..' Lager',
                    params = {
                        event = 're2-vault:addMemberToStorage',
                        args = {
                            storageid = v.id,
                        }
                    }
                }
                table.insert(storageMenu,addmembermenu)
                local removememberMenu={
                    header = '➖ | Ta Bort Medlem',
                    txt = 'Ta Bort Medlem Från '..v.storagename..' Lager',
                    params = {
                        event = 're2-vault:removeMemberFromStorage',
                        args = {
                            storageid = v.id
                        }
                    }
                }
                table.insert(storageMenu,removememberMenu)
                local addstorageMenu={
                    header = '🛒 | Lägg Till Plats',
                    txt = 'Lägg 200lbs Till '..v.storagename..' Lagret',
                    params = {
                        event = 're2-vault:addCapacity',
                        args = {
                            storageid = v.id
                        }
                    }
                }
                table.insert(storageMenu,addstorageMenu) 
                local addstorageMenu={
                    header = '🔑 | Ändra Lössenord',
                    txt = 'Ändra Lager Lössenord',
                    params = {
                        event = 're2-vault:changePassword',
                        args = {
                            storageid = v.id
                        }
                    }
                }
                table.insert(storageMenu,addstorageMenu) 
            end
            local closeMenu={
                header = "Stäng Meny",
                txt = "",
                params = {
                    event = "qb-menu:client:closeMenu"
                }
            }
            table.insert(storageMenu,closeMenu) 
              exports['qb-menu']:openMenu(storageMenu)
            QBCore.Functions.Notify("Rätt Lössenord", "success")
        else
            QBCore.Functions.Notify("Fel Lössenord", "error")
        end
    end
end)

AddEventHandler('re2-vault:createStorage', function(location)
    local player=QBCore.Functions.GetPlayerData()
    local citizenid=player.citizenid
    local cpdialog = exports['iyc-input']:ShowIycInput({
        header = "Skapa lössenord",
        submitText = "Klar",
        inputs = {
            {
                text = "Namn", -- text you want to be displayed as a place holder
                name = "name", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            },
            {
                text = "Lössenord", -- text you want to be displayed as a place holder
                name = "password", -- name of the input should be unique otherwise it might override
                type = "password", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })
    if cpdialog ~= nil then
        if player.money['cash'] >= tonumber(Config.StorageCreationAmount) then
        local p = nil
        local data ={
            cid = citizenid,
            password = cpdialog.password,
            storagename = cpdialog.name,
            storagelocation = Config.location[location].name,
            storagesize = Config.StorageDefaultWeight
        }
        local createStoragePromise = function(data)
            if p then return end
            p = promise.new()
            QBCore.Functions.TriggerCallback('re2-vault:server:createStorage', function(result)
                p:resolve(result)
            end, data)
            return Citizen.Await(p)
        end
    
        local result = createStoragePromise(data)
        p = nil
        if result then
            TriggerServerEvent('re2-vault:server:removeMoney',Config.StorageCreationAmount)
            QBCore.Functions.Notify("Lager skapat", "success")
        else
            QBCore.Functions.Notify("Dubblettnamn för lageret", "error")
        end
        -- return cb(result)
    else
        QBCore.Functions.Notify("Du har inte råd", "error")
    end
    end


end)

AddEventHandler('re2-vault:createStorageFor', function(location)
    local player=QBCore.Functions.GetPlayerData()
    -- local citizenid=player.citizenid
    local cpdialog = exports['iyc-input']:ShowIycInput({
        header = "Skapa lager för",
        submitText = "Klar",
        inputs = {
            {
                text = "Namn", -- text you want to be displayed as a place holder
                name = "name", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            },
            {
                text = "Id", -- text you want to be displayed as a place holder
                name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            },
            {
                text = "Lössenord", -- text you want to be displayed as a place holder
                name = "password", -- name of the input should be unique otherwise it might override
                type = "password", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })
    if cpdialog ~= nil then
        if player.money['cash'] >= tonumber(Config.StorageCreationAmount) then
        local p = nil
        local data ={
            cid = cpdialog.citizenid,
            password = cpdialog.password,
            storagename = cpdialog.name,
            storagelocation = Config.location[location].name,
            storagesize = Config.StorageDefaultWeight
        }
        local createStoragePromise = function(data)
            if p then return end
            p = promise.new()
            QBCore.Functions.TriggerCallback('re2-vault:server:createStorage', function(result)
                p:resolve(result)
            end, data)
            return Citizen.Await(p)
        end
    
        local result = createStoragePromise(data)
        p = nil
        if result then
            TriggerServerEvent('re2-vault:server:removeMoney',Config.StorageCreationAmount)
            QBCore.Functions.Notify("Lager Skapat", "success")
        else
            QBCore.Functions.Notify("Dubblettnamn för lageret", "error")
        end
        -- return cb(result)
    else
        QBCore.Functions.Notify("Du har inte råd", "error")
    end
    end


end)


AddEventHandler('re2-vault:addMemberToStorage', function(data)
    local player=QBCore.Functions.GetPlayerData()
    local citizenid=player.citizenid
    -- local storagename=location.."_"..citizenid
    local mdialog = exports['iyc-input']:ShowIycInput({
        header = "Lägg Till Medlem",
        submitText = "Klar",
        inputs = {
            {
                text = "Server ID", -- text you want to be displayed as a place holder
                name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })

    if mdialog ~= nil then
        local p = nil
        local data ={
            citizenid = mdialog.citizenid,
            id = data.storageid
        }
        local addMemberPromise = function(data)
            if p then return end
            p = promise.new()
            QBCore.Functions.TriggerCallback('re2-vault:server:addMember', function(result)
                p:resolve(result)
            end, data)
            return Citizen.Await(p)
        end
    
        local result = addMemberPromise(data)
        p = nil
        if result then
            QBCore.Functions.Notify("Du La Till En Medlem", "success")
        else
            QBCore.Functions.Notify("Något Gick Fel", "error")
        end
    end
end)

AddEventHandler('re2-vault:removeMemberFromStorage', function(data)
    local player=QBCore.Functions.GetPlayerData()
    local citizenid=player.citizenid
    -- local storagename=location.."_"..citizenid
    local mdialog = exports['iyc-input']:ShowIycInput({
        header = "Ta Bort Medlem",
        submitText = "Klar",
        inputs = {
            {
                text = "Server ID", -- text you want to be displayed as a place holder
                name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })

    if mdialog ~= nil then
        local p = nil
        local data ={
            citizenid = mdialog.citizenid,
            id = data.storageid
        }
        local removeMemberPromise = function(data)
            if p then return end
            p = promise.new()
            QBCore.Functions.TriggerCallback('re2-vault:server:removeMember', function(result)
                p:resolve(result)
            end, data)
            return Citizen.Await(p)
        end
    
        local result = removeMemberPromise(data)
        p = nil
        if result then
            QBCore.Functions.Notify("Du Tog Bort En Medlem", "success")
        else
            QBCore.Functions.Notify("Något Gick Fel", "error")
        end
    end
end)

AddEventHandler('re2-vault:openInventory', function(data)
        TriggerServerEvent("inventory:server:OpenInventory", "stash", data.storagename,{
            maxweight = data.storagesize,
            slots = Config.StorageSlots,
        })
        TriggerEvent("inventory:client:SetCurrentStash", data.storagename)
        QBCore.Functions.Notify("Du Öppnar Lagret...", "success")

    
end)


AddEventHandler('re2-vault:addCapacity', function(data)
    local player=QBCore.Functions.GetPlayerData()
    if player.money['cash'] >= tonumber(Config.StorageAddPrice) then
        local p = nil
        local data ={
            id = data.storageid
        }
        local addCapacityPromise = function(data)
            if p then return end
            p = promise.new()
            QBCore.Functions.TriggerCallback('re2-vault:server:addCapacity', function(result)
                p:resolve(result)
            end, data)
            return Citizen.Await(p)
        end
        
        local result = addCapacityPromise(data)
        p = nil
        if result then
            TriggerServerEvent('re2-vault:server:removeMoney',Config.StorageAddPrice)
            QBCore.Functions.Notify("Du La Till Mer Utrymme", "success")
        else
            QBCore.Functions.Notify("Något Gick Fel", "error")
        end
    else
        QBCore.Functions.Notify("Du Har Inte Råd", "error")
    end
end)

AddEventHandler('re2-vault:changePassword', function(data)
    local player=QBCore.Functions.GetPlayerData()
    local citizenid=player.citizenid
    -- local storagename=location.."_"..citizenid
    local mdialog = exports['iyc-input']:ShowIycInput({
        header = "Nytt Lössenord",
        submitText = "Klar",
        inputs = {
            {
                text = "Nytt Lössenord", -- text you want to be displayed as a place holder
                name = "password", -- name of the input should be unique otherwise it might override
                type = "password", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })

    if mdialog ~= nil then
        local p = nil
        local data ={
            password = mdialog.password,
            id = data.storageid
        }
        local addMemberPromise = function(data)
            if p then return end
            p = promise.new()
            QBCore.Functions.TriggerCallback('re2-vault:server:changePassword', function(result)
                p:resolve(result)
            end, data)
            return Citizen.Await(p)
        end
    
        local result = addMemberPromise(data)
        p = nil
        if result then
            QBCore.Functions.Notify("Lössenordet Har Ändrats", "success")
        else
            QBCore.Functions.Notify("Något Gick Fel", "error")
        end
    end
end)

AddEventHandler('re2-vault:getcitizenId', function(location)
    local player=QBCore.Functions.GetPlayerData()
    
    local mdialog = exports['iyc-input']:ShowIycInput({
        header = "Player Citizen ID",
        submitText = "Klar",
        inputs = {
            {
                text = "ID", -- text you want to be displayed as a place holder
                name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will not submit the form if no value is inputted
            }
        },
    })

    if mdialog ~= nil then
        local p = nil
        local data ={
            cid = mdialog.citizenid,
            storagelocation = Config.location[location].name,
        }
        local fetchStoragePromise = function(data)
            if p then return end
            p = promise.new()
            QBCore.Functions.TriggerCallback('re2-vault:server:fetchStorage', function(result)
                p:resolve(result)
            end, data)
            return Citizen.Await(p)
        end
        
        local result = fetchStoragePromise(data)
            p = nil
            if result then
                local storagesMenu = {
                    {
                        header = mdialog.citizenid.." Lager I "..Config.location[location].name,
                        isMenuHeader = true
                    }
                }
        
                for k, v in pairs(result) do
                    storagesMenu[#storagesMenu+1] = {
                        header = v.storagename,
                        txt = "Ägare : "..v.citizenid,
                        params = {
                            event = "re2-vault:changePassword",
                            args = {
                                storageid = v.id
                            }
                        }
        
                    }
                end
        
                storagesMenu[#storagesMenu+1] = {
                    header = "Stäng Meny",
                    txt = "",
                    params = {
                        event = "qb-menu:client:closeMenu"
                    }
        
                }
                exports['qb-menu']:openMenu(storagesMenu)
            else
                QBCore.Functions.Notify("Något Gick Fel", "error")
            end
        end
end)




