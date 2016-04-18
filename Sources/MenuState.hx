package;

import kha.Framebuffer;
import kha.input.Mouse;
import kha.Assets;
import kha2d.State;

class MenuState extends State {

	public function new()
	{
		super();
		Assets.loadEverything(create);
	}

	override public function create()
	{
	    super.create();
	    trace("Creating Menu State");

		if(Mouse.get() != null) Mouse.get().notify(onMouseDown, null, null, null);

	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		if(button == 0){
			Game.switchState(new PlayState());  /// THIS doesn't work, why?
		}
	}
	   

	
	override public function destroy()
	{
	    super.destroy();
	    // remove mouse listener
	    Mouse.get().remove(onMouseDown, null, null, null);
	}

	override public function update()
	{
	    super.update();
	}

	override public function render(framebuffer: Framebuffer)
	{
	    super.render(framebuffer);

	    var g = framebuffer.g2;
	    g.begin();

	    g.fillRect(50,50, 300, 300);
	    g.end();
	}
}