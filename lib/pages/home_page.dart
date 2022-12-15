import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/Analsis.png'),
            Center(
              child: Column(
                children: [
                  Text(
                    'Bienvenido a la App CafMex',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    'NUESTRO  PAÍS  PUDIERA SER CONSIDERADO COMO UNO DE LOS RESEVARIOS MUNIALES DE CAFÉ DE ALTA CALIDAD.',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            MaterialButton(
              elevation: 12.0,
              minWidth: 160.0,
              height: 40.0,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text(
                'Empezar',
                style: TextStyle(color: Colors.blueGrey, fontSize: 30),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
