import 'package:js_onboarding/pages/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = Preferences();

  factory Preferences() {
    return _instance;
  }
  //Contructor oculto

  Preferences._();
  late SharedPreferences prefs;

  Future<void> initialize() async {
    prefs = await SharedPreferences.getInstance();
  }

  get _initialPage {
    return prefs.getString('initialPage') ?? OnboardingPage.routeName;
  }

  set initialPage(String value) {
    prefs.setString('initialPage', value);
  }
}
