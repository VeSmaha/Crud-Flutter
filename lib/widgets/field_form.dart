import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  String label;
  bool isPassword;
  TextEditingController controller;
  bool isEmail;
  FieldForm({
    required this.label,
    required this.isPassword,
    required this.controller,
    required this.isEmail,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        // fillColor: Colors.white,
        labelText: label,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo obrigatório';
        }
        if (isEmail && !value.contains('@')) {
          return 'E-mail inválido'; // Retornamos uma mensagem de erro para o TextFormField
        }
        if (value.length < 5) {
          return 'Campo inválido'; // Retornamos uma mensagem de erro para o TextFormField
        }
        return null; // Retornamos null para indicar que a validação foi bem-sucedida
      },
    );
  }
}
