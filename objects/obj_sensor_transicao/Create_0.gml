codigo = function()
{
	if (distance_to_object(global.player) <= 10 and global.parar == false)
	{
		scpt_transition_start(_room_target, _x, _y, _seq_out, _seq_in);
	}
}