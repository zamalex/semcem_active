var this_year = DateTime.now().year.toString();

class AppConfig {
  static String copyright_text =
      "@ ActiveItZone " + this_year; //this shows in the splash screen
  static String app_name = "semCem"; //this shows in the splash screen

  static String purchase_code =
      "35d3a6a3-8c42-4364-a8bb-c24de991b501"; //enter your purchase code for the app from codecanyon
  static String system_key =
      r"$2y$10$osxEiQrrq4rD24Iz5g/dcuxD3X0AQgN6VtJD6A3Kg8j13jnZ77eze"; //enter your purchase code for the app from codecanyon

  //Default language config
  static String default_language = "en";
  static String mobile_app_code = "en";
  static bool app_language_rtl = false;

  //configure this
  static const bool HTTPS = true;

  static const DOMAIN_PATH = "dev.semcem.com"; //localhost

  //do not configure these below
  static const String API_ENDPATH = "api/v2";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "${PROTOCOL}${DOMAIN_PATH}";
  static const String BASE_URL = "${RAW_BASE_URL}/${API_ENDPATH}";

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
