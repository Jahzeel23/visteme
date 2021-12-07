import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  final String password;
  final Function(String) onPasswordChange;
  PasswordInput({
    Key? key,
    required this.password,
    required this.onPasswordChange,
  }) : super(key: key);
  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 30,
      validator: (value) {
        if (value!.length < 6) {
          return 'Deben ser más de 6 dígitos';
        }
        return null;
      },
      onChanged: (value) {
        widget.onPasswordChange(value);
      },
      obscureText: isObscure,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isObscure = !isObscure;
            });
          },
          icon: Icon(
            isObscure ? Icons.visibility_outlined : Icons.visibility_off,
          ),
        ),
        prefixIcon: const Icon(Icons.lock_outlined),
        hintText: "Ingrese una contraseña",
        labelText: "Contraseña",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
