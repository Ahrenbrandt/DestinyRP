local Translations = {
    notify = {
        ["no_money"] = "Du har inte nog med pengar",
        ["refuel_cancel"] = "Refueling Canceled",
        ["jerrycan_full"] = "This jerry can is already full",
        ["vehicle_full"] = "This vehicle is already full",
    }
}
Lang = Locale:new({phrases = Translations, warnOnMissing = true})
