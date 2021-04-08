local coordsList = {}


function CollectCoords()
    coordsList = {}
    AddTextEntry('CallText', '~h~Press ~b~ [E] ~w~ to register a coord')


    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1)
            
            if not isSavingCoords then
                return
            end

            BeginTextCommandDisplayHelp('CallText')
            EndTextCommandDisplayHelp(0, false, false, -1)

            if IsControlJustReleased(0, 38) then
                local ped = PlayerPedId()
                local pcoords = GetEntityCoords(ped)

                local x,y,z = table.unpack(pcoords)
                z = z - 1.0
                coordsTable = vector3(x, y, z)

                table.insert(coordsList, coordsTable)

                TriggerEvent('chat:addMessage', {
                    color = {65, 105, 225},
                    multiline = true,
                    args = {'Coords ', ('#%s - Coords Saved: X: %s, Y: %s, Z: %s'):format(
                        #coordsList,
                        round(x, 2),
                        round(y, 2),
                        round(z, 2)
                    )}
                })
            end
        end
    end)
    
end


RegisterCommand("savecoords", function()
    if not isSavingCoords then

        isSavingCoords = true

        CollectCoords()

        return 
    end

    isSavingCoords = false

    TriggerServerEvent('saveCoords', coordsList)
end)

RegisterNetEvent('EndOfSave')
AddEventHandler('EndOfSave', function()
    TriggerEvent('chat:addMessage', {
        color = {65, 105, 225},
        multiline = true,
        args = {'Coords ', 'Everything is saved'}
    })
end)