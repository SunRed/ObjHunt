AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

local resources = {}
resources["server"] = {}
resources["shared"] = {"player_class"}
resources["client"] = {"gui"}

function resourceLoader(dirs, includeFunc)
	for _, addDir in pairs(dirs) do
		print( "-- " .. addDir )
		local csFiles, _ = file.Find( "gamemodes/ObjHunt/gamemode/"..addDir.."/*", "MOD" )
		for _, csFile in ipairs(csFiles) do
		   	includeFunc( addDir.."/"..csFile )
			print( " + " .. csFile )
		end
	end
end

print( "Adding Server Side Lua Files..." )
resourceLoader( resources["server"], include )
resourceLoader( resources["shared"], include )

print( "Adding Client Side Lua Files..." )
resourceLoader( resources["shared"], AddCSLuaFile )
resourceLoader( resources["client"], AddCSLuaFile )

function GM:PlayerInitialSpawn( ply )
	player_manager.SetPlayerClass( ply, "player_hunter" )
end

hook.Add("PlayerSwitchFlashlight","test_hook" ,test)--this is a test works!
 local function test()
 	--print("here")
 end

include( "shared.lua" )