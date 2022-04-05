AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        print('^8!!!!!!!!!!!!!!WARNING - AGENT ORANGE IS RUNNING ON THIS SERVER!!!!!!!!!!!!!! \n!!!!!!!!!!!!!!WARNING - AGENT ORANGE IS RUNNING ON THIS SERVER!!!!!!!!!!!!!!  \n It is strongly advised not to run AGENT ORANGE on a live server as this will create serious security risks. \n USEAGE OF THIS SCRIPT IS ADVISED SOLELY IN DEVELOPMENT SERVERS \n!!!!!!!!!!!!!!WARNING - AGENT ORANGE IS RUNNING ON THIS SERVER!!!!!!!!!!!!!!\n!!!!!!!!!!!!!!WARNING - AGENT ORANGE IS RUNNING ON THIS SERVER!!!!!!!!!!!!!!')
    end
end)

RegisterNetEvent('svtest', function(eventTarget)
print(eventTarget)
print(source)
print(tonumber(tonumber(source)))
end)