package;

import haxe.ui.HaxeUIApp;

class Main {
	public static function main() {
		PkgInfo.path = Sys.args()[0];
		PkgInfo.type = FormatUtil.detectFormat(PkgInfo.path);

		var app = new HaxeUIApp();
		app.ready(function() {
			app.addComponent(new MainView());

			app.start();
		});
	}
}
