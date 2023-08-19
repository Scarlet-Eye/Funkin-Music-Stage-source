package;

import Sys;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxAssets;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.util.FlxTimer;
import lime.app.Application;

class PlayState extends FlxState
{
	var translateENG = new FlxButton();
	var translateRU = new FlxButton();
	var stageC = new FlxButton();
	var stageC2 = new FlxButton();
	var stageC3 = new FlxButton();
	var secondP2 = new FlxButton();
	var changeW = new FlxButton();
	var changeOrW = new FlxButton();
	var buttonRemoveVG = new FlxButton();
	var buttonVG = new FlxButton();
	var buttonExit = new FlxButton();
	var score = new FlxText();
	var scoreP2 = new FlxText();
	var lolM = new FlxText();
	var lolMOr = new FlxText();
	var ver = new FlxText();
	var stage = new FlxSprite();
	var stage2 = new FlxSprite();
	var stage3 = new FlxSprite();
	var bvg = new FlxSprite();
	var scoreGame = 0;
	var scoreGame2 = 0;
	var versionGame = "V0.2.3(Alpha Version)";

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

		scoreP2 = new FlxText(280, 530, 0, 'Score : $scoreGame2');
		scoreP2.setFormat("assets/fonts/vcr.ttf", 20, FlxColor.WHITE);

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

		translateENG = new FlxButton(660, 0, "RU", translateE);
		add(translateENG);

		translateRU = new FlxButton(660, -50, "ENG", translateR);
		add(translateRU);

		stageC = new FlxButton(750, 0, "stage#1", changeStage1);
		add(stageC);

		stageC2 = new FlxButton(750, -50, "stage#2", changeStage2);
		stageC2.color = FlxColor.CYAN;
		add(stageC2);

		stageC3 = new FlxButton(750, -100, "stage#3", changeStage3);
		stageC3.color = FlxColor.RED;
		add(stageC3);

		secondP2 = new FlxButton(840, 0, "Add 2P Mode", twoP);
		secondP2.color = FlxColor.CYAN;
		add(secondP2);

		// var flipBF = new FlxButton(840, 0, "flipX BF", flipBOYFRIEND);
		// add(flipBF);

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

		FlxG.autoPause = true;
		FlxG.mouse.visible = true;

		Application.current.window.title = "Funkin Music Stage | V0.2.3(Alpha Version)";
	}

	public function new()
	{
		super();

		var settingsSave = new FlxSave();

		settingsSave.bind('SS');
		settingsSave.flush();
	}

	private function translateE()
	{
		translateENG.y = -50;
		translateRU.y = 0;
		ver.text = "V0.2.3(Альфа Версия)";
		lolM.text = "Извините, я не мог не добавить эту стадию :D";
		lolMOr.text = "Извините, я не мог не добавить эту стадию :D";
		// Application.current.window.title = "Funkin Music Stage | V0.2.3(Альфа версия)";
	}

	private function translateR()
	{
		translateENG.y = 0;
		translateRU.y = -50;
		ver.text = "V0.2.3(Alpha Version)";
		lolM.text = "Sorry, I couldn't help but add this stage :D";
		lolMOr.text = "Sorry, I couldn't help but add this stage :D";
		// Application.current.window.title = "Funkin Music Stage | V0.2.3(Alpha Version)";
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

	private function twoP()
	{
		final BF2P = new BF2P();
		add(BF2P);
		final Arrows2P = new Arrows2P();
		add(Arrows2P);
		add(scoreP2);

		translateENG.x = 750;
		translateRU.x = 750;
		stageC.x = 840;
		stageC2.x = 840;
		stageC3.x = 840;
		secondP2.y = -50;
	}

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
		bvg.alpha = 0.0;

		buttonVG.y = 0;
		buttonRemoveVG.y = -50;
	}

	private function vg()
	{
		bvg.alpha = 1.0;

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

		score.text = 'Score : $scoreGame';
		scoreP2.text = 'Score : $scoreGame2';

		if (FlxG.mouse.overlaps(ver))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.openURL('github.com/Scarlet-Eye/Funkin-Music-Stage-source', '_blank');
				ver.color = FlxColor.WHITE;

				new FlxTimer().start(0.3, stopClick, 1);
			}
		}

		if (FlxG.keys.anyJustPressed([FlxKey.R]))
		{
			FlxG.resetGame();
		}

		if (FlxG.keys.anyJustPressed([FlxKey.A]))
		{
			scoreGame2++;
			scoreGame2 + 1;
			scoreP2.color = FlxColor.MAGENTA;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.S]))
		{
			scoreGame2++;
			scoreGame2 + 1;
			scoreP2.color = FlxColor.CYAN;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.W]))
		{
			scoreGame2++;
			scoreGame2 + 1;
			scoreP2.color = FlxColor.LIME;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.D]))
		{
			scoreGame2++;
			scoreGame2 + 1;
			scoreP2.color = FlxColor.RED;
		}

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

	function stopClick(timer:FlxTimer)
	{
		ver.color = FlxColor.CYAN;
	}

	function stopM(timer:FlxTimer)
	{
		lolM.visible = false;
		lolMOr.visible = false;
	}
}
