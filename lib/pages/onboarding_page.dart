import 'package:flutter/material.dart';
import 'package:js_onboarding/pages/home_page.dart';
import 'package:js_onboarding/pages/onboarding_step.dart';
import 'package:js_onboarding/providers/onboarding_provider.dart';
import 'package:js_onboarding/utils/preferences.dart';
import 'package:js_onboarding/utils/utils.dart';
import 'package:js_onboarding/widgets/next_button.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatelessWidget {
  static final String routeName = '/';

  get currentPage => null;

  @override
  Widget build(BuildContext context) {
    final preferences = Preferences();
    var onboardingProvider = Provider.of<OnboardingPage>(context);
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          _OnboardingPages(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _Dots(),
          ),
          Positioned(
            right: 0,
            bottom: screenHeight * 0.05,
            child: NextButton(
              onPressed: () {
                if (onboardingProvider.currentPage == 2) {
                  //Para las preferencias
                  //  preferences.initialPage = HomePage.routeName;
                  Navigator.of(context)
                      .pushReplacementNamed(HomePage.routeName);
                }
                // onboardingProvider.currentPage =
                //   onboardingProvider.currentPage + 1;
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPages extends StatelessWidget {
  const _OnboardingPages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onboardingProvider = Provider.of<OboardingProvider>(context);
    return PageView(
      // Esta linea de codigo sirve para  No poder  pasar con el dedo el scrool
      //physics: NeverScrollableScrollPhysics(),
      controller: onboardingProvider.pageController,
      onPageChanged: (int index) {
        onboardingProvider.currentPage = index;
      },
      children: [
        OnboardingStep(
          image: 'assets/images/mexico.png',
          title: 'ESTADOS CAFETALEROS',
          subtitle:
              'Veracruz, Chiapas, Puebla, Oaxaca y Colima son los estados de la república en donde se cultiva el grueso del café mexicano. ',
          color: Colors.red,
        ),
        OnboardingStep(
          image: 'assets/images/planta.png',
          title: 'PLANTAS DE CAFÉ',
          subtitle:
              'El vocablo café se deriva del árabe “kahwah” (cauá), llegando a nosotros a través del vocablo turco “kahweh” (cavé), con distintas acepciones, según los idiomas, pero conservando su raíz.',
          color: Colors.blue,
        ),
        OnboardingStep(
          image: 'assets/images/cultivos.png',
          title: 'CULTIVOS CAFETALEROS',
          subtitle:
              'La floración del café arábigo es marcadamente estacional, efectuándose generalmente sólo con la presencia de tiempo húmedo, pero la periodicidad puede ser mucho menos distinta donde las condiciones climáticas son relativamente estables en todo el año.',
          color: Colors.yellow,
        ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var onboardingProvider = Provider.of<OboardingProvider>(context);
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(bottom: screenHeight * 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(active: onboardingProvider.currentPag == 0),
          SizedBox(width: 10.0),
          _Dot(active: onboardingProvider.currentPag == 1),
          SizedBox(width: 10.0),
          _Dot(active: onboardingProvider.currentPag == 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.active,
  }) : super(key: key);

  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: active
            ? CustomTheme.colorSpanishGray
            : CustomTheme.colorMaastrichtBlue,
        borderRadius: BorderRadius.circular(5.0),
      ),
      width: 10.0,
      height: 10.0,
    );
  }
}
