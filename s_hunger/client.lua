local hunger = 100
local risk = 0.25 -- 25 Percent Risk of KO
local player = PlayerPedId()
local animDict = "anim@veh@lowrider@std@ds@arm@base" 
local animName = "die"


Citizen.CreateThread(function()
    while hunger > 0 do
        Citizen.Wait(2500)
        hunger = hunger - 5

        ------------ DEBUG ------------
        print("Hunger = " .. hunger)
        ------------ DEBUG ------------

        if hunger < 30 and hunger >= 15 then
            ------------ DEBUG ------------
            print("Eye effects")
            print("Hunger = " .. hunger)
            ------------ DEBUG ------------
            eyeEffect()

        elseif hunger < 15 and hunger > 5 then
            local riskedRand = math.random()

            ------------ DEBUG ------------
            print("KO Risks")
            print("Hunger = " .. hunger)
            print("riskedRand = " .. riskedRand)
            ------------ DEBUG ------------

            if riskedRand < risk then
                if IsPedInAnyVehicle(player, false) then
                    if IsPedOnAnyBike(player) then
                        eyeEffect()
                        SetPedToRagdoll(player, 1000, 1000, ragdollType, p4, p5, p6)
                    else
                        RequestAnimDict(animDict)
                        while not HasAnimDictLoaded(animDict) do
                            Citizen.Wait(100)
                        end
                        eyeEffect()
                        TaskPlayAnim(player, animDict, animName, 8.0, 8.0, -1, 0, 0, false, false, false)
                    end
                    
                elseif IsPedInAnyVehicle(player, true) then
                    eyeEffect()
                    SetPedToRagdoll(player, 1000, 1000, ragdollType, p4, p5, p6)
                else
                    eyeEffect()
                    SetPedToRagdoll(player, 1000, 1000, ragdollType, p4, p5, p6)
                end

            else
                eyeEffect()
            end

        elseif hunger == 5 then
            ------------ DEBUG ------------
            print("Dead")
            print("Hunger = " .. hunger)
            ------------ DEBUG ------------

            if IsPedInAnyVehicle(player, false) then
                -- Death Inside
                hunger = hunger - 5
            elseif IsPedInAnyVehicle(player, true) then
                SetPedToRagdoll(player, 1000, 1000, ragdollType, p4, p5, p6)
                hunger = hunger - 5
            else
                SetPedToRagdoll(player, 1000, 1000, ragdollType, p4, p5, p6)
                hunger = hunger - 5
            end
        end

    end
end)


function eyeEffect()
    AnimpostfxPlay("MP_corona_switch", 5000, false)

    -- IDK 
end

