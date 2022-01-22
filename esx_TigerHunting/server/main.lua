ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('kp_lion:reward')
AddEventHandler('kp_lion:reward', function(Weight)
    local xPlayer = ESX.GetPlayerFromId(source)

    if Weight >= 1 and xPlayer.canCarryItem('meat_a', 1) then
        xPlayer.addInventoryItem('meat_a', 1)
    elseif Weight >= 9 and xPlayer.canCarryItem('meat_a', 2) then
        xPlayer.addInventoryItem('meat_a', 2)
    elseif Weight >= 15 and xPlayer.canCarryItem('meat_a', 3) then
        xPlayer.addInventoryItem('meat_a', 3)
    end

    local tilenhanda = math.random(0, 100)
    if tilenhanda >= 50 and xPlayer.canCarryItem('leather_a', 1) then
        xPlayer.addInventoryItem('leather_a', 1)
    end
end)

RegisterServerEvent('kp_lion:sell')
AddEventHandler('kp_lion:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    local meat_aPrice = 2500
    local leather_aPrice = 1000

    local meat_aQuantity = xPlayer.getInventoryItem('meat_a').count
    local leather_aQuantity = xPlayer.getInventoryItem('leather_a').count

    if meat_aQuantity > 0 or leather_aQuantity > 0 then
        xPlayer.addMoney(meat_aQuantity * meat_aPrice)
        xPlayer.addMoney(leather_aQuantity * leather_aPrice)

        xPlayer.removeInventoryItem('meat_a', meat_aQuantity)
        xPlayer.removeInventoryItem('leather_a', leather_aQuantity)
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Bạn đã bán ' .. leather_aQuantity + meat_aQuantity .. ' và nhận được $' .. leather_aPrice * leather_aQuantity + meat_aPrice * meat_aQuantity)
    else
        TriggerClientEvent('esx:showNotification', xPlayer.source, 'Bạn không có thịt Báo Trắng')
    end
        
end)

function sendNotification(xsource, message, messageType, messageTimeout)
    TriggerClientEvent('notification', xsource, message)
end