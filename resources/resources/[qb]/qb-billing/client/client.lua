local QBCore = exports['qb-core']:GetCoreObject()

local data = {}

RegisterNetEvent('billing:client:sendBillingMail')
AddEventHandler('billing:client:sendBillingMail',function(name,price,reason,citizenid)
    table.insert(data,price)
    table.insert(data,citizenid)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = name,
        subject = "Bill",
        message = "You have been sent a bill for, <br>Amount: <br> $"..price.." for "..reason.."<br><br> press the button below to accept the bill",
        button = {
            enabled = true,
            buttonEvent = "billing:client:AcceptBill",
            buttonData = data
        }
    })
    data = {}
end)

RegisterNetEvent('billing:client:AcceptBill')
AddEventHandler('billing:client:AcceptBill',function(data)
    QBCore.Functions.Notify("You paid the bill for $"..data[1])
    
    TriggerServerEvent('billing:server:PayBill',data)
end)