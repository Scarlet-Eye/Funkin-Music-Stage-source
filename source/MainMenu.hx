package;

import Sys;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;
import lime.system.System;

class MainMenu extends FlxState
{
	var fontPath = "assets/fonts/";
	var imagePath = "assets/images/";
	var musicPath = "assets/music/";
	var soundsPath = "assets/sounds/";

	var BG = new FlxSprite();
	var bgBeat = new FlxSprite();
	var BGFB = new FlxSprite();
	var logoGame = new FlxSprite();
	var eventFB = new FlxSprite();
	var dark = new FlxSprite();

	// > tab
	var BG2 = new FlxSprite();
	var YT = new FlxSprite();
	var GB = new FlxSprite();
	var GJ = new FlxSprite();
	var GH = new FlxSprite();
	var DA = new FlxSprite();

	// <
	var startGame = new FlxText();
	var start = true;
	var creditsGame = new FlxText();
	var credits = false;
	var exitGame = new FlxText();
	var exit = false;

	var verGame = "0.3.4";

	var speedBG:Int = 100;

	override public function create()
	{
		super.create();

		BG = new FlxSprite(imagePath + "mainMenu/menuBG.png");
		BG.x = 0;
		BG.y = 0;
		add(BG);

		bgBeat = new FlxSprite(imagePath + "mainMenu/forBG.png");
		bgBeat.x = 0;
		bgBeat.y = 0;
		add(bgBeat);

		final BFMain = new BFMain();
		add(BFMain);

		BGFB = new FlxSprite(imagePath + "mainMenu/BGForButtons.png");
		BGFB.x = 0;
		BGFB.y = 0;
		add(BGFB);

		logoGame = new FlxSprite(imagePath + "mainMenu/logoGame.png");
		logoGame.x = -20;
		logoGame.y = -20;
		logoGame.scale.set(0.7, 0.7);
		logoGame.antialiasing = true;
		add(logoGame);

		var versionGame = new FlxText(1040, 690, 0, "V" + verGame + "(ALPHA BUILD)");
		versionGame.setFormat(fontPath + "vcr.ttf", 20, FlxColor.CYAN);
		add(versionGame);

		startGame = new FlxText(530, 380, 0, "START");
		startGame.setFormat(fontPath + "phantomMuffFull.ttf", 60, FlxColor.WHITE);
		add(startGame);

		creditsGame = new FlxText(900, 610, 0, "CREDITS");
		creditsGame.setFormat(fontPath + "phantomMuffFull.ttf", 60, FlxColor.WHITE);
		add(creditsGame);

		exitGame = new FlxText(1500, 610, 0, "EXIT");
		exitGame.setFormat(fontPath + "phantomMuffFull.ttf", 60, FlxColor.WHITE);
		add(exitGame);

		// > tab continued

		BG2 = new FlxSprite(imagePath + "mainMenu/tab/BG.png");
		BG2.y = 0;
		BG2.x = 1290;
		BG2.antialiasing = true;
		add(BG2);

		YT = new FlxSprite(imagePath + "mainMenu/tab/YT.png");
		YT.y = 7;
		YT.x = 1140;
		YT.alpha = 0.0;
		YT.antialiasing = true;
		add(YT);

		GB = new FlxSprite(imagePath + "mainMenu/tab/GB.png");
		GB.y = 3;
		GB.x = 1180;
		GB.alpha = 0.0;
		GB.antialiasing = true;
		add(GB);

		GJ = new FlxSprite(imagePath + "mainMenu/tab/GJ.png");
		GJ.y = 3;
		GJ.x = 1225;
		GJ.alpha = 0.0;
		GJ.antialiasing = true;
		add(GJ);

		GH = new FlxSprite(imagePath + "mainMenu/tab/github.png");
		GH.y = 43;
		GH.x = 1160;
		GH.alpha = 0.0;
		GH.antialiasing = true;
		add(GH);

		DA = new FlxSprite(imagePath + "mainMenu/tab/DA.png");
		DA.y = 43;
		DA.x = 1205;
		DA.alpha = 0.0;
		DA.antialiasing = true;
		add(DA);

		// <

		final LRMain = new LRMain();
		add(LRMain);

		eventFB = new FlxSprite(imagePath + "mainMenu/eventFB.png");
		eventFB.x = 400;
		eventFB.y = -150;
		eventFB.antialiasing = true;
		add(eventFB);

		dark = new FlxSprite(imagePath + "GB.png");
		dark.x = 0;
		dark.y = -1310;
		add(dark);

		var darkS = new FlxSprite(imagePath + "GB.png");
		darkS.x = 0;
		darkS.y = -20;
		add(darkS);

		FlxTween.tween(BG2, {x: 1070}, 2.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(eventFB, {x: 400, y: 0}, 2.5, {ease: FlxEase.cubeInOut});
		FlxTween.tween(darkS, {x: 0, y: 1310}, 1.0, {ease: FlxEase.linear});
		FlxTween.tween(YT, {"alpha": 1.0}, 6.0, {ease: FlxEase.cubeInOut});
		FlxTween.tween(GB, {"alpha": 1.0}, 6.0, {ease: FlxEase.cubeInOut});
		FlxTween.tween(GJ, {"alpha": 1.0}, 6.0, {ease: FlxEase.cubeInOut});
		FlxTween.tween(GH, {"alpha": 1.0}, 6.0, {ease: FlxEase.cubeInOut});
		FlxTween.tween(DA, {"alpha": 1.0}, 6.0, {ease: FlxEase.cubeInOut});

		FlxG.autoPause = true;
		FlxG.mouse.visible = false;

		FlxG.sound.playMusic(musicPath + "freakyMenu.ogg");

		Application.current.window.title = "Funkin Music Stage | V0.3.4(Alpha Build)";

		var bgLol = new FlxTimer().start(2.0, timerBG, 1);
		bgLol.loops = 1000000;
		var beat = new FlxTimer().start(1.176, timerBeat, 1);
		beat.loops = 1000000;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		bgBeat.alpha = 0.3;
		bgBeat.velocity.x = -speedBG;

		YT.updateHitbox();
		GB.updateHitbox();
		GJ.updateHitbox();
		GH.updateHitbox();
		DA.updateHitbox();

		if (FlxG.mouse.justPressed)
		{
			FlxG.mouse.visible = true;
		}

		if (FlxG.mouse.overlaps(eventFB))
		{
			if (FlxG.mouse.justPressed)
			{
				System.openFile("event.txt");
			}
		}

		if (FlxG.mouse.overlaps(YT))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.openURL('youtube.com/@S.E_OFFICIAL', '_blank');
			}
		}

		if (FlxG.mouse.overlaps(GB))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.openURL('gamebanana.com/members/2116438', '_blank');
			}
		}

		if (FlxG.mouse.overlaps(GJ))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.openURL('gamejolt.com/@Scarlet-Eye', '_blank');
			}
		}

		if (FlxG.mouse.overlaps(GH))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.openURL('github.com/Scarlet-Eye/Funkin-Music-Stage-source', '_blank');
			}
		}

		if (FlxG.mouse.overlaps(DA))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.openURL('donationalerts.com/r/scarlet_eye', '_blank');
			}
		}

		if (start == false)
		{
			startGame.color = FlxColor.WHITE;
		}

		if (start == true)
		{
			start = true;
			credits = false;
			exit = false;

			startGame.color = FlxColor.CYAN;

			if (FlxG.keys.anyJustPressed([FlxKey.SPACE]))
			{
				FlxG.camera.flash(FlxColor.WHITE, 1.0);

				FlxG.sound.playMusic(musicPath + "nothing.ogg", 0.0, false);

				FlxG.sound.play("assets/sounds/confirmMenu.ogg");

				FlxTween.tween(dark, {x: 0, y: -20}, 1.0, {ease: FlxEase.linear});

				new FlxTimer().start(2.0, changeState, 1);
			}

			if (FlxG.keys.anyJustPressed([FlxKey.RIGHT, D]))
			{
				new FlxTimer().start(0.3, changeLOL2, 1);

				FlxTween.tween(startGame, {x: 130, y: 610}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(creditsGame, {x: 470, y: 380}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(exitGame, {x: 950, y: 610}, 0.5, {ease: FlxEase.cubeInOut});

				FlxG.sound.play(soundsPath + "scrollMenu.ogg");
			}
		}

		if (credits == false)
		{
			creditsGame.color = FlxColor.WHITE;
		}

		if (credits == true)
		{
			start = false;
			credits = true;
			exit = false;

			creditsGame.color = FlxColor.CYAN;

			if (FlxG.keys.anyJustPressed([FlxKey.SPACE]))
			{
				FlxG.camera.flash(FlxColor.WHITE, 1.0);

				FlxG.sound.playMusic(musicPath + "nothing.ogg", 0.0, false);

				FlxG.sound.play("assets/sounds/confirmMenu.ogg");

				FlxTween.tween(dark, {x: 0, y: -20}, 1.0, {ease: FlxEase.linear});

				new FlxTimer().start(2.0, changeState2, 1);
			}

			if (FlxG.keys.anyJustPressed([FlxKey.LEFT, A]))
			{
				new FlxTimer().start(0.3, changeLOL, 1);

				FlxTween.tween(startGame, {x: 530, y: 380}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(creditsGame, {x: 900, y: 610}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(exitGame, {x: 1500, y: 610}, 0.5, {ease: FlxEase.cubeInOut});

				FlxG.sound.play(soundsPath + "scrollMenu.ogg");
			}

			if (FlxG.keys.anyJustPressed([FlxKey.RIGHT, D]))
			{
				new FlxTimer().start(0.3, changeLOL3, 1);

				FlxTween.tween(startGame, {x: -600, y: 610}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(creditsGame, {x: 70, y: 610}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(exitGame, {x: 530, y: 380}, 0.5, {ease: FlxEase.cubeInOut});

				FlxG.sound.play(soundsPath + "scrollMenu.ogg");
			}
		}

		if (exit == false)
		{
			exitGame.color = FlxColor.WHITE;
		}

		if (exit == true)
		{
			start = false;
			credits = false;
			exit = true;

			exitGame.color = FlxColor.CYAN;

			if (FlxG.keys.anyJustPressed([FlxKey.SPACE]))
			{
				Sys.exit(0);
			}

			if (FlxG.keys.anyJustPressed([FlxKey.LEFT, A]))
			{
				new FlxTimer().start(0.3, changeLOL2, 1);

				FlxTween.tween(startGame, {x: 130, y: 610}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(creditsGame, {x: 470, y: 380}, 0.5, {ease: FlxEase.cubeInOut});
				FlxTween.tween(exitGame, {x: 950, y: 610}, 0.5, {ease: FlxEase.cubeInOut});

				FlxG.sound.play(soundsPath + "scrollMenu.ogg");
			}
		}
	}

	function timerBG(timer:FlxTimer)
	{
		bgBeat.x = 0;
	}

	function timerBeat(timer:FlxTimer)
	{
		FlxTween.color(bgBeat, 0.1, FlxColor.WHITE, FlxColor.PURPLE);
		FlxTween.color(bgBeat, 0.5, FlxColor.PURPLE, FlxColor.WHITE);
	}

	function changeLOL(timer:FlxTimer)
	{
		start = true;
		credits = false;
		exit = false;
	}

	function changeLOL2(timer:FlxTimer)
	{
		start = false;
		credits = true;
		exit = false;
	}

	function changeLOL3(timer:FlxTimer)
	{
		start = false;
		credits = false;
		exit = true;
	}

	function changeState(timer:FlxTimer)
	{
		FlxG.switchState(new PlayState());
	}

	function changeState2(timer:FlxTimer)
	{
		FlxG.switchState(new CreditsState());
	}
}
