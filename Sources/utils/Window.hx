package utils;

import js.Browser;
import js.html.CanvasElement;
import kha.System;

class Window{

	public var windowWidth:Int;
	public var windowHeight:Int;

	public function new(){
		resizeCanvas();
	}

	public function resizeCanvas(){
		#if js

		var c:CanvasElement = cast Browser.document.getElementById("khanvas");

		windowWidth = Std.int(Browser.window.innerWidth * 0.95);
		windowHeight = Std.int(Browser.window.innerHeight * 0.95);

		c.width = windowWidth;
		c.height = windowHeight;

		#else

		windowWidth = System.windowWidth;
		windowHeight = System.windowHeight;

		#end
	}

}