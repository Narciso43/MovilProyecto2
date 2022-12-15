import 'package:flutter/material.dart';
import 'package:js_onboarding/pages/register_page.dart';
import 'package:js_onboarding/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static final String routeName = '/HomePage';
  const LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();
  //Mapeo de  datos para guardar los datos
  Map<String, String> formData = {
    //'nombre': '',
    //'Apaterno': '',
    //'Amaterno': '',
    //'estado': '',
    'correo': '',
    'contraseña': ''
  };
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.brown[100],
        child: Column(
          children: [
            const SizedBox(height: 43),
            const Icon(
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
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Text('INICIAR SECCION',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            formData['correo'] = value;
                          },
                          validator: (value) {
                            if (value!.length < 3) {
                              return "NOMBRE NO VALIDO";
                            }
                          },

                          // los constantes son porque no se modicada la decoracion
                          // en la ejecucion
                          decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'Correo Electronico'),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            formData['nombre'] = value;
                          },
                          validator: (value) {
                            if (value!.length < 3) {
                              return "NOMBRE NO VALIDO";
                            }
                          },
                          //Se ocutan los caracteres con el atributo
                          //obscureText
                          obscureText: true,
                          // los constantes son porque no se modicada la decoracion
                          // en la ejecucion
                          decoration: const InputDecoration(
                              icon: Icon(Icons.password_rounded),
                              hintText: 'Contraseña'),
                        ),

                        // Por medio de funciones  anonimas.
                        ElevatedButton(
                            onPressed: () async {
                              //Esto se hace para que la valion se  haga
                              //garantizando que no va a  fallar
                              if (formkey.currentState!.validate()) {
                                bool respuesta =
                                    await loginProvider.loginUsuario(formData);
                                if (respuesta) {
                                  //Manda un Mensaje   cuando el usuario esta
                                  //Registrado
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        //AlettDialog manda la alerta
                                        return AlertDialog(actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pushReplacementNamed(
                                                  context, 'HomePage');
                                            },
                                            child: Text('Ok'),
                                          )
                                        ], title: Text('USUARIO AUTENTICADO'));
                                      });
                                }
                              } else {
                                print('NO VALIDADO');
                              }
                            },
                            child: Text(
                              'INGRESAR',
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  //Cuando se presiona  el  botton nos direcciona al registro.
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
