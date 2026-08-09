room_target = noone;
x_target = -1;
y_target = -1;

seq_id = noone;

type_seq_in = undefined;

rectangle = false;

change_room = function()
{
	rectangle = true;

	if (room_target == noone)
	{
		seq_id = TransitionPlaceSequence(type_seq_in, x_target, y_target);
	}
	else
	{
		room_goto(room_target);

		layer_set_target_room(room_target);
		seq_id = TransitionPlaceSequence(type_seq_in, x_target, y_target);
		layer_reset_target_room();
	}

	if (instance_exists(global.player))
	{
		if (x_target != -1) global.player.x = x_target;
		if (y_target != -1) global.player.y = y_target;
	}

	if (instance_exists(obj_camera))
	{
		if (x_target != -1) obj_camera.x = x_target;
		if (y_target != -1) obj_camera.y = y_target;
	}
};