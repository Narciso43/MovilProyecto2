import 'package:flutter/material.dart';
import 'package:js_onboarding/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = '/';
  const LoginPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.brown[100],
        child: Column(
          children: [
            SizedBox(height: 43),
            Icon(
              Icons.supervised_user_circle_outlined,
              size: 120,
              color: Colors.white,
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text('INICIAR SECCION',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.brown,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          )),
                      const SizedBox(height: 20),
                      TextField(
                        // los constantes son porque no se modicada la decoracion
                        // en la ejecucion
                        decoration: const InputDecoration(
                            icon: Icon(Icons.email),
                            hintText: 'Correo Electronico'),
                      ),
                      TextField(
                        //Se ocutan los caracteres
                        obscureText: true,
                        // los constantes son porque no se modicada la decoracion
                        // en la ejecucion
                        decoration: const InputDecoration(
                            icon: Icon(Icons.password_rounded),
                            hintText: 'Contraseña'),
                      ),

                      // Por medio de funciones  anonimas.
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Ingresar',
                          ))
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterPage.routeName);
                },
                child: Text(
                  'Registra nueva cuenta',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
