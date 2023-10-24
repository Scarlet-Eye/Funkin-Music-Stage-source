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

class StartScreen extends FlxState
{
	var fontPath = "assets/fonts/";
	var imagePath = "assets/images/";
	var musicPath = "assets/music/";
	var soundsPath = "assets/sounds/";

	var pbHaxeFlixel = new FlxSprite();
	var dark = new FlxSprite();

	var author = "@S.E_OFFICIAL";
	var authorOrig = "The Funkin' Crew";

	override public function create()
	{
		super.create();

		var logoGame = new FlxSprite(imagePath + "mainMenu/logoGame.png");
		logoGame.x = 430;
		logoGame.y = -20;
		logoGame.scale.set(0.7, 0.7);
		logoGame.antialiasing = true;
		add(logoGame);

		final StartGame = new StartGame();
		add(StartGame);

		var creator = new FlxText(515, 678, 0, "Game by " + author);
		creator.setFormat(fontPath + "vcr.ttf", 20, FlxColor.WHITE);
		add(creator);

		var creatorOrig = new FlxText(450, 700, 0, "Original Game by " + authorOrig);
		creatorOrig.setFormat(fontPath + "vcr.ttf", 20, FlxColor.WHITE);
		add(creatorOrig);

		pbHaxeFlixel = new FlxSprite(imagePath + "startScreen/PBH.png");
		pbHaxeFlixel.x = -37;
		pbHaxeFlixel.y = 590;
		pbHaxeFlixel.scale.set(0.75, 0.75);
		pbHaxeFlixel.antialiasing = true;
		add(pbHaxeFlixel);

		dark = new FlxSprite(imagePath + "GB.png");
		dark.x = 0;
		dark.y = -1310;
		add(dark);

		FlxG.autoPause = false;
		FlxG.mouse.visible = false;

		FlxG.sound.playMusic(musicPath + "freakyMenu.ogg", 0.01, true);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.anyJustPressed([FlxKey.ESCAPE]))
		{
			Sys.exit(0);
		}

		if (FlxG.keys.anyJustPressed([FlxKey.ENTER]))
		{
			FlxG.camera.flash(FlxColor.WHITE, 1.0);

			FlxG.sound.play(soundsPath + "confirmMenu.ogg");

			new FlxTimer().start(2.0, changeState, 1);

			FlxTween.tween(dark, {x: 0, y: -20}, 1.0, {ease: FlxEase.linear});
		}
	}

	function changeState(timer:FlxTimer)
	{
		FlxG.switchState(new MainMenu());
	}
}
