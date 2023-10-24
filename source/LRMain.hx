package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.keyboard.FlxKey;

class LRMain extends FlxSprite
{
	var imageMainPath = "assets/images/mainMenu/";

	public function new(xPos:Int = 595, yPos:Int = 600)
	{
		super(xPos, yPos);

		var LR = new FlxSprite(imageMainPath + "CMUIA.png");
		LR.scale.set(0.5, 0.5);
		LR.antialiasing = true;

		animation.add("arrow left", [0], 0, false);
		animation.add("arrow right", [0], 0, true);
		animation.add("arrow push left", [0], 0, false);
		animation.add("arrow push right", [0], 0, false);

		var anim = FlxAtlasFrames.fromSparrow(imageMainPath + "CMUIA.png", imageMainPath + "CMUIA.xml");
		frames = anim;

		animation.addByPrefix("right", "arrow right", 0, true);
		animation.addByPrefix("rightP", "arrow push right", 0, false);
		animation.addByPrefix("left", "arrow left", 0, false);
		animation.addByPrefix("leftP", "arrow push left", 0, false);
		animation.play("right");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustReleased([FlxKey.LEFT, A]))
		{
			animation.play("left");
		}

		if (FlxG.keys.anyJustReleased([FlxKey.RIGHT, D]))
		{
			animation.play("right");
		}

		if (FlxG.keys.anyPressed([FlxKey.LEFT, A]))
		{
			animation.play("leftP");
		}

		if (FlxG.keys.anyPressed([FlxKey.RIGHT, D]))
		{
			animation.play("rightP");
		}
	}
}
