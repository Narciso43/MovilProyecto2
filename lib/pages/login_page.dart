import 'package:flutter/material.dart';
import 'package:js_onboarding/pages/register_page.dart';
import 'package:js_onboarding/providers/login_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

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
  //Se declara loginProvider como variable de clase
  LoginProvider loginProvider = LoginProvider();
  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context);

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
                        // Se extrajo en titulo  en un nuevo  winget
                        // Se le  agrega el const ya que no cambia
                        //durante la ejecucion.
                        const AppTitle('INICIAR  SECCION'),
                        const SizedBox(height: 20),
                        AppFormField(
                          'correo',
                          'Correo electronico',
                          formData: formData,
                          validator: (value) {
                            if (value!.length < 3) {
                              return "Correo electronico no valido";
                            }
                          },
                        ),
                        AppFormField(
                          'Contraseña',
                          'Contraseña',
                          obscureText: true,
                          formData: formData,
                          validator: (value) {
                            if (value!.length < 3) {
                              return "Contraseña no valida";
                            }
                          },
                        ),

                        // Por medio de funciones  anonimas.
                        ElevatedButton(
                            onPressed: formLogin,
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
                child: const Text(
                  'Registra nueva cuenta',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                )),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }

  formLogin() async {
    //Esto se hace para que la valion se  haga
    //garantizando que no va a  fallar
    if (formkey.currentState!.validate()) {
      bool respuesta = await loginProvider.loginUsuario(formData);
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
                    Navigator.pushReplacementNamed(context, 'HomePage');
                  },
                  child: const Text('Ok'),
                )
              ], title: Text('USUARIO AUTENTICADO'));
            });
      }
    } else {
      print('NO VALIDADO');
    }
  }
}
