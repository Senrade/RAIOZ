if !game_won
{
    time_played += delta_time / 1000000;
}

if game_won
{
    if keyboard_check_pressed(vk_enter)
    {
        attempts = 0;
        time_played = 0;
        game_won = false;
		final_time = 0;
        
        room_goto(Menu);
    }
}

if room == Menu
{
    if keyboard_check_pressed(vk_enter)
    {
        room_goto(Room1);
    }
}

if (keyboard_check_pressed(vk_escape)) {
    game_end();
}