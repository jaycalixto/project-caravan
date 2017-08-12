package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Color;
import kha.Image;
import kha.Scaler;
import kha.Assets;
import mankha.gfx.AnimatedSprite;
import mankha.utils.Window;

class Caravan {

	//Shift to square resolution
	public static var gameWidth = 256;
	public static var gameHeight = 256;

	private static var bgColor = Color.fromValue(0x0A0A0F);
	
	private var backbuffer: Image;
	//hold a window reference for treating resize events
	private var windowCanvas:Window;

	private var spr: AnimatedSprite;

	public function new(w:Window) {
		windowCanvas = w;
		//windowCanvas.forceIntegerResolution(gameWidth, gameHeight);
		
		System.notifyOnRender(render);
		
		trace("w: " + windowCanvas.windowWidth + " h: " + windowCanvas.windowHeight);
		//System.changeResolution(windowCanvas.windowWidth, windowCanvas.windowHeight);

		Scheduler.addTimeTask(update, 0, 1 / 60);

		backbuffer = Image.createRenderTarget(gameWidth, gameHeight);

		Assets.loadImageFromPath("char1.png", true, function(image) {
			spr = new AnimatedSprite(image, 24, 38);
		});
	}

	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {		
		backbuffer.g2.begin(bgColor);
		if(spr != null) {
			//backbuffer.g2.drawImage(img, 0, 0);
			spr.draw(backbuffer.g2);
		}
		backbuffer.g2.end();

		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();

		//trace("fb w: "+ framebuffer.width+ " fb h: " + framebuffer.height);
	}
}
