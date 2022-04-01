fx_version 'cerulean'
game { 'rdr3', 'gta5' }

author 'Mascotte45'
description 'A security tool that simulates the workings of a LUA injector. Useful for helping to identify vulnerable events'
version '1.0.0'

-- What to run
client_scripts {
    'client/*.lua'

}
server_scripts {
    'server/*.lua'
}