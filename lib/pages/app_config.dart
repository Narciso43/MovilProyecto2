import 'package:flutter/material.dart';
import 'package:js_onboarding/pages/home_page.dart';
import 'package:js_onboarding/pages/login_page.dart';
import 'package:js_onboarding/pages/onboarding_page.dart';
import 'package:js_onboarding/providers/onboarding_provider.dart';
import 'package:js_onboarding/providers/providers.dart';
import 'package:js_onboarding/providers/register_provider.dart';
import 'package:js_onboarding/utils/preferences.dart';
import 'package:js_onboarding/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

class AppConfig {
  static String initalRoute = 'LoginPage';
  static routes() {
    return {
      LoginPage.routeName: (_) => LoginPage(),
      RegisterPage.routeName: (_) => RegisterPage(),
      OnboardingPage.routeName: (_) => OnboardingPage(),
      HomePage.routeName: (_) => HomePage(),
      OnboardingPage.routeName: (_) => OnboardingPage(),
    };
  }
}
