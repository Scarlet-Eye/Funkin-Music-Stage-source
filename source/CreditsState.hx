package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class CreditsState extends FlxState
{
	var fontPath = "assets/fonts/";
	var imagePath = "assets/images/";
	var musicPath = "assets/music/";
	var soundsPath = "assets/sounds/";

	var BG = new FlxSprite();
	var dark = new FlxSprite();

	override public function create()
	{
		super.create();

		BG = new FlxSprite(imagePath + "creditsMenu/menuDesat.png");
		BG.color = FlxColor.WHITE;
		add(BG);

		var yes = new FlxSprite(imagePath + "creditsMenu/1.png");
		yes.alpha = 0.6;
		add(yes);

		var touch = new FlxSprite("boop?");
		touch.screenCenter();
		add(touch);

		var touchContinued = new FlxText(45, 390, 0, "There should have been something here, but there won't be anything.");
		touchContinued.setFormat(fontPath + "vcr.ttf", 30, FlxColor.CYAN);
		add(touchContinued);

		var pointC = new FlxText(550, 5, 0, "CREDITS :");
		pointC.setFormat(fontPath + "vcr.ttf", 45, FlxColor.WHITE);
		add(pointC);

		var pointSE = new FlxText(525, 585, 0, "SCARLET EYE");
		pointSE.setFormat(fontPath + "vcr.ttf", 45, FlxColor.WHITE);
		add(pointSE);

		var pointSELnoYPAL = new FlxText(375, 640, 0, "IDEA | CREATOR GAME | PROGRAMMER");
		pointSELnoYPAL.setFormat(fontPath + "vcr.ttf", 30, FlxColor.WHITE);
		add(pointSELnoYPAL);

		var SE = new FlxSprite(imagePath + "creditsMenu/scarletEye.png");
		SE.x = 430;
		SE.y = 525;
		SE.antialiasing = true;
		SE.scale.set(0.37, 0.37);
		add(SE);

		dark = new FlxSprite(imagePath + "GB.png");
		dark.x = 0;
		dark.y = -20;
		add(dark);

		FlxTween.tween(dark, {x: 0, y: 1310}, 1.0, {ease: FlxEase.linear});

		FlxG.sound.playMusic(musicPath + "breakfast.ogg");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustPressed([FlxKey.ESCAPE]))
		{
			FlxG.sound.play(soundsPath + "cancelMenu.ogg");

			dark.y = -1310;

			FlxTween.tween(dark, {x: 0, y: -20}, 1.0, {ease: FlxEase.linear});

			new FlxTimer().start(2.0, changeState, 1);
		}
	}

	function changeState(timer:FlxTimer)
	{
		FlxG.switchState(new MainMenu());
	}
}
