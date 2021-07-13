/// @description TEXT

draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_set_font(MyFont);
var _color = make_color_rgb(ColorSine,ColorSine,ColorSine);

draw_text_ext_transformed_color(x,y, 
				MyTitle, 20, 128, xSize, ySize, 0, 
				_color, _color, _color, _color, 1);

//reset to defaults
draw_set_halign(fa_left);
draw_set_valign(fa_top);

MyWidth = string_width(MyTitle) * xSize;

if (IsActive)
{
	if (MyPortrait != noone)
		draw_sprite(MyPortrait, PortraitFrame, 32, 64);	
}