fx_version 'cerulean'

game 'gta5'

description 'emfan-vehicleshop'
version '1.0.0'


ui_page "html/index.html"

client_scripts {
	'client/*.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
}

server_scripts {
	'server/sv_main.lua',
	'@oxmysql/lib/MySQL.lua',
}

shared_scripts {
	'config.lua',
	'@qb-core/shared/locale.lua',
	'locales/en.lua',
}

files {
	'html/reset.css',
	'html/sell-contract.png',
	'html/buy-contract.png',
	'html/style.css',
	'html/index.html',
	'html/script.js',
}

escrow_ignore {
	"config.lua",
	"locales/*.lua",
	"client/cl_utils.lua",
}

lua54 'yes'




dependency '/assetpacks'