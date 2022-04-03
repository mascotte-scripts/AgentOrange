RegisterNetEvent('FakeInjection:SimulateClientinjection', function(source,eventName,eventParams)
    TriggerEvent(eventName,source,eventParams[1],eventParams[2],eventParams[3],eventParams[4])
end)

RegisterNetEvent('FakeInjection:SimulateServerinjection', function(source,eventName,eventParams)
    TriggerServerEvent(eventName,eventParams[1],eventParams[2],eventParams[3],eventParams[4])
end)

local display = false

RegisterCommand("FakeInjector", function(source, args)
    SetDisplay(not display)
end)

--very important cb 
RegisterNUICallback("CreateClientThread", function(data)
    local time = tonumber(data.time)
    local param1 = tostring(data.param[1])
    ExecuteClientThread(time,param1)
end)

--very important cb 
RegisterNUICallback("ExecuteEvent", function(data)
    local eventType = data.eventType
    local eventName = data.eventName
    local eventParams = data.eventParams
    if eventType == 'client' then
            TriggerEvent('FakeInjection:SimulateClientinjection',source,eventName,eventParams)
        elseif eventType == 'server' then
            TriggerEvent('FakeInjection:SimulateServerinjection',source,eventName,eventParams)
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
        resourcename = GetCurrentResourceName()
    })
end

CreateThread(function()
  while true do
    Wait(0)
    if display then
      DisableControlAction(0, 1, display) -- LookLeftRight
      DisableControlAction(0, 2, display) -- LookUpDown
      DisableControlAction(0, 142, display) -- MeleeAttackAlternate
      DisableControlAction(0, 18, display) -- Enter
      DisableControlAction(0, 322, display) -- ESC
      DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    else
      Wait(500)
    end
    Wait(0)
  end
end)

function ExecuteClientThread(time,bool,param1)
    CreateThread(function()
        while true do 
            Wait(time)
            -- Do something in the loop using param1
            if bool == true then
                break;
            elseif bool == false then
                Wait(1)
            end
        end
    end)
end