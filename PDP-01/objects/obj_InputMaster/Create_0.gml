/// @description Init Vars and Functions

io_clear();

ConnectedGamepads = 0;
KeyHeld = false;
GamepadHeld = false;
GLOBE = obj_Globals;

var _num = gamepad_get_device_count();
for (var i = 0; i < _num; i++;)
{
   if (gamepad_is_connected(i)) 
   {
	   G.GAMEPADS[i] = true;
	   ConnectedGamepads += 1;
   }	else {
	   G.GAMEPADS[i] = false;
   }
}


#region Button Variables
P1KeyUp = 0;
P1KeyDwn = 0;
P1KeyLft = 0;
P1KeyRght = 0;

P1KeyFace1 = 0;
P1KeyFace2 = 0;
P1KeyFace3 = 0;
P1KeyFace4 = 0;

P1KeyStart = 0;
P1KeySelect = 0;
P1KeyRbump = 0;
P1KeyLbump = 0;

P1padUp = 0;
P1padDwn = 0;
P1padLft = 0;
P1padRght = 0;

P1padFace1 = 0;
P1padFace2 = 0;
P1padFace3 = 0;
P1padFace4 = 0;

P1padStart = 0;
P1padSelect = 0;
P1padRbump = 0;
P1padLbump = 0

P2KeyUp = 0;
P2KeyDwn = 0;
P2KeyLft = 0;
P2KeyRght = 0;

P2KeyFace1 = 0;
P2KeyFace2 = 0;
P2KeyFace3 = 0;
P2KeyFace4 = 0;

P2KeyStart = 0;
P2KeySelect = 0;
P2KeyRbump = 0;
P2KeyLbump = 0;

P2padUp = 0;
P2padDwn = 0;
P2padLft = 0;
P2padRght = 0;

P2padFace1 = 0;
P2padFace2 = 0;
P2padFace3 = 0;
P2padFace4 = 0;

P2padStart = 0;
P2padSelect = 0;
P2padRbump = 0;
P2padLbump = 0
#endregion

function KeyPress() {

P1KeyUp = keyboard_check_pressed(ord("W"));
P1KeyDwn = keyboard_check_pressed(ord("S"));
P1KeyLft = keyboard_check_pressed(ord("A"));
P1KeyRght = keyboard_check_pressed(ord("D"));

P1KeyFace1 = keyboard_check_pressed(ord("G"));
P1KeyFace2 = keyboard_check_pressed(ord("H"));
P1KeyFace3 = keyboard_check_pressed(ord("T"));
P1KeyFace4 = keyboard_check_pressed(ord("Y"));

P1KeyStart = keyboard_check_direct(vk_lshift);
P1KeySelect = keyboard_check_pressed(vk_tab);
P1KeyLbump = keyboard_check_direct(vk_lcontrol);
P1KeyRbump = keyboard_check_direct(vk_lalt);

P2KeyUp = keyboard_check_pressed(vk_up);
P2KeyDwn = keyboard_check_pressed(vk_down);
P2KeyLft = keyboard_check_pressed(vk_left);
P2KeyRght = keyboard_check_pressed(vk_right);

P2KeyFace1 = keyboard_check_pressed(ord("K"));
P2KeyFace2 = keyboard_check_pressed(ord("L"));
P2KeyFace3 = keyboard_check_pressed(ord("I"));
P2KeyFace4 = keyboard_check_pressed(ord("O"));

P2KeyStart = keyboard_check_direct(vk_rshift);
P2KeySelect = keyboard_check_pressed(vk_enter);
P2KeyLbump = keyboard_check_direct(vk_ralt);
P2KeyRbump = keyboard_check_direct(vk_rcontrol);
}

function PadPress() {
	P1padUp = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_padu);
	if (P1padUp) { GLOBE.DebugMsg("p1 Up") }
	
	P1padDwn = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_padd);
	if (P1padDwn) { GLOBE.DebugMsg("p1 Down") }
	
	P1padLft = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_padl);
	if (P1padLft) { GLOBE.DebugMsg("p1 Left") }
	
	P1padRght = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_padr);
	if (P1padRght) { GLOBE.DebugMsg("p1 Right") }
	
	P1padFace1 = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD],gp_face1);
		if (P1padFace1) { GLOBE.DebugMsg("p1 Face1") }
	P1padFace2 = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_face2);
		if (P1padFace2) { GLOBE.DebugMsg("p1 Face2") }
	P1padFace3 = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_face3);
		if (P1padFace3) { GLOBE.DebugMsg("p1 Face3") }
	P1padFace4 = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_face4);
		if (P1padFace4) { GLOBE.DebugMsg("p1 Face4") }
	
	P1padStart = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD],gp_start);
	P1padSelect = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_select);
	P1padRbump = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_shoulderrb);
	P1padLbump = gamepad_button_check(G.GAMEPADS[G.P1GAMEPAD], gp_shoulderlb);
	
	GamepadHeld = P1padFace1 + P1padFace2 + P1padFace3 + 
				  P1padFace4 + P1padSelect + P1padStart + 
				  P1padLbump + P1padRbump;
	GamepadHeld = clamp(GamepadHeld, 0, 1);
	
	if (G.GAMEPADS[G.P2GAMEPAD] == true)
	{
		P2padUp = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_padu);
			if (P2padUp) { GLOBE.DebugMsg("p2 Up") }
		P2padDwn = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_padd);
			if (P2padDwn) { GLOBE.DebugMsg("p2 Down") }
		P2padLft = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_padl);
			if (P2padLft) { GLOBE.DebugMsg("p2 Left") }
		P2padRght = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_padr);
			if (P2padRght) { GLOBE.DebugMsg("p2 Right") }
	
		P2padFace1 = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD],gp_face1);
		P2padFace2 = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_face2);
		P2padFace3 = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_face3);
		P2padFace4 = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_face4);
	
		P2padStart = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD],gp_start);
		P2padSelect = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_select);
		P2padRbump = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_shoulderrb);
		P2padLbump = gamepad_button_check(G.GAMEPADS[G.P2GAMEPAD], gp_shoulderlb);
	}
}