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

class PlayState extends FlxState
{
	var score = new FlxText();
	var ver = new FlxText();
	var scoreGame = 0;
	var versionGame = "V0.0.1(Concept Version)"; // Концепт Версия, Очки (RUS)

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

		var changeW = new FlxButton(930, 0, "960x540", changeWindow);
		add(changeW);

		var changeOrW = new FlxButton(1020, 0, "1280x720", changeWindowOrig);
		add(changeOrW);

		var buttonVG = new FlxButton(1110, 0, "BlackVG", vg);
		add(buttonVG);

		var buttonExit = new FlxButton(1200, 0, "Exit", exit);
		add(buttonExit);

		ver = new FlxText(0, 0, 0, versionGame);
		ver.setFormat("assets/fonts/vcr.ttf", 20, FlxColor.CYAN);
		add(ver);

		FlxG.autoPause = true;
		FlxG.mouse.visible = true;
	}

	public function new()
	{
		super();

		var settingsSave = new FlxSave();

		settingsSave.bind('SS');
		settingsSave.flush();
	}

	private function changeWindow()
	{
		FlxG.resizeWindow(960, 540);
	}

	private function changeWindowOrig()
	{
		FlxG.resizeWindow(1280, 720);
	}

	private function vg()
	{
		var bvg = new FlxSprite("assets/images/settings/black_vignette.png");
		add(bvg);
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
		}

		if (FlxG.keys.anyJustPressed([FlxKey.DOWN, F]))
		{
			scoreGame++;
			scoreGame + 1;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.UP, H]))
		{
			scoreGame++;
			scoreGame + 1;
		}

		if (FlxG.keys.anyJustPressed([FlxKey.RIGHT, J]))
		{
			scoreGame++;
			scoreGame + 1;
		}
	}
}
