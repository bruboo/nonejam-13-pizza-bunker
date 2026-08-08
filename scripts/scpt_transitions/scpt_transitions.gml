/// @function TransitionPlaceSequence(type, [x_target], [y_target])
function TransitionPlaceSequence(_type, _x_target = undefined, _y_target = undefined)
{
	if(layer_exists("transition"))
	{
		layer_destroy("transition");
	}

	var _lay = layer_create(-99999, "transition");

	var _x = _x_target != undefined
		? _x_target
		: camera_get_view_x(global.game_settings.view_cam) + global.game_settings.game_width * 0.5;

	var _y = _y_target != undefined
		? _y_target
		: camera_get_view_y(global.game_settings.view_cam) + global.game_settings.game_height * 0.5;

	var _seq = layer_sequence_create(_lay, _x, _y, _type);

	return _seq;
}


/// @function scpt_transition_start(room_target, [x], [y], [seq_terminando], [seq_começando])
function scpt_transition_start(_roomTarget = 0, _x = undefined, _y = undefined, _typeOut = seq_FadeOut, _typeIn = seq_FadeIn)
{
	if(!instance_exists(obj_transicao))
	{
		var _tran = instance_create_depth(0,0,9999,obj_transicao);

		with(_tran)
		{
			room_target = _roomTarget;
			x_target = _x;
			y_target = _y;
			seq_id = TransitionPlaceSequence(_typeOut);
			type_seq_in = _typeIn;
		}

		return true;
	}
	else
	{
		return false;
	}
}


/// @function TransitionChangeRoom()
function TransitionChangeRoom()
{
	if(instance_exists(obj_transicao))
	{
		obj_transicao.change_room();
	}
}


/// @function TransitionInStart()
function TransitionInStart()
{
	if(instance_exists(obj_transicao))
	{
		obj_transicao.rectangle = false;
	}
}


/// @function TransitionFinished()
function TransitionFinished()
{
	layer_sequence_destroy(self.elementID);

	if(layer_exists("transition"))
	{
		layer_destroy("transition");
	}

	instance_destroy(obj_transicao);
}