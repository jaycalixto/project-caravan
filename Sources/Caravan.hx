package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Color;
import kha.Image;
import kha.Scaler;

class Caravan {

	public static var gameWidth = 640;
	public static var gameHeight = 360;

	private static var bgColor = Color.fromValue(0xAA00FF);
	
	private var backbuffer: Image;

	public function new() {
		
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);

		backbuffer = Image.createRenderTarget(gameWidth, gameHeight);
	}

	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {		
		backbuffer.g2.begin(bgColor);
		backbuffer.g2.end();

		framebuffer.g2.begin();
		Scaler.scale(backbuffer, framebuffer, System.screenRotation);
		framebuffer.g2.end();
	}
}
