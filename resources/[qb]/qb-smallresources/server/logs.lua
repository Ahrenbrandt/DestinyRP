local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    -- ['default'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['testwebhook'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['playermoney'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['playerinventory'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['robbing'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['cuffing'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['drop'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['trunk'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['stash'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['glovebox'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['banking'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['vehicleshop'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['vehicleupgrades'] = '',
    -- ['shops'] = '',
    -- ['dealers'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['storerobbery'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['bankrobbery'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['powerplants'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['death'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['joinleave'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['ooc'] = '',
    -- ['report'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['me'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['pmelding'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['112'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['bans'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['anticheat'] = '',
    -- ['weather'] = '',
    -- ['moneysafes'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['bennys'] = '',
    -- ['bossmenu'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['robbery'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['casino'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['traphouse'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['911'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['palert'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
    -- ['house'] = 'https://discord.com/api/webhooks/947532981881409537/7VBJ-THjPXBh18JhI3nFrneVzjtmGodoVvBNFfXIqXXTZynCjqM0A_7dV3gPByWImeWU',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)        
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'Destiny Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'QB Logs', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'QB Logs', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function(source, args)
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
