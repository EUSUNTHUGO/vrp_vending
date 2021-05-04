--[[
========================================================
=============== PROJECT: vRP Vending ===================
=============== SCRIPTER: HUGO =========================
=============== DATE: 04/05/2021 =======================
============ DISCORD: https://discord.gg/hZ4XkUzTYs ====
========================================================
]]
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

dependency "vrp"

client_scripts {
	"Proxy.lua",
	'client/main.lua'
}

server_scripts {
	"@vrp/lib/utils.lua",
	'server/main.lua'
}