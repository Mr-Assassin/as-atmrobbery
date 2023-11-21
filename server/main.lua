local QBCore = exports[Config.Core]:GetCoreObject()

RegisterServerEvent("as_atmrobbery:server:getReward")
AddEventHandler("as_atmrobbery:server:getReward", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    local Chance = Config.RewardChance
    local Amount = 1

    local info = {
        worth = Config.Cash
    }

    if Config.Markedbills then
        if Chance == Amount then
            Player.Functions.AddItem(Config.RewardItem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RewardItem], 'add', 1)
            Player.Functions.AddItem(Config.MoneyItem, 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MoneyItem], "add")
            TriggerClientEvent("QBCore:Notify", src, "You got " .. Config.Cash .. ' $', "success")
        else
            Player.Functions.AddItem(Config.MoneyItem, 1, false, info)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MoneyItem], "add")
            TriggerClientEvent("QBCore:Notify", src, "You got " .. Config.Cash .. ' $', "success")
        end
    else
        if Chance == Amount then
            Player.Functions.AddItem(Config.RewardItem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RewardItem], 'add', 1)
            Player.Functions.AddMoney('cash', Config.Cash, 'ATM Cash')
            TriggerClientEvent("QBCore:Notify", src, "You got " .. Config.Cash .. ' $', "success")
        else
            Player.Functions.AddMoney('cash', Config.Cash, 'ATM Cash')
            TriggerClientEvent("QBCore:Notify", src, "You got " .. Config.Cash .. ' $', "success")
        end
    end
end)

RegisterServerEvent("as_atmrobbery:server:spawnRope")
AddEventHandler("as_atmrobbery:server:spawnRope", function()
    TriggerClientEvent("as_atmrobbery:client:spawnRope", -1)
end)

RegisterServerEvent("as_atmrobbery:server:attachVehicle")
AddEventHandler("as_atmrobbery:server:attachVehicle", function(NetworkVehicle, NetworkPlayerPed)
    TriggerClientEvent("as_atmrobbery:client:attachVehicle", -1, NetworkVehicle, NetworkPlayerPed)
end)

RegisterServerEvent("as_atmrobbery:server:attachATM")
AddEventHandler("as_atmrobbery:server:attachATM", function(ATMObjectProp, ObjectCoordsx, ObjectCoordsy, ObjectCoordsz, NetworkVehicle, NetObjectConsole)
    TriggerClientEvent("as_atmrobbery:client:attachATM", -1, ATMObjectProp, ObjectCoordsx, ObjectCoordsy, ObjectCoordsz, NetworkVehicle, NetObjectConsole)
end)

RegisterServerEvent("as_atmrobbery:server:spawnATM")
AddEventHandler("as_atmrobbery:server:spawnATM", function(NetObjectConsole)
    TriggerClientEvent("as_atmrobbery:client:spawnATM", -1, NetObjectConsole)
end)

RegisterServerEvent("as_atmrobbery:server:deleteATM")
AddEventHandler("as_atmrobbery:server:deleteATM", function(NetConsoleProp)
    TriggerClientEvent("as_atmrobbery:client:deleteATM", -1, NetConsoleProp)
end)

RegisterServerEvent("as_atmrobbery:server:deleteRopeProp")
AddEventHandler("as_atmrobbery:server:deleteRopeProp", function(Rope)
    TriggerClientEvent("as_atmrobbery:client:deleteRopeProp", -1, Rope)
end)

QBCore.Functions.CreateUseableItem(Config.RequiredItem, function(source, item)
    local src = source
    TriggerClientEvent("as_atmrobbery:client:ropeUsed", src)
end)

RegisterServerEvent("as_atmrobbery:server:RemoveItem")
AddEventHandler("as_atmrobbery:server:RemoveItem", function(Rope)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem(Config.RequiredItem, 1) then
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RequiredItem], "remove")
	end
end)

RegisterServerEvent("as_atmrobbery:server:addRopeItem")
AddEventHandler("as_atmrobbery:server:addRopeItem", function(Rope)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.AddItem(Config.RequiredItem, 1) then
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RequiredItem], "add")
	end
end)