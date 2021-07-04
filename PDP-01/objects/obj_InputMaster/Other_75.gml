/// @description INPUT CONNECT

var _type = async_load[? "event_type"];
var _pad = async_load[? "pad_index"];

if (_type == "gamepad discovered")
{
	G.GAMEPADS[_pad] = _pad;
	if (ConnectedGamepads == 1)
	{
		G.P1GAMEPAD = _pad;
		ConnectedGamepads +=1;
	} else if (ConnectedGamepads > 1) // is there already a gamepad present?
	{
		G.P2GAMEPAD = _pad;	// the new gamepad is assigned to player 2
		ConnectedGamepads += 1;
	} else {
		ConnectedGamepads += 1;
	}
}

if (_type == "gamepad lost")
{
	G.GAMEPADS[_pad] = false;
	ConnectedGamepads -= 1;
}

if (G.DEBUG_MODE)
{
	show_debug_message(_type);
	show_debug_message(string(_pad));

	if (_type == "gamepad discovered")
	{
		show_debug_message("New controller discovered at slot " + string(_pad));
	}

	if (_type == "gamepad lost")
	{
		show_debug_message("Game controller disconnected at slot " + string(_pad));
	}
	show_debug_message("p1gamepad is " + string(G.P1GAMEPAD));
	show_debug_message("connected gamepads is " + string(ConnectedGamepads));
	show_debug_message("gamepads array is " + string(G.GAMEPADS));
}