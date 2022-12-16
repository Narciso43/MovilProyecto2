import 'package:flutter/material.dart';
import 'package:js_onboarding/pages/app_config.dart';
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
//import 'firebase_options.dart';

//void main() async {
//WidgetsFlutterBinding.ensureInitialized();
//final preferences = Preferences();
//await preferences.initialize();
//runApp(MyApp());

//}

//Esta clase se cre para los estados de la aplicacion
void main() => (AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(Object context) {
    return MultiProvider(child: MyApp(), providers: [
      ChangeNotifierProvider(create: (_) => OboardingProvider()),
      ChangeNotifierProvider(create: (_) => LoginProvider()),
      ChangeNotifierProvider(create: (_) => RegisterProvider()),
      //ChangeNotifierProvider(create: (_) => HomePage()),
    ]);
  }
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
        //initialRoute: OnboardingPage.routeName,
        initialRoute: AppConfig.initalRoute,

        //Se hace el llamado al archivo de  rutas.
        routes: AppConfig.routes(),
      ),
    );
  }
}
