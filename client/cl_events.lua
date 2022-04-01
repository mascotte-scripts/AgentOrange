RegisterNetEvent('mascotte-tools:SimulateClientinjection', function(source,eventName,Param1,Param2,Param3,Param4)
    TriggerEvent('%s','%s','%s','%s','%s'):format(eventName,Param1,Param2,Param3,Param4)
end)

RegisterNetEvent('mascotte-tools:SimulateServerinjection', function(source,eventName,Param1,Param2,Param3,Param4)
    TriggerServerEvent('%s','%s','%s','%s','%s'):format(eventName,Param1,Param2,Param3,Param4)
end)

local display = false

RegisterCommand("mascotte", function(source, args)
    SetDisplay(not display)
end)

--very important cb 
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

Citizen.CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)
