import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:visteme/presentation/bloc/auth%20cubit/auth_cubit.dart';
import 'package:visteme/presentation/pages/home/my_home.dart';

class Join extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String hotmail;
  final String password;
  FirebaseAuth auth = FirebaseAuth.instance;
  SnackBar _toast(String msj) {
    return SnackBar(
      content: Text(msj),
    );
  }

  Join({
    Key? key,
    required this.formKey,
    required this.hotmail,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*final User? usuario = FirebaseAuth.instance.currentUser;*/
    return BlocBuilder<AuthCubit, AuthState>(builder: (_, state) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.indigo,
          ),
          onPressed: () async {},
          child: const Text("Iniciar Sesión"));
    });
  }

  Future<void> iniciarSesion(BuildContext context) async {
    // ignore: unused_local_variable
    User usuario;
    try {
      usuario = (await auth.signInWithEmailAndPassword(
              email: hotmail.trim(), password: password.trim()))
          .user!;
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHome()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context)
            .showSnackBar(_toast('Contraseña incorrecta.'));
      } else if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context)
            .showSnackBar(_toast('Correo incorrecto.'));
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
