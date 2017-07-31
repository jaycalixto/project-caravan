package;

import kha.System;

class Main {
	public static function main() {
		System.init(
			{
				title: "Project", 
				width: Caravan.gameWidth, 
				height: Caravan.gameHeight
			}, 
			function () {
				new Caravan();
			}
		);
	}
}
