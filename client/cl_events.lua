RegisterNetEvent('mascotte-tools:SimulateClientinjection', function(source,eventName,Param1,Param2,Param3,Param4)
    TriggerEvent(eventName,source,Param1,Param2,Param3,Param4)
end)

RegisterNetEvent('mascotte-tools:SimulateServerinjection', function(source,eventName,Param1,Param2,Param3,Param4)
    TriggerServerEvent(eventName,Param1,Param2,Param3,Param4)
end)

RegisterNetEvent('quicktest', function(source)
print('Testing Client Event')
end)

local display = false

RegisterCommand("mascotte", function(source, args)
    SetDisplay(not display)
end)

RegisterCommand("mascotte-test", function(source, args)
    local eventType = args[1]
    local eventName = args[2]
    if eventType == 'client' then
            TriggerEvent('mascotte-tools:SimulateClientinjection',source,eventName)
        elseif eventType == 'server' then
            TriggerEvent('mascotte-tools:SimulateServerinjection',source,eventName)
        else print('An error occured, you did not choose an event type')
    end
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
