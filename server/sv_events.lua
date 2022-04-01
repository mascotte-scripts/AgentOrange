AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        print('^8!!!!!!!!!!!!!!WARNING - MASCOTTE TOOLS IS RUNNING ON THIS SERVER!!!!!!!!!!!!!! \n!!!!!!!!!!!!!!WARNING - MASCOTTE TOOLS IS RUNNING ON THIS SERVER!!!!!!!!!!!!!!  \n It is strongly advised not to run Mascotte Tools on a live server as this will create serious security risks. \n USEAGE OF THIS SCRIPT IS ADVISED SOLELY IN DEVELOPMENT SERVERS \n!!!!!!!!!!!!!!WARNING - MASCOTTE TOOLS IS RUNNING ON THIS SERVER!!!!!!!!!!!!!!\n!!!!!!!!!!!!!!WARNING - MASCOTTE TOOLS IS RUNNING ON THIS SERVER!!!!!!!!!!!!!!')
    end
end)