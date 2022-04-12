RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:clear')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    CancelEvent()
end)

-- command suggestions for clients
local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('chat:init', function()
    refreshCommands(source)
end)

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)

RegisterServerEvent("chat:discordmsg")
AddEventHandler("chat:discordmsg", function(title, msg)
    local embeds = {
        {
            ["type"]="rich",
            ["color"] = 56108,
            ["description"] = msg
        }
    }
	PerformHttpRequest('https://discordapp.com/api/webhooks/646042396165013505/YxsDFzj7qu0iXJhJUPGqtBW2bjs4ZvIIl2EAoLGPyqTIUsvbKWu-c9al_IqxAcX5SFij', function(err, text, headers) end, 'POST', json.encode({username = "SKEEXS LOGGING", embeds = embeds}), { ['Content-Type'] = 'application/json' })
end)