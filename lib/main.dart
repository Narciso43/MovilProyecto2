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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preferences = Preferences();
  await preferences.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  final preferences = Preferences();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OboardingProvider()),
        //Revisar lo de os provider
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SISTEMAS DE ANALISIS',
        theme: CustomTheme.theme,
        //initialRoute: preferences.initialPage,
        initialRoute: HomePage.routeName,
        routes: {
          LoginPage.routeName: (_) => LoginPage(),
          RegisterPage.routeName: (_) => RegisterPage(),
          OnboardingPage.routeName: (_) => OnboardingPage(),
          HomePage.routeName: (_) => HomePage(),
          OnboardingPage.routeName: (_) => OnboardingPage(),
        },
      ),
    );
  }
}
