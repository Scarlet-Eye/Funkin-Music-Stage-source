package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class BFMain extends FlxSprite
{
	var bf = new FlxSprite();

	public function new()
	{
		super();

		bf = loadGraphic("assets/images/characters/BOYFRIEND.png", true);
		bf.x = 850;
		bf.y = 220;
		bf.antialiasing = true;

		animation.add("BF idle dance", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 24, true);

		var anim = FlxAtlasFrames.fromSparrow("assets/images/characters/BOYFRIEND.png", "assets/images/characters/BOYFRIEND.xml");
		frames = anim;

		animation.addByPrefix("idle", "BF idle dance", 24, true);
		animation.play("idle");
	}
}
