package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;
import flixel.ui.FlxButton;
import flixel.util.FlxTimer;

class BF2P extends FlxSprite
{
	var bf2 = new FlxSprite();

	public function new()
	{
		super();

		bf2 = loadGraphic("assets/images/characters/BOYFRIEND2P.png", true);
		bf2.x = 150;
		bf2.y = 200;
		bf2.scale.set(0.5, 0.5);
		bf2.flipX = true;
		bf2.antialiasing = true;

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

		var anim = FlxAtlasFrames.fromSparrow("assets/images/characters/BOYFRIEND2P.png", "assets/images/characters/BOYFRIEND2P.xml");
		frames = anim;

		animation.addByPrefix("idle", "BF idle dance", 24, true);
		animation.addByPrefix("left", "BF NOTE LEFT0", 24, false);
		animation.addByPrefix("down", "BF NOTE DOWN0", 24, false);
		animation.addByPrefix("up", "BF NOTE UP0", 24, false);
		animation.addByPrefix("right", "BF NOTE RIGHT0", 24, false);
		animation.addByPrefix("hey", "BF HEY!!", 24, false);
		animation.play("idle");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustReleased([FlxKey.A]))
		{
			new FlxTimer().start(0.5, stopAnimLeft, 1);

			animation.play("right");

			bf2.x = 150;
			bf2.y = 200;
		}

		if (FlxG.keys.anyJustReleased([FlxKey.S]))
		{
			new FlxTimer().start(0.5, stopAnimDown, 1);

			animation.play("down");

			bf2.x = 155;
			bf2.y = 222;
		}

		if (FlxG.keys.anyJustReleased([FlxKey.W]))
		{
			new FlxTimer().start(0.5, stopAnimUp, 1);

			animation.play("up");

			bf2.x = 165;
			bf2.y = 185;
		}

		if (FlxG.keys.anyJustReleased([FlxKey.D]))
		{
			new FlxTimer().start(0.5, stopAnimRight, 1);

			animation.play("left");

			bf2.x = 160;
			bf2.y = 200;
		}

		if (FlxG.keys.anyPressed([FlxKey.A]))
		{
			animation.play("right");

			bf2.x = 150;
			bf2.y = 200;
		}

		if (FlxG.keys.anyPressed([FlxKey.S]))
		{
			animation.play("down");

			bf2.x = 155;
			bf2.y = 222;
		}

		if (FlxG.keys.anyPressed([FlxKey.W]))
		{
			animation.play("up");

			bf2.x = 165;
			bf2.y = 185;
		}

		if (FlxG.keys.anyPressed([FlxKey.D]))
		{
			animation.play("left");

			bf2.x = 160;
			bf2.y = 200;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.SPACE]))
		{
			FlxG.sound.play("assets/sounds/hey.ogg");

			animation.play("hey");

			bf2.x = 150;
			bf2.y = 197;

			new FlxTimer().start(1.0, stopAnim, 1);
		}
	}

	function stopAnim(timer:FlxTimer)
	{
		animation.play("idle");

		bf2.x = 150;
		bf2.y = 200;
	}

	function stopAnimLeft(timer:FlxTimer)
	{
		animation.play("idle");

		bf2.x = 150;
		bf2.y = 200;
	}

	function stopAnimDown(timer:FlxTimer)
	{
		animation.play("idle");

		bf2.x = 150;
		bf2.y = 200;
	}

	function stopAnimUp(timer:FlxTimer)
	{
		animation.play("idle");

		bf2.x = 150;
		bf2.y = 200;
	}

	function stopAnimRight(timer:FlxTimer)
	{
		animation.play("idle");

		bf2.x = 150;
		bf2.y = 200;
	}
}
