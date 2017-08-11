package;

import kha.System;
import mankha.utils.Window;

class Main {
	public static function main() {

		var w = new Window(Caravan.gameWidth, Caravan.gameHeight);

		System.init(
			{
				title: "Project", 
				width: w.windowWidth, 
				height: w.windowHeight
			}, 
			function () {
				new Caravan(w);
			}
		);
	}
}
