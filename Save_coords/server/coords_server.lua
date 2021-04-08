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

function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end
