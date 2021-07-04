/// @description UPDATE TIME

G.SECONDS = current_time div 1000;

G.FRAMECOUNTER += 1;
if (G.FRAMECOUNTER >= room_speed)
	G.FRAMECOUNTER = 0;
