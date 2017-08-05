package;

import kha.System;
import js.Browser;
import js.html.CanvasElement;

class Main {
	public static function main() {

		resizeCanvas();

		// var windowWidth = System.windowWidth();
		// var windowHeight = System.windowHeight();

		System.init(
			{
				title: "Project", 
				// width: Caravan.gameWidth, 
				// height: Caravan.gameHeight
				width: windowWidth, 
				height: windowHeight
			}, 
			function () {
				new Caravan();
			}
		);
	}

	public static var windowWidth:Int;
	public static var windowHeight:Int;

	public static function resizeCanvas(){
		#if js

		var c:CanvasElement = cast Browser.document.getElementById("khanvas");

		windowWidth = Std.int(Browser.window.innerWidth * 0.95);
		windowHeight = Std.int(Browser.window.innerHeight * 0.95);

		c.width = windowWidth;
		c.height = windowHeight;

		#end
	}
}
