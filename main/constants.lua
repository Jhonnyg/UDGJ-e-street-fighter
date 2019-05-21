local M = {}

M.game = {}
M.game.make_hud     = hash("make_hud")
M.game.start        = hash("start")
M.game.unload       = hash("unload")
M.game.reset        = hash("reset")
M.game.spawn_player = hash("spawn_player")
M.game.game_over    = hash("game_over")
M.game.input_enter  = hash("GAME_ENTER")
M.game.input_join   = hash("PLAYER_JUMP")
M.game.input_type   = { KEYBOARD = 0, GAMEPAD = 1 }

M.game.punch_value = 20
M.game.kick_value = 30
M.game.respawn_time = 5
M.game.win_condition = 3
M.game.pickup_health_value = 40

M.select = {}
M.select.fade_in_time = 1
M.select.fade_in_time_bruceclarence = 3

M.level = {}
M.level.pickups    = {MEDBOX=0}
M.level.pickup_lut = {"MEDBOX"}
M.level.get_dynamic_objects = hash("get_dynamic_objects")

M.hud = {}
M.hud.set_health = hash("set_health")
M.hud.increase_score = hash("increase_score")

M.id_to_name = { "bruce", "clarence", "paul" }

M.player = {}
M.player.TYPE_NULL  = 0
M.player.TYPE_HUMAN = 1
M.player.TYPE_CPU   = 2

M.player.walk_speed = 50
M.player.jump_speed = 0.5
M.player.jump_height = 40
M.player.punch_limit_distance = 30
M.player.punch_limit_height = 10
M.player.kick_limit_distance = 40
M.player.kick_limit_height = 10

M.player.died        = hash("died")
M.player.respawned   = hash("respawned")
M.player.resume      = hash("resume")
M.player.pause       = hash("pause")
M.player.walk_to     = hash("walk_to")
M.player.got_pickup  = hash("got_pickup")
M.player.did_kick    = hash("player_did_kick")
M.player.got_kick    = hash("player_got_kick")
M.player.did_punch   = hash("player_did_punch")
M.player.got_punch   = hash("player_got_punch")
M.player.input_left  = hash("PLAYER_LEFT")
M.player.input_right = hash("PLAYER_RIGHT")
M.player.input_up    = hash("PLAYER_UP")
M.player.input_down  = hash("PLAYER_DOWN")
M.player.input_jump  = hash("PLAYER_JUMP")
M.player.input_punch = hash("PLAYER_PUNCH")
M.player.input_kick  = hash("PLAYER_KICK")

M.player.input_left_kb1  = hash("KB1_PLAYER_LEFT")
M.player.input_right_kb1 = hash("KB1_PLAYER_RIGHT")
M.player.input_up_kb1    = hash("KB1_PLAYER_UP")
M.player.input_down_kb1  = hash("KB1_PLAYER_DOWN")
M.player.input_jump_kb1  = hash("KB1_PLAYER_JUMP")
M.player.input_punch_kb1 = hash("KB1_PLAYER_PUNCH")
M.player.input_kick_kb1  = hash("KB1_PLAYER_KICK")

M.player.input_left_kb2  = hash("KB2_PLAYER_LEFT")
M.player.input_right_kb2 = hash("KB2_PLAYER_RIGHT")
M.player.input_up_kb2    = hash("KB2_PLAYER_UP")
M.player.input_down_kb2  = hash("KB2_PLAYER_DOWN")
M.player.input_jump_kb2  = hash("KB2_PLAYER_JUMP")
M.player.input_punch_kb2 = hash("KB2_PLAYER_PUNCH")
M.player.input_kick_kb2  = hash("KB2_PLAYER_KICK")
M.player.hit_type    = { PUNCH = 0, KICK = 0 }

M.keyboard_action_lut = {}
M.keyboard_action_lut[M.player.input_left_kb1]  = { action_id = M.player.input_left, keyboard = 0 }
M.keyboard_action_lut[M.player.input_right_kb1] = { action_id = M.player.input_right, keyboard = 0 }
M.keyboard_action_lut[M.player.input_up_kb1]    = { action_id = M.player.input_up, keyboard = 0}
M.keyboard_action_lut[M.player.input_down_kb1]  = { action_id = M.player.input_down, keyboard = 0}
M.keyboard_action_lut[M.player.input_jump_kb1]  = { action_id = M.player.input_jump, keyboard = 0}
M.keyboard_action_lut[M.player.input_punch_kb1] = { action_id = M.player.input_punch, keyboard = 0}
M.keyboard_action_lut[M.player.input_kick_kb1]  = { action_id = M.player.input_kick, keyboard = 0}
M.keyboard_action_lut[M.player.input_left_kb2]  = { action_id = M.player.input_left, keyboard = 1}
M.keyboard_action_lut[M.player.input_right_kb2] = { action_id = M.player.input_right, keyboard = 1}
M.keyboard_action_lut[M.player.input_up_kb2]    = { action_id = M.player.input_up, keyboard = 1}
M.keyboard_action_lut[M.player.input_down_kb2]  = { action_id = M.player.input_down, keyboard = 1}
M.keyboard_action_lut[M.player.input_jump_kb2]  = { action_id = M.player.input_jump, keyboard = 1}
M.keyboard_action_lut[M.player.input_punch_kb2] = { action_id = M.player.input_punch, keyboard = 1}
M.keyboard_action_lut[M.player.input_kick_kb2]  = { action_id = M.player.input_kick, keyboard = 1}

M.input_table_from_action = function(action_id, action)
	local input_type = M.game.input_type.KEYBOARD
	local input_id   = 0
	local action_id_out = nil

	if action.gamepad ~= nil then
		input_type = M.game.input_type.GAMEPAD
		input_id   = action.gamepad + 2
		action_id_out = action_id
	else
		action_id_out = M.keyboard_action_lut[action_id].action_id
		input_id = M.keyboard_action_lut[action_id].keyboard
	end

	return { type = input_type, id = input_id, action_id = action_id_out }
end

return M