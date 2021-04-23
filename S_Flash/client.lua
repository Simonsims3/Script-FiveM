Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)

        local ped = GetPlayerPed(-1)
        local pedCoords = GetEntityCoords(ped)
        local vehicle = GetVehiclePedIsIn(ped, false)

        local speed = (GetEntitySpeed(vehicle)) * 3.6
        local score = math.floor(speed) * 9.6
        
        local radar = {
            vector3(-1105.0, -721.0, 20.0),
            vector3(-1271.0, -992.0, 9.0)
        }

        for i=1, #radar do
            if (Vdist2(pedCoords, radar[i]) < 100.0) and IsPedInAnyVehicle(ped, false) then

                -- Dist between player and radar, check if ped is in a vehicle
                if speed > 60.0 then
                    -- if ped speed is higher then 60 flash player
                    ShowNotification("~h~Flashed at ".."~r~"..math.floor(speed).."~w~ KM/H".."\n".."Score of ".."~b~"..math.floor(score))
                    Citizen.Wait(1000)
                end
            end
        end
    end
end)



function ShowNotification(msg)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandThefeedPostTicker(false, false)
end