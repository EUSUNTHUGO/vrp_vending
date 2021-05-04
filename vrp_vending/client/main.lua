--[[
========================================================
=============== PROJECT: vRP Vending ===================
=============== SCRIPTER: HUGO =========================
=============== DATE: 04/05/2021 =======================
============ DISCORD: https://discord.gg/hZ4XkUzTYs ====
========================================================
]]

Key = 166

function DrawSpecialText(m_text, showtime)
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

modelFood = {
	[1] = 3640564381,
	[2] = 3260933171
}

modelWater = {
	[1] = 2553529778,
	[2] = 992069095,
	[3] = 992069095,
	[4] = 1099892058,
	[5] = 690372739,
	[6] = 1114264700
}

Citizen.CreateThread(function ()
	local timee = 1000
	local intrat = false
	local foodCords
	while true do
		local myCoords = GetEntityCoords(GetPlayerPed(-1))
		for i = 1, #modelFood do
			if intrat == false then
				foodCords = GetClosestObjectOfType(myCoords.x, myCoords.y, myCoords.z, 5.0, modelFood[i], false, false)
				foodCords = GetOffsetFromEntityInWorldCoords(foodCords, 0.0, -0.97, 0.05)
			end
			if #(myCoords - foodCords) < 2 then
				timee = 8
				intrat = true
				DrawSpecialText("~w~Apasa ~g~[~w~F5~g~] ~w~ pentru a ti cumpara de mancare.")
				if(IsControlJustPressed(1, Key)) then
					TriggerServerEvent('hugo:buyItem')
				end
			else
				intrat = false
			end
		end
	Citizen.Wait(timee)
		timee = 1000
	end
end)

Citizen.CreateThread(function ()
	local timee = 1000
	local intrat = false
	local waterCoords
	while true do
		local myCoords = GetEntityCoords(GetPlayerPed(-1))
		for i = 1, #modelWater do
			if intrat == false then
				waterCoords = GetClosestObjectOfType(myCoords.x, myCoords.y, myCoords.z, 5.0, modelWater[i], false, false)
				waterCoords = GetOffsetFromEntityInWorldCoords(waterCoords, 0.0, -0.97, 0.05)
			end
			if #(myCoords - waterCoords) < 2 then
				timee = 8
				intrat = true
				DrawSpecialText("~w~Apasa ~g~[~w~F5~g~] ~w~ pentru a ti cumpara de baut.")
				if(IsControlJustPressed(1, Key)) then
					TriggerServerEvent('vrp_SodaMachine:buyItem')
				end
			else
				intrat = false
			end
		end
	Citizen.Wait(timee)
		timee = 1000
	end
end)

RegisterNetEvent('hugo:Random')
AddEventHandler('hugo:Random', function(prop_name)
	local lottery =  math.random(1,9)
	local ped = GetPlayerPed(-1)
	if lottery <= 6 then
		if not IsAnimated then
			local prop_name = prop_name or 'prop_cs_burger_01'
			IsAnimated = true
			local playerPed = GetPlayerPed(-1)
			Citizen.CreateThread(function()
				FreezeEntityPosition(ped, true)
				ClearPedTasksImmediately(ped)
				notify('Va rugam sa asteptati')
				Citizen.Wait(3000)
				TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
				Citizen.Wait(2000)
				local x,y,z = table.unpack(GetEntityCoords(playerPed))
				RequestAnimDict('amb@medic@standing@kneel@base')  
				while not HasAnimDictLoaded('amb@medic@standing@kneel@base') do
					Citizen.Wait(0)
				end
				TaskPlayAnim(playerPed, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
				Citizen.Wait(700)
				notify('Ai cumparat o punga de ~r~chipsuri')
				TriggerServerEvent('hugo:damancare')
				prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
				AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 300.00, 180.0, 20.0, true, true, false, true, 1, true)
				Citizen.Wait(1500)						
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				Citizen.Wait(1000)
				
				RequestAnimDict('mp_player_intdrink')  
				while not HasAnimDictLoaded('mp_player_intdrink') do
					Citizen.Wait(0)
				end
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
				FreezeEntityPosition(ped, false)
			end)
		end
	end
	if lottery == 7 then
			Citizen.CreateThread(function()
			notify('Acest automat are defectiuni tehnice')
			end)
		end
	if lottery == 8 then
			Citizen.CreateThread(function()
			notify('Automatul este gol')
			end)
		end
	if lottery == 9 then
			Citizen.CreateThread(function()
			FreezeEntityPosition(ped, true)
			ClearPedTasksImmediately(ped)
			notify('Va rugam, Asteptati')
			Citizen.Wait(3000)
			TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
			Citizen.Wait(5000)
			notify('Este o problema cu automatul, ne cerem scuze')
			FreezeEntityPosition(ped, false)
			end)
		end
end)


RegisterNetEvent('vrp_SodaMachine:Random')
AddEventHandler('vrp_SodaMachine:Random', function(prop_name)
	local lottery =  math.random(1,9)
	local ped = GetPlayerPed(-1)
	if lottery <= 6 then
		if not IsAnimated then
			local prop_name = prop_name or 'prop_ecola_can'
			IsAnimated = true
			local playerPed = GetPlayerPed(-1)
			Citizen.CreateThread(function()
				FreezeEntityPosition(ped, true)
				ClearPedTasksImmediately(ped)
				notify('Va rugam sa asteptati')
				Citizen.Wait(3000)
				TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
				Citizen.Wait(2000)
				local x,y,z = table.unpack(GetEntityCoords(playerPed))
				RequestAnimDict('amb@medic@standing@kneel@base')  
				while not HasAnimDictLoaded('amb@medic@standing@kneel@base') do
					Citizen.Wait(0)
				end
				TaskPlayAnim(playerPed, 'amb@medic@standing@kneel@base', 'base', 3.0, 3.0, 2000, 0, 1, true, true, true)
				Citizen.Wait(700)
				notify('Ai cumparat o bautura')
				TriggerServerEvent('hugo:daapa')
				prop = CreateObject(GetHashKey(prop_name), x, y, z+0.2,  true,  true, true)
				AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, 18905), 0.12, 0.028, 0.001, 300.00, 180.0, 20.0, true, true, false, true, 1, true)
				Citizen.Wait(1500)						
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				Citizen.Wait(1000)
				
				RequestAnimDict('mp_player_intdrink')  
				while not HasAnimDictLoaded('mp_player_intdrink') do
					Citizen.Wait(0)
				end
				TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 0, 1, true, true, true)
				Citizen.Wait(3000)
				IsAnimated = false
				ClearPedSecondaryTask(playerPed)
				DeleteObject(prop)
				FreezeEntityPosition(ped, false)
			end)
		end
	end
	if lottery == 7 then
			Citizen.CreateThread(function()
			notify('Acest automat are defectiuni tehnice')
			end)
		end
	if lottery == 8 then
			Citizen.CreateThread(function()
			notify('Automatul este gol')
			end)
		end
	if lottery == 9 then
			Citizen.CreateThread(function()
			FreezeEntityPosition(ped, true)
			ClearPedTasksImmediately(ped)
			notify('Va rugam, Asteptati')
			Citizen.Wait(3000)
			TriggerEvent('InteractSound_CL:PlayOnOne', 'SodaMachine', 1.0)
			Citizen.Wait(5000)
			notify('Este o problema cu automatul, ne cerem scuze')
			FreezeEntityPosition(ped, false)
			end)
		end
end)


function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end