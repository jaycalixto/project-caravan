package;

import kha.System;
import mankha.utils.Window;

class Main {
	public static function main() {

		var windowUtils = new Window();

		System.init(
			{
				title: "Project", 
				// width: Caravan.gameWidth, 
				// height: Caravan.gameHeight
				width: windowUtils.windowWidth, 
				height: windowUtils.windowHeight
			}, 
			function () {
				new Caravan(windowUtils);
			}
		);
	}
}
