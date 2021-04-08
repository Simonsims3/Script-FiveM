fx_version 'cerulean'


games      { 'gta5' }


author '@SimoN#6253'
description 'Simple script that take the coords and save it in a file'
version '1.0'



client_scripts {
    'client/coords_client.lua', 
    'other/utils.lua'
}


server_scripts {
    'server/coords_server.lua',
    'other/utils.lua'
}
