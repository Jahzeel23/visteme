import 'package:flutter/material.dart';

class PasswordVerifyInput extends StatelessWidget {
  final String verifyPassword;
  final Function(String) onPasswordChange;
  String password;
  PasswordVerifyInput({
    Key? key,
    required this.onPasswordChange,
    required this.verifyPassword,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ThemeData().colorScheme.copyWith(
                  primary: Colors.black87,
                ),
          ),
          child: TextFormField(
            onChanged: (value) {
              onPasswordChange(value);
            },
            validator: (value) {
              if (value!.isEmpty) {
                return 'Ingresa tu contraseña';
              } else {
                if (value != password) {
                  return 'La contraseña no coincide';
                }
              }
              return null;
            },
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock_outlined),
              hintText: "Ingrese su contraseña",
              labelText: "Repetir contraseña",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ));
  }
}
