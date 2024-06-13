QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('kps-shoplift:server:getloot')
AddEventHandler('kps-shoplift:server:getloot', function(store)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then
        if Config.Debug then
            print("Player not found for source: " .. src)
        end
        return
    end

    local items = Config.Loot
    local randomIndex = math.random(1, #items)
    local shopliftloot = items[randomIndex] 

    if Config.Debug then
        print("Player " .. src .. " is shoplifting item: " .. shopliftloot)
    end
    Player.Functions.AddItem(shopliftloot, 1)

    local chance = math.random(1, 100)
    if Config.Debug then
        print("Chance rolled: " .. chance)
    end

    if chance <= 50 then
        if Config.Debug then
            print("Alerting cops for player " .. src)
        end
        TriggerClientEvent('kps-shoplift:client:alertcops', src, { name = store })

        local doorinf = Config.Location[store].doorname
        local uksedata = exports.ox_doorlock:getDoorFromName(doorinf)
        if uksedata then
            if Config.Debug then
                print("Door data for location '" .. store .. "':", uksedata)
            end
            if uksedata.id then
                if Config.Debug then
                    print("Locking door ID: " .. uksedata.id)
                end
                exports.ox_doorlock:setDoorState(uksedata.id, 1) -- Locks the door
                Wait(Config.DoorsClosed * 1000)
                if Config.Debug then
                    print("Unlocking door ID: " .. uksedata.id)
                end
                exports.ox_doorlock:setDoorState(uksedata.id, 0) -- Unlocks the door
            else
                if Config.Debug then
                    print("Door ID not found for location '" .. store .. "'")
                end
            end
        else
            if Config.Debug then
                print("No door data found for location '" .. store .. "' with door name: " .. doorinf)
            end
        end
    else
        if Config.Debug then
            print("No cops alerted for chance: " .. chance)
        end
    end
end)

QBCore.Functions.CreateCallback('kps-shoplift:getpolice', function(source, cb)
    local count = 0
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player and Player.PlayerData.job.name == "police" then
            count = count + 1
        end
    end
    cb(count)
end)
