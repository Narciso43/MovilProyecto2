import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterProvider extends ChangeNotifier {
  RegisterProvider() {
    print("INCIANDO  rEGISTRO PROVIDER ...");
  }
  //funcion para  registrarUsuari
  Future<bool> registrarUsuario(Map<String, String> formData) async {
    var url = Uri.parse(
        'https://console.firebase.google.com/u/0/project/proyecto-movil-uacm/settings/general?key=AIzaSyB9SaA_5Lz3BVmN2V1_dQkMAb-h6Gh4kHw');
    //El llamado a  metodo que se creo en  Postman

    var reponse = await http.post(url, body: jsonEncode(formData));

    if (reponse.statusCode == 200) {
      return true;
    }
    return false;
  }
}
