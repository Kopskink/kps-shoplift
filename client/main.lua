QBCore = exports['qb-core']:GetCoreObject()
local RecentRobbery = 0

for table, value in pairs(Config.Location) do
    if Config.Debug then
        print('Chosen targeting system is set to ' .. Config.Target)
    end
    if Config.Debug then
        print("Adding target zone for:", table, value)
    end
    if Config.Target == 'ox' then
        exports.ox_target:addBoxZone({
            coords = value.coords,
            size = vector3(0.8, 1.5, 1),
            rotation = value.rotation,
            debug = Config.Debug,
            drawSprite = Config.Debug,
            options = {
                {
                    event = "kps-shoplift:client:steal",
                    icon = "fas fa-user-ninja",
                    distance = 1.0,
                    label = Lang:t("target.shoplift"),
                    name = table,
                },
            },
        })

    elseif Config.Target == 'qb' then
        exports['qb-target']:AddBoxZone(table, vector3(value.coords.x, value.coords.y, value.coords.z - 0.5), 1.5, 0.8, {
            name = table,
            heading = value.rotation,
            debugPoly = Config.Debug,
            minZ = value.coords.z - 0.5,
            maxZ = value.coords.z + 0.5,
        }, {
            options = {
                {
                    type = "client",
                    event = "kps-shoplift:client:steal",
                    icon = "fas fa-user-ninja",
                    label = Lang:t("target.shoplift"),
                },
            },
            distance = 1.0
        })
    end
end

RegisterNetEvent('kps-shoplift:client:steal')
AddEventHandler('kps-shoplift:client:steal', function(data)
    local store = data.name
    if Config.Debug then
        print("kps-shoplift:client:steal triggered for store:", store)
    end

    if RecentRobbery == 0 or GetGameTimer() > RecentRobbery then
        if Config.NeedPolice then
            QBCore.Functions.TriggerCallback('kps-shoplift:getpolice', function(policeCount)
                if policeCount >= Config.MinPolice then
                    if Config.Debug then
                        print("Progressbar started")
                    end
                    QBCore.Functions.Progressbar('shoplifting', Lang:t("info.takingstuff"), Config.GrabbingItems, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = 'anim@am_hold_up@male',
                        anim = 'shoplift_mid', --could also be: 'shoplift_low', 'shoplift_mid', 'shoplift_high'
                        flags = 49,
                    }, {}, {}, function()
                        if Config.Debug then
                            print("Progressbar completed")
                        end
                        RecentRobbery = GetGameTimer() + Config.RobCooldown * 60000
                        TriggerServerEvent('kps-shoplift:server:getloot', store)
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("info.citynopolice"), 'info')
                    if Config.Debug then
                        print('Not enough police')
                    end
                end
            end)
        else
            if Config.Debug then
            print('Police requirement disabled. Proceeding with robbery...') -- Proceed with the theft process without checking police count
                end
            if Config.Debug then
                print("Progressbar started")
            end
            QBCore.Functions.Progressbar('shoplifting', Lang:t("info.takingstuff"), Config.GrabbingItems, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = 'anim@am_hold_up@male',
                anim = 'shoplift_mid', --could also be: 'shoplift_low', 'shoplift_mid', 'shoplift_high'
                flags = 49,
            }, {}, {}, function()
                if Config.Debug then
                    print("Progressbar completed")
                end
                RecentRobbery = GetGameTimer() + Config.RobCooldown * 60000
                TriggerServerEvent('kps-shoplift:server:getloot', store)
            end)
        end
    else
        QBCore.Functions.Notify(Lang:t("info.afraid"), 'info')
    end
end)


RegisterNetEvent('kps-shoplift:client:alertcops')
AddEventHandler('kps-shoplift:client:alertcops', function(data)
    if not data or not data.name then
        print("Error: 'data' or 'data.name' is nil")
        return
    end

    local store = data.name
    -- local place = Config.Location[store].coords

    if Config.Debug then
        print("Alert cops event triggered for store: " .. store)
    end
    
    -- DIDN'T GET THIS WORKING LIKE NEEDED
    --TriggerServerEvent('InteractSound_SV:PlayAtCoord', place, 2, 'kpsstorealarm', 0.2)

    -- ps-dispatch custom alert starts here:
    local coords = GetEntityCoords(PlayerPedId())

    exports["ps-dispatch"]:CustomAlert({ 
        coords = coords, 
        job = { 'police' }, 
        message = Lang:t("dispatch.message"), 
        code = "10-90", 
        alertTime = nil, 
        gender = GetPlayerGender(),
        street = GetStreetAndZone(coords), 
        radius = 80.0, 
        sprite = 126, 
        color = 6, 
        scale = 0.9, 
        length = 1.5, 
        sound = 'robberysound'
    })
end)


-- these functions are just here for the CustomAlert to use "gender" and "street"
-- gender
function GetPlayerGender()
    local gender = 'NULL'
    if QBCore.Functions.GetPlayerData().charinfo.gender == 0 then
        gender = 'Male' -- Male
    elseif QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
        gender = 'Female' -- Female
    end
    return gender
end

-- street
function GetStreetAndZone(coords)
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    return street .. ", " .. zone
end
