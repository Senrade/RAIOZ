//Gravity
ysp +=  0.1
xsp = 0

if oGameController.game_won
{
    exit;
}

if keyboard_check(ord("A"))
{
	xsp = -1
}

if keyboard_check(ord("D"))
{
	xsp = +1
}


if place_meeting(x,y+1,oSolidParent)
{
	ysp = 0
	jump_count = 0
}

if keyboard_check_pressed(ord("W"))
{
	if jump_count < jump_max
	{
		ysp = -2
		jump_count += 1
	}
}

move_and_collide(xsp,ysp,oSolidParent)

// Keep player inside room
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

//Spike and Flag logic
if place_meeting(x,y,oFlag)
{
	if room == Room3
	{
		with (oGameController)
		{
			game_won = true
			final_time = time_played
			
			if (final_time < best_time)
			{
				best_time = final_time
			}
		}
	}
	else { room_goto_next() }
}

if place_meeting(x,y,oSpike)
{
	audio_play_sound(snd_death, 0, false)
	if instance_exists(oGameController)
	{
		oGameController.attempts += 1;	
	}
	room_restart()	
}