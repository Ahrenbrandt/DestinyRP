-- My First Edit Of The sv.Lua (If you translate to other languages | Please forward them to me)

local Translations = {
    error = {
        -- Info
        ["wrong_equipment"] = "Du har inte rätt material!",
        ["required_police"] = "Det är inte tillräckligt med poliser i tjänst...",

        -- Security Cool Down
        ["cooldown"] = "Juveleraren har precis blivit rånad, du får vänta lite!",
        ["cooldown_disable"] = "Du har inte låst upp ytterdörren än!",

        -- Vangelico Fail
        ["security_fail"] = "Du misslyckades med att låsa upp ytterdörren",
        ["camera_fail"] = "Du misslyckades med att inaktivera kamerorna!",

        -- Smashing Cases
        ["weak_weapon"] = "Dehär vapnet är inte tillräckligt starkt",
        ["disable_security"] = "Du behöver stänga av kamerorna!",

        -- Leaving Fingerprints Behind!
        ["fingerprints_left"] = "Du har lämnat fingeravtryck på glasset...",

        -- Prevent Player For Filling Pockets Full
        ["pockets_full"] = "Du kan inte bära mer...",

        -- This will display if user changes the Dispatch System
        ["dispatch_system"] = "This Dispatch System Isn't Added Yet!",

        -- Smash The Case System
        ["smashed_already"] = "This Case Has Already Been Smashed!",
        ["distance_check"] = "You Are Not Close Enough To The Case!",

        -- Police Reboot Security System
        ["fingerprints"] = "You've Left Fingerprints On The Glass!",

        -- Door Check
        ["door_system"] = "This Door System Is Not Added!",

        -- Police Reboot Security System
        ["reboot_timer"] = "The System Will Reboot In 30 Seconds!",
    },
    success = {
        -- Vagelico Success
        ["security_success"] = "You Successfully Unlocked The Front Door!",
        ["camera_success"] = "You Successfully Disable The Cameras!",

        -- Confirming The System Reboot
        ["door_locked"] = "The System Has Rebooted, And The Door Has Been Locked!",
    },
}

Lang = Locale:new({
phrases = Translations,
warnOnMissing = true})