import 'package:flutter/material.dart';
import 'package:js_onboarding/providers/register_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../widgets/app_title.dart';

class RegisterPage extends StatefulWidget {
  static final String routeName = '/LoginPage';
  const RegisterPage();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formkey = GlobalKey<FormState>();
  //Mapeo de  datos para guardar los datos
  Map<String, String> formData = {
    'nombre': '',
    'Apaterno': '',
    'Amaterno': '',
    'estado': '',
    'correo': '',
    'contraseña': ''
  };
  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);

    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.brown[100],
        child: Column(
          children: [
            SizedBox(height: 43),
            Icon(
              Icons.add_reaction_sharp,
              size: 100,
              color: Colors.white,
            ),
            Expanded(
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Card(
                child: Container(
                  width: double.infinity,
                  child: Form(
                    //Esta llave para la validacion
                    key: formkey,
                    child: Column(
                      children: [
                        const AppTitle('REGISTRAR USUARIO'),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            formData['nombre'] = value;
                          },
                          validator: (value) {
                            if (value!.length < 3) {
                              return "NOMBRE NO VALIDO";
                            }
                          },
                          // los constantes son porque no se modicada la decoracion
                          // en la ejecucion
                          decoration: const InputDecoration(
                              icon: Icon(Icons.account_circle_rounded),
                              hintText: 'NOMBRE'),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            formData['Apaterno'] = value;
                          },
                          validator: (value) {
                            if (value!.length < 3) {
                              return "APELLIDO PATERNO NO VALIDO";
                            }
                            return null;
                          },

                          // los constantes son porque no se modicada la decoracion
                          // en la ejecucion
                          decoration: const InputDecoration(
                              icon: Icon(Icons.account_circle_sharp),
                              hintText: 'APELLIDO PATERNO'),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            formData['Amaterno'] = value;
                          },
                          validator: (value) {
                            if (value!.length < 3) {
                              return "APELLIDO MATERNO NO VALIDO";
                            }

                            return null;
                          },
                          // los constantes son porque no se modicada la decoracion
                          // en la ejecucion
                          decoration: const InputDecoration(
                              icon: Icon(Icons.account_balance_rounded),
                              hintText: 'APELLIDO MATERNO'),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            formData['estado'] = value;
                          },
                          validator: (value) {
                            if (value!.length < 3) {
                              return "ESTADO NO VALIDO";
                            }
                            return null;
                          },
                          // los constantes son porque no se modicada la decoracion
                          // en la ejecucion
                          decoration: const InputDecoration(
                              icon: Icon(Icons.map_outlined),
                              hintText: 'ESTADO'),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            formData['correo'] = value;
                          },
                          validator: (value) {
                            if (value!.length < 10) {
                              return "CORREO NO VALIDO";
                            }
                            return null;
                          },
                          // los constantes son porque no se modicada la decoracion
                          // en la ejecucion
                          decoration: const InputDecoration(
                              icon: Icon(Icons.email),
                              hintText: 'CORREO ELECTRÓNICO'),
                        ),
                        TextFormField(
                          onChanged: (value) {
                            formData['constraseña'] = value;
                          },
                          validator: (value) {
                            if (value!.length < 8) {
                              return "CONTREASEÑA MUY CORTA";
                            }
                            return null;
                          },
                          // los constantes son porque no se modicada la decoracion
                          // en la ejecucion
                          obscureText: true,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.password_rounded),
                              hintText: 'CONTRASEÑA'),
                        ),

                        // Por medio de funciones  anonimas.
                        ElevatedButton(
                            //funcion de la creacion de  datos
                            onPressed: () async {
                              //Esto se hace para que la valion se  haga
                              //garantizando que no va a  fallar
                              if (formkey.currentState!.validate()) {
                                bool respuesta = await registerProvider
                                    .registrarUsuario(formData);
                                if (respuesta) {
                                  //Manda un Mensaje   cuando el usuario esta
                                  //Registrado
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        //AlettDialog manda la alerta
                                        return const AlertDialog(
                                            title: Text('USUARIO REGISTRADO'));
                                      });
                                }
                              } else {
                                print('NO VALIDADO');
                              }
                            },
                            child: const Text('REGISTRAR'))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 43,
            )
          ],
        ),
      ),
    );
  }
}
