/// @description UPDATE STATE

if (IsActive)
{
	percent_at +=0.015;
	percent_h += 0.01;
	
	ColorSine = 240 * animcurve_channel_evaluate(SineChannel, percent_h);
	ColorSine = clamp(ColorSine, 25, 200);
	
	percent_at = clamp(percent_at,0,1);
	xSize = scr_AnimateCurve(percent_at, 1, 3, BounceChannel, 1);
	ySize = scr_AnimateCurve(percent_at, 1, 3, BounceChannel, 1);
	
#region Container Text Code	
	//if(MyPortrait != noone)
	//	PortraitFrame = G.SECONDS % 3;
	
	//if (!instance_exists(MyContainer))
	//{
	//	var _rm = room_get_name(room);
	//	switch (_rm) {
			
	//		case "rm_MainMenu":
	//			MyContainer = instance_create_layer(x,y, "TextObjects", obj_MenuDescription);
	//			MyContainer.MyText = MyDescription;
	//		break;
			
	//		case "rm_CharacterSelect":
	//			MyContainer = instance_create_layer(x,y, "TextObjects", obj_MenuDescription);
	//			MyContainer.MyText = MyDescription;
	//			MyContainer.SetDimension(32, 320, 430, 95);
	//		break;
			
	//	}
	//}
#endregion

	if (percent_h > 1)
		percent_h = 0;
} else
{
	percent_at = 0;
	percent_h = 0;
	ColorSine = 25;
	xSize = 1;
	ySize = 1;
	if (instance_exists(MyContainer))
		instance_destroy(MyContainer);
}