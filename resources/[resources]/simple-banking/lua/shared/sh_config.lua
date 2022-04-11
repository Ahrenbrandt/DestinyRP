SimpleBanking = SimpleBanking or {} 
SimpleBanking.Config = SimpleBanking.Config or {}


SimpleBanking.Config["Days_Transaction_History"] = 5 -- How many days should the transaction history go back in the bank?

SimpleBanking.Config["business_ranks"] = {  -- Here you add default grades for boss to get access to the account NOTE that grades need to be lower case.
    ["owner"] = true,
    ["coowner"] = true,
    ["chief"] = true,
    ["boss"] = true,
}

SimpleBanking.Config["business_ranks_overrides"] = {
    ["lostmc"] = { -- this is example for adding more then one grade to access the account for gangs
        ["boss"] = true,
        ["shot caller"] = true,
    }
}

SimpleBanking.Config["business_ranks_overrides"] = {
    ["police"] = { -- example for adding more then one grade to access the account for job
        ["chief"] = true,
        ["lieutenant"] = true,
        ["sergeant"] = true,
    }
}


SimpleBanking.Config["gang_ranks"] = {
    ['boss'] = true,

}

SimpleBanking.Config["gang_ranks_overrides"] = {

}
