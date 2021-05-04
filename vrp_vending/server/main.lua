--[[
========================================================
=============== PROJECT: vRP Vending ===================
=============== SCRIPTER: HUGO =========================
=============== DATE: 04/05/2021 =======================
============ DISCORD: https://discord.gg/hZ4XkUzTYs ====
========================================================
]]
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_mancare")

RegisterServerEvent('hugo:buyItem')
AddEventHandler('hugo:buyItem', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	
	if vRP.tryPayment({user_id,5}) then
		TriggerClientEvent('hugo:Random', player)
	else
		vRPclient.notify(player,{"Nu ai bani pentru a cumpara mancare!"})
	end
end)

RegisterServerEvent('hugo:damancare')
AddEventHandler('hugo:damancare', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	vRP.varyHunger({user_id,-50})
	vRP.varyThirst({user_id,15})
end)

RegisterServerEvent('vrp_SodaMachine:buyItem')
AddEventHandler('vrp_SodaMachine:buyItem', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	
	if vRP.tryPayment({user_id,1}) then
		TriggerClientEvent('vrp_SodaMachine:Random', player)
	else
		vRPclient.notify(player,{"Nu ai bani!"})
	end
end)

RegisterServerEvent('hugo:daapa')
AddEventHandler('hugo:daapa', function()
	local user_id = vRP.getUserId({source})
	local player = vRP.getUserSource({user_id})
	vRP.varyThirst({user_id,-35})
end)