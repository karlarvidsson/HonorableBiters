

script.on_event({defines.events.on_player_left_game},
   function (e)
	local forceName = game.players[e.player_index].force.name
	local playersOnForce = game.forces[forceName].get_entity_count("player")
	if playersOnForce == 0 then
		game.forces["enemy"].set_cease_fire(forceName, true)
		game.forces["enemy"].set_friend(forceName, true)
	end
	game.write_file("HonorableBiters.log", e.tick .. " on_player_left_game: " .. e.player_index .. " on force " .. forceName .. " get_cease_fire: " .. string.format("%s", game.forces["enemy"].get_cease_fire(forceName)) .. " get_friend: " .. string.format("%s", game.forces["enemy"].get_friend(forceName)) .. "\n", true, 0)
   end
)

script.on_event({defines.events.on_player_joined_game},
   function (e)
	local forceName = game.players[e.player_index].force.name
	local playersOnForce = game.forces[forceName].get_entity_count("player")
	if playersOnForce > 0 then
		game.forces["enemy"].set_cease_fire(forceName, false)
		game.forces["enemy"].set_friend(forceName, false)
	end
	game.write_file("HonorableBiters.log", e.tick .. " on_player_joined_game: " .. e.player_index .. " on force " .. forceName .. " get_cease_fire: " .. string.format("%s", game.forces["enemy"].get_cease_fire(forceName)) .. " get_friend: " .. string.format("%s", game.forces["enemy"].get_friend(forceName)) .. "\n", true, 0)
   end
)

