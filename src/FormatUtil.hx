enum FormatType {
	ALPM;
	OTHER;
}

class FormatUtil {
	public static function detectFormat(file:String):FormatType {
		return OTHER;
	}
}
