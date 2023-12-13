package;

import haxe.ui.containers.VBox;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.ComponentBuilder.build("assets/main-view.xml"))
class MainView extends VBox {
	public function new() {
		super();

		name.text = PkgInfo.name;
		version.text = PkgInfo.version;
		switch (PkgInfo.type) {
			case ALPM:
				status.text = "Install with pacman";
			case OTHER:
				status.text = "Unknown or unsupported package format";
				install.disabled = true;
		}

		cancel.onClick = (v:MouseEvent) -> Sys.exit(0);
	}
}
