package;

import Options.OffsetMenu;
import flixel.util.FlxColor;
import flixel.addons.ui.FlxButtonPlus;
import flixel.FlxG;
import flixel.system.FlxSoundGroup;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.ui.FlxButton;

class TestState extends FlxState
{
    
	override public function create()
	{
       
        FlxG.mouse.visible = true;

        var sherlock = Paths.getSparrowAtlas('static');
        var bg:FlxSprite = new FlxSprite(-80);
        bg.frames = sherlock;
        bg.animation.addByPrefix('idle', 'Static', 12);
        bg.setGraphicSize(Std.int(bg.width * 1.1));
        bg.screenCenter();
        bg.antialiasing = true;
        bg.animation.play('idle');
        add(bg);
        
        var newGame = new FlxButtonPlus(0, 275, newgame);
        newGame.loadButtonGraphic(new FlxSprite().loadGraphic(Paths.image('newmenu/newGame')), new FlxSprite().loadGraphic(Paths.image('select/newGame')));
        add(newGame);
		
        var continueGame = new FlxButtonPlus(0, 355, continuegame);
        continueGame.loadButtonGraphic(new FlxSprite().loadGraphic(Paths.image('newmenu/Continue')), new FlxSprite().loadGraphic(Paths.image('select/Continue')));
        add(continueGame);

        var freePlay = new FlxButtonPlus(0, 455, freeplay);
        freePlay.loadButtonGraphic(new FlxSprite().loadGraphic(Paths.image('newmenu/CustomTracks')), new FlxSprite().loadGraphic(Paths.image('select/CustomTracks')));
        add(freePlay);

        var skin = new FlxButtonPlus(0, 555, skins);
        skin.loadButtonGraphic(new FlxSprite().loadGraphic(Paths.image('newmenu/Skins')), new FlxSprite().loadGraphic(Paths.image('select/Skins')));
        add(skin);

        var money = new FlxButtonPlus(0, 630, donate);
        money.loadButtonGraphic(new FlxSprite().loadGraphic(Paths.image('newmenu/Donate')), new FlxSprite().loadGraphic(Paths.image('select/Donate')));
        add(money);

        //var gear = Paths.getSparrowAtlas('newmenu/gear');
       // var gearsprite = new FlxSprite();
       // gearsprite.frames = gear;
       // gearsprite.animation.addByPrefix('spin', 'gear', 24);

       // var cog = new FlxButtonPlus(400, 400, settings);
       // cog.loadButtonGraphic(gearsprite, gearsprite);
        //cog.enterCallback(gearsprite.animation.play('spin'));
        //add(cog);

		super.create();
	}

    var soundstuff = new FlxSoundGroup();

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

    function donate()
        {
            link("https://www.kickstarter.com/projects/funkin/friday-night-funkin-the-full-ass-game");
        }
    function skins()
        {
            FlxG.sound.play(Paths.sound('spookConfirm'), 1, false, soundstuff, false, skinsswitch);
        }
    function skinsswitch()
        {
            FlxG.switchState(new OptionsMenu());
        }
    function freeplay()
        {
            FlxG.sound.play(Paths.sound('spookConfirm'), 1, false, soundstuff, false, freeplayswitch);
        }
    function freeplayswitch()
        {
            FlxG.switchState(new FreeplayState());
        }
    function continuegame()
        {
            FlxG.sound.play(Paths.sound('spookConfirm'), 1, false, soundstuff, false, continuegameswitch);
        }
    function continuegameswitch()
        {
            FlxG.switchState(new StoryMenuState());
        }
	function newgame()
        {
            FlxG.sound.play(Paths.sound('spookConfirm'), 1, false, soundstuff, false, newgameswitch);
        }
    function newgameswitch()
        {
            FlxG.switchState(new StoryMenuState());
        }
    function settings()
        {
            FlxG.sound.play(Paths.sound('spookConfirm'), 1, false, soundstuff, false, settingsswitch);
        }
    function settingsswitch()
        {
            FlxG.switchState(new OptionsMenu());
        }
    function link(schmancy:String)
        {
            #if linux
            Sys.command('/usr/bin/xdg-open', [schmancy, "&"]);
            #else
            FlxG.openURL(schmancy);
            #end
         }
}
