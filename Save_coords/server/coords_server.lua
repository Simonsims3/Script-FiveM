RegisterNetEvent('saveCoords')
AddEventHandler('saveCoords', function(coords)
    local _source = source
    String = ''
    for i, j in pairs(coords) do
        String = String .. (j .. "\n")
        String = String:gsub('vector3', "")
    end

    time = os.date('*t')
    title = time.hour..'-'..time.min..'-'..time.sec

    SaveResourceFile(GetCurrentResourceName(), 'Coords/' .. title .. '.txt', String)

    TriggerClientEvent('EndOfSave', _source)
end)