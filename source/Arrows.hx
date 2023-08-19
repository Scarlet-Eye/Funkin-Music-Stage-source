package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;

class Arrows extends FlxSprite
{
	var arrows = new FlxSprite();

	public function new()
	{
		super();

		arrows = loadGraphic("assets/images/NOTE_assets.png");
		arrows.scale.set(0.4, 0.4);
		arrows.x = 465;
		arrows.y = 215;

		animation.add("arrowLEFT", [0], 24, false);
		animation.add("left confirm", [0, 1, 2, 3], 24, false);
		animation.add("arrowDOWN", [0], 24, false);
		animation.add("down confirm", [0, 1, 2, 3], 24, false);
		animation.add("arrowUP", [0], 24, true);
		animation.add("up confirm", [0, 1, 2, 3], 24, false);
		animation.add("arrowRIGHT", [0], 24, false);
		animation.add("right confirm", [0, 1, 2, 3], 24, false);

		var anim = FlxAtlasFrames.fromSparrow("assets/images/NOTE_assets.png", "assets/images/NOTE_assets.xml");
		frames = anim;

		animation.addByPrefix("LEFT", "arrowLEFT", 24, false);
		animation.addByPrefix("clickLEFT", "left confirm", 24, false);
		animation.addByPrefix("DOWN", "arrowDOWN", 24, false);
		animation.addByPrefix("clickDOWN", "down confirm", 24, false);
		animation.addByPrefix("UP", "arrowUP", 24, true);
		animation.addByPrefix("clickUP", "up confirm", 24, false);
		animation.addByPrefix("RIGHT", "arrowRIGHT", 24, false);
		animation.addByPrefix("clickRIGHT", "right confirm", 24, false);
		animation.play("UP");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustReleased([FlxKey.LEFT, F]))
		{
			animation.play("LEFT");

			arrows.x = 465;
			arrows.y = 215;
		}

		if (FlxG.keys.anyJustReleased([FlxKey.DOWN, G]))
		{
			animation.play("DOWN");

			arrows.x = 465;
			arrows.y = 215;
		}

		if (FlxG.keys.anyJustReleased([FlxKey.UP, J]))
		{
			animation.play("UP");

			arrows.x = 465;
			arrows.y = 215;
		}

		if (FlxG.keys.anyJustReleased([FlxKey.RIGHT, K]))
		{
			animation.play("RIGHT");

			arrows.x = 465;
			arrows.y = 215;
		}

		if (FlxG.keys.anyPressed([FlxKey.LEFT, F]))
		{
			animation.play("clickLEFT");

			arrows.x = 450;
			arrows.y = 200;
		}

		if (FlxG.keys.anyPressed([FlxKey.DOWN, G]))
		{
			animation.play("clickDOWN");

			arrows.x = 450;
			arrows.y = 200;
		}

		if (FlxG.keys.anyPressed([FlxKey.UP, J]))
		{
			animation.play("clickUP");

			arrows.x = 450;
			arrows.y = 200;
		}

		if (FlxG.keys.anyPressed([FlxKey.RIGHT, K]))
		{
			animation.play("clickRIGHT");

			arrows.x = 450;
			arrows.y = 200;
		}
	}
}
