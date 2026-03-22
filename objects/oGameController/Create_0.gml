window_set_fullscreen(true);
gpu_set_texfilter(false)

if instance_number(oGameController) > 1
{
    instance_destroy();
    exit;
}

persistent = true;

attempts = 0;
time_played = 0;
final_time = 0;
best_time = 999999;
game_won = false;

// Center window when opened (if not fullscreen)
var sw = display_get_width();
var sh = display_get_height();
var ww = window_get_width();
var wh = window_get_height();
window_set_position((sw - ww)/2, (sh - wh)/2);