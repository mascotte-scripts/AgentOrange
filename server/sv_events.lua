-- This event runs when the script starts and displays a warning message that the resource has started in the console. You probably shouldn't remove this
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        print('^8!!!!!!!!!!!!!!WARNING - MASCOTTES FAKE INJECTOR IS RUNNING ON THIS SERVER!!!!!!!!!!!!!! \n!!!!!!!!!!!!!!WARNING - MASCOTTES FAKE INJECTOR IS RUNNING ON THIS SERVER!!!!!!!!!!!!!!  \n It is strongly advised not to run MASCOTTES FAKE INJECTOR on a live server as this will create serious security risks. \n USEAGE OF THIS SCRIPT IS ADVISED SOLELY IN DEVELOPMENT SERVERS \n!!!!!!!!!!!!!!WARNING - MASCOTTES FAKE INJECTOR IS RUNNING ON THIS SERVER!!!!!!!!!!!!!!\n!!!!!!!!!!!!!!WARNING - MASCOTTES FAKE INJECTOR IS RUNNING ON THIS SERVER!!!!!!!!!!!!!!')
    end
end)
