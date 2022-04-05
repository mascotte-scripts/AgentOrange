-- These are the events we aim to trigger from NUI. We pass it paramaters of the event we want to attempt to execure
RegisterNetEvent('AGENTORANGE:SimulateClientinjection', function(eventName,eventTarget,eventParams)
    TriggerEvent(eventName,eventTarget,eventParams[1],eventParams[2],eventParams[3],eventParams[4])
end)

RegisterNetEvent('AGENTORANGE:SimulateServerinjection', function(eventName,eventTarget,eventParams)
    TriggerServerEvent(eventName,eventTarget,eventParams[1],eventParams[2],eventParams[3],eventParams[4])
end)

RegisterNetEvent('testevent', function (playerid, args)
    print(playerid)
    print(tonumber(source))
end)

-- NUI Stuff

local display = false

-- Command that opens the NUI

RegisterCommand("AgentOrange", function(source, args)
    print(source)
    SetDisplay(not display)
end)

-- Very important cb - It handles passing data from the NUI to the client for execution of threads
RegisterNUICallback("CreateClientThread", function(data)
    local time = tonumber(data.time)
    local param1 = tostring(data.param[1])
    ExecuteClientThread(time,param1)
end)

-- Very important cb - It handles passing data from the NUI to the client or server for execution of events
RegisterNUICallback("ExecuteEvent", function(data)
    local eventType = tonumber(data.eventType)
    local eventName = data.eventName
    local eventParams = {}
        eventParams[1] = data.arg1
        eventParams[2] = data.arg2
        eventParams[3] = data.arg3
        eventParams[4] = data.arg4
    local eventTarget = data.eventTarget
    if eventTarget == 'source' then -- The NUI passes a string or a number, so we need to convert it to a number if it's a string
        eventTarget = source
    elseif eventTarget == 'target' then
        eventTarget = target
    else
        eventTarget = tonumber(eventTarget)
    end
    print(eventTarget)
    if eventType == 1 then
            TriggerEvent('AGENTORANGE:SimulateClientinjection',eventName,eventTarget,eventParams)
        elseif eventType == 2 then
            TriggerEvent('AGENTORANGE:SimulateServerinjection',eventName,eventTarget,eventParams)
        else print('An error occured, you did not choose an event type')
    end
end)

-- Cb that closes all the NUI stuff when we close the menu. The event triggers a chat message to remind the user that the script is still running
-- It's advised not to run this script on a public server, but unfortunately some people still will run it on a public server...
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
    TriggerEvent('chat:addMessage', {
        color = { 255, 0, 0},
        multiline = true,
        args = {"The fake injector is still running. Make sure to stop the resource when finished using this resource"}
      })     
end)

-- Hides/Shows the NUI. For good practice, I like to pass it the resource so name so if someone changes the resource name it won't break the JS post function

function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        resourcename = GetCurrentResourceName()
    })
end

-- Disables things like movement while the NUI is open

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

-- Function that holds the template for a client thread for the NUI

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