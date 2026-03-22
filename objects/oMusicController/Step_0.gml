//Detect room change
if (room != current_room)
{
	current_room = room
	
	switch (room)
	{
		case Menu:
			target_music = music_menu;
		break
		
		case Room1:
			target_music = music_room1;
		break
		
		case Room2:
			target_music = music_room2;
		break
		
		case Room3:
			target_music = music_room3;
		break
	}
	fading = true;
}

//Fade function: fade out then switch song and fade in
if (fading) {
    volume -= fade_speed;

    if (music_id != -1) { audio_sound_gain(music_id, volume, 0) }

    if (volume <= 0) {
        volume = 0;

        if (music_id != -1) {
            audio_stop_sound(music_id);
        }

        music_id = audio_play_sound(target_music, 1, true);
        fading = false;
    }
}
else {
    if (volume < 1) {
        volume += fade_speed;

        if (music_id != -1) {
            audio_sound_gain(music_id, volume, 0);
        }
    }
}