import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class JoinButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  FirebaseAuth auth = FirebaseAuth.instance;
  final String hotmail;
  final String password;
  SnackBar _toast(String msj) {
    return SnackBar(
      content: Text(msj),
    );
  }

  JoinButton({
    Key? key,
    required this.formKey,
    required this.hotmail,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.indigo,
          ),
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }
            print('todo ok');
            print('el correo es: ${hotmail}');
            print('el password es: ${password}');
            if (formKey.currentState!.validate()) {
              registroNuevoUsuario(context);
            }
          },
          child: const Text("Crear cuenta")),
    );
  }

  Future<void> registroNuevoUsuario(BuildContext context) async {
    User usuario;
    try {
      usuario = (await auth.createUserWithEmailAndPassword(
              email: hotmail.trim(), password: password.trim()))
          .user!;
      ScaffoldMessenger.of(context)
          .showSnackBar(_toast('Su registro se ha realizado con éxito.'));
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        ScaffoldMessenger.of(context)
            .showSnackBar(_toast('Contraseña demasidado débil.'));
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context)
            .showSnackBar(_toast('Ese usuario ya existe.'));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(_toast('Lo sentimos, hubo un error.'));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(_toast('Lo sentimos, hubo un error.'));
    }
  }
}
