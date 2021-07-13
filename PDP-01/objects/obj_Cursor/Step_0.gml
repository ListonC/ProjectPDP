/// @description UPDATE POSITION

/// @description MOVEMENT

var _y = 0;
var _x = 0;
var _target = MyTarget;
var _wide = 0;
var _sine = 0;
var _type = "normal";
var _selectedInstance = noone;
var _skipme = false;

// Get the currently selected Instance
with (obj_Button) {
    var optionIsSelected = (_target == MyOrder);
    IsActive = optionIsSelected;
    if(optionIsSelected) {
		_selectedInstance = id;
		if (_selectedInstance.visible == true)
		{
	        _y = y;
	        _x = x;
	        _wide = MyWidth;
	        _sine = ColorSine;
	        _type = Type;
		} else {
			_skipme = true;
		}
    }
}
if (_skipme)
{
	MyTarget += DirectionSign;
	exit;
}
// Logic you want to update at all time (when the selected instance exists)
if (instance_exists(_selectedInstance)) {
    TargetScript = _selectedInstance.MyScript;
    switch (_type){
        case "normal":
            y = _y - Margin * 2;
            x = _x - _wide - (_sine div 10) - Margin;
        break;
		// Advanced funcitonality we don't need right now.
        //case "slider":
        //    var _knob = noone;
        //    ImageState = 2;
        //    if(_selectedInstance.MyTitle == "SFX") {
        //        with (obj_SliderKnob) {
        //            if (MyType == "sfx") _knob = id;
        //        }
        //    } else if(_selectedInstance.MyTitle == "Music") {
        //        with (obj_SliderKnob){
        //            if (MyType == "bgm") _knob = id;
        //        }
        //    }
        //    if(instance_exists(_knob)) {
        //        x = _knob.x + 26;
        //        y = _knob.y - 22;
        //    }
        //break;
		
		//case "rocker":
		//	ImageState = 0;
		//	y = _y;
		//	x = _x;
		//break;
    }
}
// Logic you want to update only when you canMove
if (CanMove) {
    if (IO.P1padUp or keyboard_check(vk_up)) // Up
    {
		//up means a smaller number
		DirectionSign = -1;
        MyTarget += 1 * DirectionSign;		
        if (MyTarget <= 0)
            MyTarget = AllTargets;  
        CanMove = false;
        alarm_set(0, 10);
        ds_list_add(SFX.MySounds, "sfx_Select");
    }
    if (IO.P1padDwn or keyboard_check(vk_down)) // Down
    {
		// down means a bigger number
		DirectionSign = 1;
        MyTarget += 1 * DirectionSign;
        if (MyTarget > AllTargets)
            MyTarget = 1;
        CanMove = false;
        alarm_set(0, 10);
        ds_list_add(SFX.MySounds, "sfx_Select");
    }
	
#region (DISABLED)
    //switch (_type){
    //    case "normal":
    //        ImageState = 0;
    //    break;
    //    case "slider":
    //        switch(_selectedInstance.MyTitle) {
    //            case "SFX":
    //                if (IO.P1padLft or keyboard_check(vk_left)) {
    //                    if (G.SFXVOLUME > 0) {   
    //                        G.SFXVOLUME -= 0.10;
    //                        CanMove = false;
    //                        alarm_set(0, 10);
    //                        ds_list_add(SFX.MySounds, "sfx_Select");
    //                    }
    //                }
    //                if (IO.P1padRght or keyboard_check(vk_right)) {
    //                    if (G.SFXVOLUME < 1) {
    //                        G.SFXVOLUME += 0.10;
    //                        CanMove = false;
    //                        alarm_set(0, 10);
    //                        ds_list_add(SFX.MySounds, "sfx_Select");
    //                    }
    //                }
    //            break;
    //            case "Music":
    //                if (IO.P1padLft or keyboard_check(vk_left)){
    //                    if (G.BGMVOLUME > 0) {
    //                        G.BGMVOLUME -= 0.10;
    //                        CanMove = false;
    //                        alarm_set(0, 10);
    //                        ds_list_add(SFX.MySounds, "sfx_Select");
    //                        BGM.alarm[0] = 10;
    //                    }
    //                }
    //                if (IO.P1padRght or keyboard_check(vk_right)) {
    //                    if (G.BGMVOLUME < 1) {
    //                        G.BGMVOLUME += 0.10;
    //                        CanMove = false;
    //                        alarm_set(0, 10);
    //                        ds_list_add(SFX.MySounds, "sfx_Select");
    //                        BGM.alarm[0] = 10;
    //                    }
    //                }
    //            break;
    //        }
    //    break;
		
	//	case "rocker":
	//		if (IO.P1padLft or keyboard_check(vk_left)) // minus / left
	//		{
	//			if (_selectedInstance.CurrentSlot > 1) // more than 1?
	//			_selectedInstance.CurrentSlot -= 1; // subtract 1.
	//			else // at 1?
	//				_selectedInstance.CurrentSlot = _selectedInstance.MaxSlots; // wrap to max
				
	//			_selectedInstance.image_index = 1;
	//			_selectedInstance.alarm[0] = 5;
	//			CanMove= false;
	//			alarm_set(0, 10);
	//			ds_list_add(SFX.MySounds, "sfx_Select");
	//		}
	//		if (IO.P1padRght or keyboard_check(vk_right)) // plus / right
	//		{
	//			if (_selectedInstance.CurrentSlot < _selectedInstance.MaxSlots) // less than max?
	//				_selectedInstance.CurrentSlot += 1; // add 1.
	//			else // at max?
	//				_selectedInstance.CurrentSlot = 1; // wrap to min
				
	//			_selectedInstance.image_index = 2;
	//			_selectedInstance.alarm[0] = 5;
	//			CanMove= false;
	//			alarm_set(0, 10);
	//			ds_list_add(SFX.MySounds, "sfx_Select");	
	//		}
	//	break;
    //}
#endregion

    if (_type == "normal" and (IO.P1padFace1 or keyboard_check_pressed(vk_enter))) // Select
    {
        ds_list_add(SFX.MySounds, "sfx_Accept");
        alarm_set(1, 20);
        CanMove = false;
        ImageState = 3;
    }
}
