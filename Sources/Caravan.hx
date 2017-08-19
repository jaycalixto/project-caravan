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
import mankha.input.InputHandler;

class Caravan {

	//Shift to square resolution
	public static var gameWidth = 320;
	public static var gameHeight = 192;

	private static var bgColor = Color.fromValue(0x0A0A0F);
	
	private var backbuffer: Image;
	//hold a window reference for treating resize events
	private var windowCanvas:Window;

	private var spr: AnimatedSprite;
	private var inputHandler: InputHandler;

	public function new(w:Window) {
		windowCanvas = w;
		
		System.notifyOnRender(render);
		
		Scheduler.addTimeTask(update, 0, 1 / 60);

		backbuffer = Image.createRenderTarget(gameWidth, gameHeight);

		Assets.loadImageFromPath("char1.png", true, function(image) {
			spr = new AnimatedSprite(image, 24, 38);
		});

		inputHandler = new InputHandler();
	}

	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {		
		backbuffer.g2.begin(bgColor);
		if (spr != null) {

			if (inputHandler.up) {
				spr.position.y -= 1;
			} else if (inputHandler.down) {
				spr.position.y += 1;
			}

			if(inputHandler.left) {
				spr.position.x -= 1;
			} else if (inputHandler.right) {
				spr.position.x += 1;
			}

			if (spr.position.x < 0) {
				spr.position.x = 0;
			} else if ((spr.position.x + spr.frameW) > gameWidth) {
				spr.position.x = gameWidth - spr.frameW;
			}

			if(spr.position.y < 0) {
				spr.position.y = 0;
			} else if ((spr.position.y + spr.frameH) > gameHeight) {
				spr.position.y = gameHeight - spr.frameH;
			}

			spr.draw(backbuffer.g2);
		}
		backbuffer.g2.end();

		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();

	}
}
