import 'package:flutter/material.dart';

class AppFormField extends StatelessWidget {
  final String nombre;
  final String label;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const AppFormField(
    this.nombre,
    this.label, {
    super.key,
    this.icon,
    this.validator,
    this.obscureText = false,
    required this.formData,
  });

  final Map<String, String> formData;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        formData[nombre] = value;
      },
      obscureText: obscureText,
      validator: validator,

      // los constantes son porque no se modicada la decoracion
      // en la ejecucion
      //En la decoracion solo  se envia un  Icon data
      decoration: InputDecoration(icon: Icon(icon), hintText: label),
    );
  }
}
