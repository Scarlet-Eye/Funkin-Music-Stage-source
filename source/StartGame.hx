package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;

class StartGame extends FlxSprite
{
	var imagePath = "assets/images/";

	public function new(xPos:Int = 120, yPos:Int = 400)
	{
		super(xPos, yPos);

		var titleEnter = loadGraphic(imagePath + "startScreen/titleEnter.png");
		animation.add("Press Enter to Begin", [
			0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
			39, 40, 41, 42, 43, 44
		], 24, true);
		animation.add("ENTER PRESSED", [0, 1, 2, 3, 4, 5, 6, 7, 8], 24, true);

		var anim = FlxAtlasFrames.fromSparrow(imagePath + "startScreen/titleEnter.png", imagePath + "startScreen/titleEnter.xml");
		frames = anim;

		animation.addByPrefix("Waiting", "Press Enter to Begin", 24, true);
		animation.addByPrefix("Starting Game", "ENTER PRESSED", 24, true);
		animation.play("Waiting");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustReleased([FlxKey.ENTER]))
		{
			animation.play("Starting Game");
		}
	}
}
