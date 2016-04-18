package;

import kha.Framebuffer;
import kha.Color;
import kha.input.Keyboard;
import kha.Key;
import kha.Image;
import kha.Assets;
import kha2d.State;
import kha2d.Sprite;
import kha2d.Scene;


class PlayState extends State{

	public var randx:Int;
	public var img:Image;
	public var sprite:Sprite;
	
	public function new()
	{
		super();
	}


	override public function create()
	{
	    super.create();
	    trace("Creating Play State");
	    randx = Std.random(600);
		
		img = Assets.images.squirrel;
		sprite = new Sprite(img, 300, 240);
		
		Scene.the.setColissionMap(null);
		
		Scene.the.addHero(sprite);

	    Keyboard.get().notify(KeyDown, null);
	}

	public function KeyDown(key:Key, char:String):Void
	{
	    switch (key) {
	    	case ENTER:
	    		Game.switchState(new PlayState());
			default:
	    }
	}
	
	override public function destroy()
	{
	    super.destroy();
		Scene.the.clear();
	     Keyboard.get().remove(KeyDown, null);
	}

	override public function update()
	{
		Scene.the.update();
	    super.update();
	}

	override public function render(framebuffer:Framebuffer)
	{
	    super.render(framebuffer);
	    // trace("Rendering Play State");

	    var g = framebuffer.g2;
	    g.begin(true, Color.Pink);
	    g.color = Color.Orange;
	    g.fillRect(randx,100, 300, 300);
	    g.color = Color.White;
		g.drawImage(img, 200, randx);
		// Kha2D scene on top
		Scene.the.render(g);
	    g.end();
	}
}