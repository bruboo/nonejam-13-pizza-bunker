///@function scpt_trail([alpha], [color], [vel])
function scpt_trail(_image_alpha = 1, _image_blend = c_white, _vel = 0.08){
	var _trail = instance_create_depth(x, y, depth +1, obj_trail);
	with(_trail)
	{
		sprite_index		= other.sprite;
		image_index			= other.image_ind;
		image_xscale		= other.image_xscale;
		image_alpha			= _image_alpha;
		_color				= _image_blend;
		_vel_alpha			= _vel;
		image_speed			= 0;
	}
}
