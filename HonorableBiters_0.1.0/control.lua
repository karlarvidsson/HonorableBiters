

script.on_event({defines.events.on_player_left_game},
   function (e)
	local forceName = game.players[e.player_index].force.name
	local playersOnForce = game.forces[forceName].get_entity_count("player")
	if playersOnForce == 0 then
		game.forces["enemy"].set_cease_fire(forceName, true)
	end
   end
)

script.on_event({defines.events.on_player_joined_game},
   function (e)
	local forceName = game.players[e.player_index].force.name
	local playersOnForce = game.forces[forceName].get_entity_count("player")
	if playersOnForce > 0 then
		game.forces["enemy"].set_cease_fire(forceName, false)
	end
   end
)

