package;

import Sys;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxAssets;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import lime.app.Application;

class PlayState extends FlxState
{
	var fontPath = "assets/fonts/";
	var imagePath = "assets/images/";
	var musicPath = "assets/music/";
	var soundsPath = "assets/sounds/";

	var exitM = new FlxButton();
	var translateENG = new FlxButton();
	var translateRU = new FlxButton();
	var TTOG = new FlxButton();
	var stageC = new FlxButton();
	var stageC2 = new FlxButton();
	var stageC3 = new FlxButton();
	// var secondP2 = new FlxButton();
	var changeW = new FlxButton();
	var changeOrW = new FlxButton();
	var buttonRemoveVG = new FlxButton();
	var buttonVG = new FlxButton();
	var buttonExit = new FlxButton();
	var score = new FlxText();
	// var scoreP2 = new FlxText();
	var lolM = new FlxText();
	var lolMOr = new FlxText();
	var ver = new FlxText();
	var stage = new FlxSprite();
	var stage2 = new FlxSprite();
	var stage3 = new FlxSprite();
	var three = new FlxSprite();
	var one = new FlxSprite();
	var go = new FlxSprite();
	var bvg = new FlxSprite();
	var sm = new FlxSprite();
	var darkS = new FlxSprite();
	var scoreGame = 0;
	// var scoreGame2 = 0;
	var versionGame = "V0.3.4(ALPHA BUILD)";

	var sModeON = false;
	var smMusic = false;

	var altModeForNeko = false;

	override public function create()
	{
		super.create();

		stage = new FlxSprite("assets/images/stages/scene.png");
		stage.x = -605;
		stage.y = -350;
		stage.scale.set(0.53, 0.53);
		add(stage);

		stage2 = new FlxSprite("assets/images/stages/skyZone.png");
		stage2.x = -580;
		stage2.y = -350;
		stage2.visible = false;
		add(stage2);

		stage3 = new FlxSprite("assets/images/stages/sonicEXEZone.png");
		stage3.x = -370;
		stage3.y = -208;
		stage3.scale.set(0.72, 0.72);
		stage3.visible = false;
		add(stage3);

		final BF = new BF();
		add(BF);

		final Arrows = new Arrows();
		add(Arrows);

		score = new FlxText(580, 530, 0, 'Score : $scoreGame');
		score.setFormat("assets/fonts/vcr.ttf", 20, FlxColor.WHITE);
		add(score);

		// scoreP2 = new FlxText(280, 530, 0, 'Score : $scoreGame2');
		// scoreP2.setFormat("assets/fonts/vcr.ttf", 20, FlxColor.WHITE);

		lolM = new FlxText(20, 680, 0, "Sorry, I couldn't help but add this stage :D");
		lolM.setFormat("assets/fonts/vcr.ttf", 20, FlxColor.ORANGE);
		lolM.visible = false;
		add(lolM);

		lolMOr = new FlxText(20, 682, 0, "Sorry, I couldn't help but add this stage :D");
		lolMOr.setFormat("assets/fonts/vcr.ttf", 20, FlxColor.RED);
		lolMOr.visible = false;
		add(lolMOr);

		final BHUD = new BHUD();
		add(BHUD);

		exitM = new FlxButton(480, 0, "Exit in menu", EIM);
		exitM.color = FlxColor.RED;
		add(exitM);

		translateENG = new FlxButton(570, 0, "RU", translateE);
		add(translateENG);

		translateRU = new FlxButton(570, -50, "ENG", translateR);
		add(translateRU);

		// FHUD >

		TTOG = new FlxButton(660, 0, "Intro", threeTwoOneGO);
		TTOG.color = FlxColor.GREEN;
		add(TTOG);

		three = new FlxSprite(imagePath + "FHUD/ready.png");
		three.scale.set(0.6, 0.6);
		three.screenCenter();
		three.alpha = 0.0;
		three.antialiasing = true;
		add(three);

		one = new FlxSprite(imagePath + "FHUD/set.png");
		one.scale.set(0.6, 0.6);
		one.screenCenter();
		one.alpha = 0.0;
		one.antialiasing = true;
		add(one);

		go = new FlxSprite(imagePath + "FHUD/go.png");
		go.scale.set(0.6, 0.6);
		go.screenCenter();
		go.alpha = 0.0;
		go.antialiasing = true;
		add(go);

		// <

		stageC = new FlxButton(750, 0, "stage#1", changeStage1);
		add(stageC);

		stageC2 = new FlxButton(750, -50, "stage#2", changeStage2);
		stageC2.color = FlxColor.CYAN;
		add(stageC2);

		stageC3 = new FlxButton(750, -100, "stage#3", changeStage3);
		stageC3.color = FlxColor.RED;
		add(stageC3);

		// secondP2 = new FlxButton(840, 0, "Add 2P Mode", twoP);
		// secondP2.color = FlxColor.CYAN;
		// add(secondP2);

		// var flipBF = new FlxButton(840, 0, "flipX BF", flipBOYFRIEND);
		// add(flipBF);

		var sMode = new FlxButton(840, 0, "Standby Mode", standbyMode);
		sMode.color = FlxColor.BLUE;
		add(sMode);

		var flash = new FlxButton(930, 0, "Flash", flashW);
		add(flash);

		changeW = new FlxButton(1020, 0, "960x540", changeWindow);
		add(changeW);

		changeOrW = new FlxButton(1020, -50, "1280x720", changeWindowOrig);
		add(changeOrW);

		buttonRemoveVG = new FlxButton(1110, -50, "Remove VG", vgRemove);
		add(buttonRemoveVG);

		buttonVG = new FlxButton(1110, 0, "BlackVG", vg);
		buttonVG.color = FlxColor.TRANSPARENT;
		add(buttonVG);

		buttonExit = new FlxButton(1200, 0, "Exit", exit);
		buttonExit.color = FlxColor.RED;
		add(buttonExit);

		ver = new FlxText(0, 0, 0, versionGame);
		ver.setFormat("assets/fonts/vcr.ttf", 20, FlxColor.CYAN);
		add(ver);

		bvg = new FlxSprite("assets/images/settings/black_vignette.png");
		bvg.alpha = 0.0;
		add(bvg);

		sm = new FlxSprite("assets/images/SM.png");
		sm.x = 0;
		sm.y = 0;
		sm.alpha = 0.0;
		add(sm);

		darkS = new FlxSprite(imagePath + "GB.png");
		darkS.x = 0;
		darkS.y = -20;
		add(darkS);

		FlxTween.tween(darkS, {x: 0, y: 1310}, 1.0, {ease: FlxEase.linear});

		FlxG.autoPause = true;
		FlxG.mouse.visible = true;

		Application.current.window.title = "Funkin Music Stage | V0.3.4(Alpha Build)";

		var TCC = new FlxTimer().start(0.5, timerChangeColorTTOG, 1);
	}

	public function new()
	{
		super();

		var settingsSave = new FlxSave();

		settingsSave.bind('SS');
		settingsSave.flush();
	}

	private function EIM()
	{
		darkS.y = -1310;

		FlxTween.tween(darkS, {x: 0, y: -20}, 1.0, {ease: FlxEase.linear});

		new FlxTimer().start(2.0, changeState, 1);
	}

	private function translateE()
	{
		translateENG.y = -50;
		translateRU.y = 0;
		ver.text = "V0.3.4(АЛЬФА СБОРКА)";
		lolM.text = "Извините, я не мог не добавить эту стадию :D";
		lolMOr.text = "Извините, я не мог не добавить эту стадию :D";
		// Application.current.window.title = "Funkin Music Stage | V0.2.3(Альфа версия)";
	}

	private function translateR()
	{
		translateENG.y = 0;
		translateRU.y = -50;
		ver.text = "V0.3.4(ALPHA BUILD)";
		lolM.text = "Sorry, I couldn't help but add this stage :D";
		lolMOr.text = "Sorry, I couldn't help but add this stage :D";
		// Application.current.window.title = "Funkin Music Stage | V0.2.3(Alpha Version)";
	}

	private function threeTwoOneGO()
	{
		new FlxTimer().start(1.0, timerONE, 1);
		new FlxTimer().start(2.0, timerTWO, 1);
		new FlxTimer().start(3.0, timerTHREE, 1);
		new FlxTimer().start(4.0, timerGO, 1);
	}

	private function changeStage1()
	{
		stageC.y = -50;
		stageC2.y = 0;
		stage.visible = false;
		stage2.visible = true;
	}

	private function changeStage2()
	{
		stageC2.y = -100;
		stageC3.y = 0;
		stage2.visible = false;
		stage3.visible = true;

		lolM.visible = true;
		lolMOr.visible = true;
		new FlxTimer().start(0.666, stopM, 1);
	}

	private function changeStage3()
	{
		stageC3.y = -100;
		stageC.y = 0;
		stage3.visible = false;
		stage.visible = true;
	}

	private function standbyMode()
	{
		sModeON = true;

		FlxG.sound.playMusic("assets/music/1.ogg");
	}

	// private function twoP()
	// {
	// final BF2P = new BF2P();
	// add(BF2P);
	// final Arrows2P = new Arrows2P();
	// add(Arrows2P);
	// add(scoreP2);
	// translateENG.x = 750;
	// translateRU.x = 750;
	// stageC.x = 840;
	// stageC2.x = 840;
	// stageC3.x = 840;
	// secondP2.y = -50;
	// }

	private function flashW()
	{
		FlxG.camera.flash(FlxColor.WHITE, 0.5);
	}

	private function changeWindow()
	{
		FlxG.resizeWindow(960, 540);

		changeW.y = -50;
		changeOrW.y = 0;
	}

	private function changeWindowOrig()
	{
		FlxG.resizeWindow(1280, 720);

		changeW.y = 0;
		changeOrW.y = -50;
	}

	private function vgRemove()
	{
		FlxTween.tween(bvg, {"alpha": 0.0}, 0.5);

		buttonVG.y = 0;
		buttonRemoveVG.y = -50;
	}

	private function vg()
	{
		FlxTween.tween(bvg, {"alpha": 1.0}, 0.5);

		buttonVG.y = -50;
		buttonRemoveVG.y = 0;
	}

	private function exit()
	{
		Sys.exit(0);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		// if (smMusic == false)
		// {
		// FlxG.sound.playMusic("assets/music/nothing.ogg");
		// }

		// if (smMusic == true)
		// {
		// FlxG.sound.playMusic("assets/music/1.ogg");
		// }

		score.text = 'Score : $scoreGame';
		// scoreP2.text = 'Score : $scoreGame2';

		if (FlxG.mouse.overlaps(ver))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.openURL('github.com/Scarlet-Eye/Funkin-Music-Stage-source', '_blank');
				ver.color = FlxColor.WHITE;

				new FlxTimer().start(0.3, stopClick, 1);
			}
		}

		if (sModeON == false)
		{
			FlxTween.tween(translateENG, {"alpha": 1.0}, 0.2);
			FlxTween.tween(translateRU, {"alpha": 1.0}, 0.2);
			FlxTween.tween(score, {"alpha": 1.0}, 0.2);
			FlxTween.tween(stageC, {"alpha": 1.0}, 0.2);
			FlxTween.tween(stageC2, {"alpha": 1.0}, 0.2);
			FlxTween.tween(stageC3, {"alpha": 1.0}, 0.2);
			FlxTween.tween(buttonVG, {"alpha": 1.0}, 0.2);
			FlxTween.tween(buttonExit, {"alpha": 1.0}, 0.2);
			FlxTween.tween(sm, {"alpha": 0.0}, 0.2);
			FlxTween.tween(ver, {"alpha": 1.0}, 0.2);

			FlxG.mouse.visible = true;
			FlxG.sound.playMusic("assets/music/nothing.ogg");
			smMusic = false;
		}

		if (sModeON == true)
		{
			FlxTween.tween(translateENG, {"alpha": 0.0}, 0.2);
			FlxTween.tween(translateRU, {"alpha": 0.0}, 0.2);
			FlxTween.tween(score, {"alpha": 0.0}, 0.2);
			FlxTween.tween(stageC, {"alpha": 0.0}, 0.2);
			FlxTween.tween(stageC2, {"alpha": 0.0}, 0.2);
			FlxTween.tween(stageC3, {"alpha": 0.0}, 0.2);
			FlxTween.tween(buttonRemoveVG, {"alpha": 0.0}, 0.2);
			FlxTween.tween(buttonVG, {"alpha": 0.0}, 0.2);
			FlxTween.tween(buttonExit, {"alpha": 0.0}, 0.2);
			FlxTween.tween(sm, {"alpha": 1.0}, 0.2);
			FlxTween.tween(ver, {"alpha": 0.0}, 0.2);

			FlxG.mouse.visible = false;
			smMusic = true;

			if (FlxG.keys.anyJustPressed([FlxKey.ENTER]))
			{
				sModeON = false;
			}
		}

		if (altModeForNeko == false)
		{
			if (FlxG.keys.anyJustPressed([FlxKey.R]))
			{
				score.color = FlxColor.WHITE;

				scoreGame = 0;
			}
		}

		#if neko
		if (altModeForNeko == true)
		{
			if (FlxG.keys.anyJustPressed([FlxKey.R]))
			{
				FlxG.resetGame();
			}
		}
		#end

		// if (FlxG.keys.anyJustPressed([FlxKey.A]))
		// {
		// scoreGame2++;
		// scoreGame2 + 1;
		// scoreP2.color = FlxColor.MAGENTA;
		// }

		// if (FlxG.keys.anyJustPressed([FlxKey.S]))
		// {
		// scoreGame2++;
		// scoreGame2 + 1;
		// scoreP2.color = FlxColor.CYAN;
		// }

		// if (FlxG.keys.anyJustPressed([FlxKey.W]))
		// {
		// scoreGame2++;
		// scoreGame2 + 1;
		// scoreP2.color = FlxColor.LIME;
		// }

		// if (FlxG.keys.anyJustPressed([FlxKey.D]))
		// {
		// scoreGame2++;
		// scoreGame2 + 1;
		// scoreP2.color = FlxColor.RED;
		// }

		if (FlxG.keys.anyJustPressed([FlxKey.LEFT, F]))
		{
			scoreGame++;
			scoreGame + 1;
			score.color = FlxColor.MAGENTA;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.DOWN, G]))
		{
			scoreGame++;
			scoreGame + 1;
			score.color = FlxColor.CYAN;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.UP, J]))
		{
			scoreGame++;
			scoreGame + 1;
			score.color = FlxColor.LIME;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.RIGHT, K]))
		{
			scoreGame++;
			scoreGame + 1;
			score.color = FlxColor.RED;
		}
	}

	function changeState(timer:FlxTimer)
	{
		FlxG.switchState(new MainMenu());
	}

	function timerChangeColorTTOG(timer:FlxTimer)
	{
		FlxTween.color(TTOG, 0.5, FlxColor.GREEN, FlxColor.ORANGE);

		new FlxTimer().start(1.0, timerChangeColorTTOG2, 1);
	}

	function timerChangeColorTTOG2(timer:FlxTimer)
	{
		FlxTween.color(TTOG, 0.5, FlxColor.ORANGE, FlxColor.YELLOW);

		new FlxTimer().start(1.0, timerChangeColorTTOG3, 1);
	}

	function timerChangeColorTTOG3(timer:FlxTimer)
	{
		FlxTween.color(TTOG, 0.5, FlxColor.YELLOW, FlxColor.GREEN);

		new FlxTimer().start(1.0, timerChangeColorTTOG, 1);
	}

	function stopClick(timer:FlxTimer)
	{
		ver.color = FlxColor.CYAN;
	}

	function stopM(timer:FlxTimer)
	{
		lolM.visible = false;
		lolMOr.visible = false;
	}

	function timerONE(timer:FlxTimer)
	{
		FlxG.sound.play(soundsPath + "FHUD/intro1.ogg");
	}

	function timerTWO(timer:FlxTimer)
	{
		FlxG.sound.play(soundsPath + "FHUD/intro2.ogg");

		FlxTween.tween(three, {"alpha": 1.0}, 0.3);
		FlxTween.tween(three, {"alpha": 0.0}, 1.0);
	}

	function timerTHREE(timer:FlxTimer)
	{
		FlxG.sound.play(soundsPath + "FHUD/intro3.ogg");

		FlxTween.tween(one, {"alpha": 1.0}, 0.3);
		FlxTween.tween(one, {"alpha": 0.0}, 1.0);
	}

	function timerGO(timer:FlxTimer)
	{
		FlxG.sound.play(soundsPath + "FHUD/introGo.ogg");

		FlxTween.tween(go, {"alpha": 1.0}, 0.3);
		FlxTween.tween(go, {"alpha": 0.0}, 1.0);
	}
}
