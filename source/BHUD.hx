package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class BHUD extends FlxSprite
{
	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		var blackHUD = makeGraphic(1280, 20, FlxColor.BLACK, true);
		blackHUD.x = 0;
		blackHUD.y = 0;
	}
}
