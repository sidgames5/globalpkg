import sys.io.File;

using StringTools;

enum FormatType {
	ALPM;
	OTHER;
}

class FormatUtil {
	public static function detectFormat(file:String):FormatType {
		return OTHER;
	}

	public static function getInfo(file:String, format:FormatType):Int {
		switch (format) {
			case ALPM:
				var decomp = Sys.command('tar -xf --zstd $file -C /tmp/globalpkg/$file');
				if (decomp > 0) {
					return 1;
				}
				final pkginfo = File.getContent('/tmp/globalpkg/$file/.PKGINFO');
				for (line in pkginfo.split('\n')) {
					if (line.startsWith("pkgname")) {
						PkgInfo.name = line.substring(10);
					}
					if (line.startsWith("pkgver")) {
						PkgInfo.version = line.substring(9);
					}
				}
			case OTHER:
				PkgInfo.name = "Unknown";
				PkgInfo.version = "Unknown";
		}
		return 0;
	}
}
