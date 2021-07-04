/// @description GLOBAL VARS

randomize();

G.FRAMECOUNTER = 0;
G.SECONDS = 0;

G.SOUND_CHANNELS = 12;
G.SFXVOLUME = 1;
G.BGMVOLUME = 0; // leave this off until you're ready to test music

G.DEBUG_MODE = true;
G.IS_ONLINE = false;
G.SEED = 0;
G.GAME_MODE = 0;

G.GAMEPADS[0] = 0;
G.P1GAMEPAD = 0;
G.P2GAMEPAD = 0;



function DebugMsg(_string) {
	if (!G.DEBUG_MODE)
		exit;
	show_debug_message(_string);
}