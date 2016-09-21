if ( os_browser == browser_not_a_browser ) {

global.fontSmall = font_add(working_directory+"\Fonts\galvaniz.ttf", 28, false, false, 32, 128);
global.fontLarge = font_add(working_directory+"\Fonts\galvaniz.ttf", 36, false, false, 32, 128);
global.fontHuge = font_add(working_directory+"\Fonts\galvaniz.ttf", 64, false, false, 32, 128);

} else {

global.fontSmall = GameFont;
global.fontLarge = NarratorFont;
global.fontHuge = TitleFont;

}
