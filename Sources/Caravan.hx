package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Color;
import kha.Image;
import kha.Scaler;
import kha.Assets;
import mankha.gfx.AnimatedSprite;
import mankha.utils.Rectangle;
import mankha.utils.Window;
import mankha.input.InputHandler;

class Caravan {

	//Shift to square resolution
	public static var gameWidth = 320;
	public static var gameHeight = 192;

	private static var bgColor = Color.Black;
	
	private var backbuffer: Image;
	//hold a window reference for treating resize events
	private var windowCanvas:Window;

	private var spr: AnimatedSprite;
	private var inputHandler: InputHandler;

	private var allSprites: Image;

	public function new(w:Window) {
		windowCanvas = w;
		
		System.notifyOnRender(render);
		
		Scheduler.addTimeTask(update, 0, 1 / 60);

		backbuffer = Image.createRenderTarget(gameWidth, gameHeight);

		Assets.loadImageFromPath("sprites.png", true, function(image) {
			allSprites = image;

			var sprSize = 16;

			spr = new AnimatedSprite(image, sprSize, sprSize);
			spr.framesUp = [
					new Rectangle(0, sprSize, sprSize, sprSize),
					new Rectangle(sprSize, sprSize, sprSize, sprSize),
					new Rectangle(0, sprSize, sprSize, sprSize),
					new Rectangle(sprSize * 2, sprSize, sprSize, sprSize)
				];
			spr.framesDown = [
					new Rectangle(0, 0, sprSize, sprSize),
					new Rectangle(sprSize, 0, sprSize, sprSize),
					new Rectangle(0, 0, sprSize, sprSize),
					new Rectangle(sprSize * 2, 0, sprSize, sprSize)
				];
			spr.framesLeft = [
					new Rectangle(0, sprSize * 2, sprSize, sprSize),
					new Rectangle(sprSize, sprSize * 2, sprSize, sprSize),
					new Rectangle(0, sprSize * 2, sprSize, sprSize),
					new Rectangle(sprSize * 2, sprSize * 2, sprSize, sprSize)
				];
			spr.framesRight = [
					new Rectangle(0, sprSize * 2, sprSize, sprSize),
					new Rectangle(sprSize, sprSize * 2, sprSize, sprSize),
					new Rectangle(0, sprSize * 2, sprSize, sprSize),
					new Rectangle(sprSize * 2, sprSize * 2, sprSize, sprSize)
				];
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
				spr.changeDirection(Direction.UP);
			} else if (inputHandler.down) {
				spr.position.y += 1;
				spr.changeDirection(Direction.DOWN);
			}

			if(inputHandler.left) {
				spr.position.x -= 1;
				spr.changeDirection(Direction.LEFT);
			} else if (inputHandler.right) {
				spr.position.x += 1;
				spr.changeDirection(Direction.RIGHT);
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
