fx_version 'cerulean'
game 'gta5'

author 'kopskink'
description 'kps-shoplift'
version '1.0.0'

dependencies {
    'ps-dispatch',
    'ox_doorlock',
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/main.lua',
}

server_scripts {
    'server/main.lua',
}

lua54 'yes'