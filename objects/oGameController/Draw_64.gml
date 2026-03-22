var w = display_get_gui_width();
var h = display_get_gui_height();

var t = floor(time_played);
var m = t div 60;
var s = t mod 60;
var time_text = string(m) + ":" + (s < 10 ? "0" + string(s) : string(s));

var bt = floor(best_time);
var bm = bt div 60;
var bs = bt mod 60;

var best_text = string(bm) + ":" + (bs < 10 ? "0" + string(bs) : string(bs));

// MENU
if (room == Menu)
{
    draw_set_color(c_white);
    draw_set_halign(fa_center);

    draw_text(w/2, h-60, "[Press ENTER to play]");
    draw_text(w/2, h-40, "[Press ESC to leave the game]");

    draw_set_halign(fa_left);
}

// GAME WON
if (game_won)
{
    draw_set_color(c_black);
    draw_set_alpha(0.7);
    draw_rectangle(0, 0, w, h, false);

    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);

    draw_text(w/2, h/2 - 60, "WOAHHH, YOU WON!!");
    draw_text(w/2, h/2 - 20, "Attempts: " + string(attempts));
	draw_text(w/2, h/2 + 20, "Time played: " + time_text);
	draw_text(w/2, h/2 + 40, "Best time: " + best_text);
    draw_text(w/2, h/2 + 80, "[Press ENTER to return to the menu]");

    draw_set_halign(fa_left);
}