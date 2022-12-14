import 'package:flutter/material.dart';
import 'package:js_onboarding/providers/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  static final String routeName = '/LoginPage';
  const RegisterPage();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formkey = GlobalKey<FormState>();
  Map<String, String> FormData = {
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
                    key: formkey,
                    child: Column(
                      children: [
                        Text('REGISTRO DE USUARIO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            )),
                        const SizedBox(height: 20),
                        TextFormField(
                          onChanged: (value) {
                            FormData['nombre'] = value;
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
                            FormData['Apaterno'] = value;
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
                            FormData['Amaterno'] = value;
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
                            FormData['estado'] = value;
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
                            FormData['correo'] = value;
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
                            FormData['constraseña'] = value;
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
                            onPressed: () async {
                              if (formkey.currentState!.validate()) {
                                bool respuesta = await registerProvider
                                    .registrarUsuario(FormData);
                                if (respuesta) {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const AlertDialog(
                                            title: Text('USUARIO RESGITRADO'));
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
