RegisterNetEvent('FakeInjection:SimulateClientinjection', function(source,eventName,Param1,Param2,Param3,Param4)
    TriggerEvent(eventName,source,Param1,Param2,Param3,Param4)
end)

RegisterNetEvent('FakeInjection:SimulateServerinjection', function(source,eventName,Param1,Param2,Param3,Param4)
    TriggerServerEvent(eventName,Param1,Param2,Param3,Param4)
end)

RegisterNetEvent('quicktest', function(source)
print('Testing Client Event')
end)

local display = false

RegisterCommand("mascotte", function(source, args)
    SetDisplay(not display)
end)

RegisterCommand("thread", function(source, args)
   local time = tonumber(args[1])
   local param1 = tostring(args[2])
   ExecuteClientThread(time,param1)
end)

RegisterCommand("mascotte-test", function(source, args)
    local eventType = args[1]
    local eventName = args[2]
    if eventType == 'client' then
            TriggerEvent('FakeInjection:SimulateClientinjection',source,eventName)
        elseif eventType == 'server' then
            TriggerEvent('FakeInjection:SimulateServerinjection',source,eventName)
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