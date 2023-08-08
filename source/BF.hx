package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class BF extends FlxSprite
{
	var bf = new FlxSprite();

	public function new()
	{
		super();

		bf = loadGraphic("assets/images/characters/BOYFRIEND.png", true);
		bf.x = 450;
		bf.y = 200;
		bf.scale.set(0.5, 0.5);
		bf.antialiasing = true;

		animation.add("BF idle dance", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13], 24, true);
		animation.add("BF NOTE LEFT0", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], 24, false);
		animation.add("BF NOTE DOWN0", [
			0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29
		], 24, false);
		animation.add("BF NOTE UP0", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], 24, false);
		animation.add("BF NOTE RIGHT0", [
			0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38,
			39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61
		], 24, false);
		animation.add("BF HEY!!", [
			0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25
		], 24, false);

		var anim = FlxAtlasFrames.fromSparrow("assets/images/characters/BOYFRIEND.png", "assets/images/characters/BOYFRIEND.xml");
		frames = anim;

		animation.addByPrefix("idle", "BF idle dance", 24, true);
		animation.addByPrefix("left", "BF NOTE LEFT0", 24, false);
		animation.addByPrefix("down", "BF NOTE DOWN0", 24, false);
		animation.addByPrefix("up", "BF NOTE UP0", 24, false);
		animation.addByPrefix("right", "BF NOTE RIGHT0", 24, false);
		animation.addByPrefix("hey", "BF HEY!!", 24, false);
		animation.play("idle");

		// new FlxButton(840, 0, "flipX BF", flipBOYFRIEND);
	}

	// private function flipBOYFRIEND()
	// {
	//	bf.flipX = true;
	// }

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustReleased([FlxKey.LEFT, D]))
		{
			new FlxTimer().start(0.5, stopAnimLeft, 1);

			animation.play("left");

			bf.x = 450;
			bf.y = 200;
		}

		if (FlxG.keys.anyJustReleased([FlxKey.DOWN, F]))
		{
			new FlxTimer().start(0.5, stopAnimDown, 1);

			animation.play("down");

			bf.x = 455;
			bf.y = 222;
		}

		if (FlxG.keys.anyJustReleased([FlxKey.UP, H]))
		{
			new FlxTimer().start(0.5, stopAnimUp, 1);

			animation.play("up");

			bf.x = 465;
			bf.y = 185;
		}

		if (FlxG.keys.anyJustReleased([FlxKey.RIGHT, J]))
		{
			new FlxTimer().start(0.5, stopAnimRight, 1);

			animation.play("right");

			bf.x = 460;
			bf.y = 200;
		}

		if (FlxG.keys.anyPressed([FlxKey.LEFT, D]))
		{
			animation.play("left");

			bf.x = 450;
			bf.y = 200;
		}

		if (FlxG.keys.anyPressed([FlxKey.DOWN, F]))
		{
			animation.play("down");

			bf.x = 455;
			bf.y = 222;
		}

		if (FlxG.keys.anyPressed([FlxKey.UP, H]))
		{
			animation.play("up");

			bf.x = 465;
			bf.y = 185;
		}

		if (FlxG.keys.anyPressed([FlxKey.RIGHT, J]))
		{
			animation.play("right");

			bf.x = 460;
			bf.y = 200;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.SPACE]))
		{
			FlxG.sound.play("assets/sounds/hey.ogg");

			animation.play("hey");

			bf.x = 450;
			bf.y = 197;

			new FlxTimer().start(1.0, stopAnim, 1);
		}
	}

	function stopAnim(timer:FlxTimer)
	{
		animation.play("idle");

		bf.x = 450;
		bf.y = 200;
	}

	function stopAnimLeft(timer:FlxTimer)
	{
		animation.play("idle");

		bf.x = 450;
		bf.y = 200;
	}

	function stopAnimDown(timer:FlxTimer)
	{
		animation.play("idle");

		bf.x = 450;
		bf.y = 200;
	}

	function stopAnimUp(timer:FlxTimer)
	{
		animation.play("idle");

		bf.x = 450;
		bf.y = 200;
	}

	function stopAnimRight(timer:FlxTimer)
	{
		animation.play("idle");

		bf.x = 450;
		bf.y = 200;
	}
}
