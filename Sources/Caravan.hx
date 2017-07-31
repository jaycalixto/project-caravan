package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Caravan {

	public static var gameWidth = 640;
	public static var gameHeight = 360;

	public function new() {
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
	}

	function update(): Void {
		
	}

	function render(framebuffer: Framebuffer): Void {		
	}
}
