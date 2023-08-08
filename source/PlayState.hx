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
	var changeW = new FlxButton();
	var changeOrW = new FlxButton();
	var buttonRemoveVG = new FlxButton();
	var buttonVG = new FlxButton();
	var buttonExit = new FlxButton();
	var score = new FlxText();
	var ver = new FlxText();
	var bvg = new FlxSprite();
	var scoreGame = 0;
	var versionGame = "V0.1.2(Concept Version)";

	override public function create()
	{
		super.create();

		var stage = new FlxSprite("assets/images/stages/scene.png");
		stage.x = -605;
		stage.y = -350;
		stage.scale.set(0.53, 0.53);
		add(stage);

		final BF = new BF();
		add(BF);

		final Arrows = new Arrows();
		add(Arrows);

		score = new FlxText(580, 530, 0, 'Score : $scoreGame');
		score.setFormat("assets/fonts/vcr.ttf", 20, FlxColor.WHITE);
		add(score);

		final BHUD = new BHUD();
		add(BHUD);

		translateENG = new FlxButton(840, 0, "RU", translateE);
		add(translateENG);

		translateRU = new FlxButton(840, -50, "ENG", translateR);
		add(translateRU);

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

		Application.current.window.title = "Funkin Music Stage | V0.1.2(Concept Version)";
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
		ver.text = "V0.1.2(Концепт Версия)";
		// Application.current.window.title = "Funkin Music Stage | V0.1.2(Концепт Версия)";
	}

	private function translateR()
	{
		translateENG.y = 0;
		translateRU.y = -50;
		ver.text = "V0.1.2(Concept Version)";
		// Application.current.window.title = "Funkin Music Stage | V0.1.2(Concept Version)";
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

		if (FlxG.keys.anyJustPressed([FlxKey.LEFT, D]))
		{
			scoreGame++;
			scoreGame + 1;
			score.color = FlxColor.MAGENTA;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.DOWN, F]))
		{
			scoreGame++;
			scoreGame + 1;
			score.color = FlxColor.CYAN;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.UP, H]))
		{
			scoreGame++;
			scoreGame + 1;
			score.color = FlxColor.LIME;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.RIGHT, J]))
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
}
