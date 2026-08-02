var async = json_parse(json_encode(async_load));

switch(async.event_type)
{
	case "gamepad discovered":
	{
		global.gamepadID = async.pad_index;
		//gamepad_set_axis_deadzone(global.gamepadID, .25);
	
	}
	break;
	
	case "gamepad lost": {
		global.gamepadID=-50;
	}
	break;
	
	default:
}