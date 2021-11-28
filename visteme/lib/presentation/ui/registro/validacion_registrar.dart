import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visteme/presentation/bloc/auth_cubit.dart';
import 'package:visteme/presentation/ui/login/validacion.dart';
import 'package:visteme/presentation/ui/registro/join_button.dart';
import 'package:visteme/presentation/ui/registro/mail_input.dart';
import 'package:visteme/presentation/ui/registro/password_input.dart';
import 'package:visteme/presentation/ui/registro/verify_password_input.dart';

class ValidacionRegistrar extends StatefulWidget {
  ValidacionRegistrar({Key? key}) : super(key: key);

  @override
  _ValidacionRegistrarState createState() => _ValidacionRegistrarState();
}

class _ValidacionRegistrarState extends State<ValidacionRegistrar> {
  String hotmail = "";
  String password = "";
  String verifyPassword = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    var maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (_, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 60.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    'Boutique \n Visteme',
                    style: TextStyle(
                      fontFamily: 'Itim',
                      color: Colors.pink,
                      fontSize: 50.0,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(),
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundColor: Colors.grey,
                    backgroundImage:
                        AssetImage('assets/images/logovisteme.jpg'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MailInput(
                    hotmail: hotmail,
                    onHotmailChange: (String val) => setState(() {
                      hotmail = val;
                    }),
                  ),
                  const Divider(
                    height: 20,
                    color: Colors.black,
                  ),
                  PasswordInput(
                    password: password,
                    onPasswordChange: (String val) => setState(() {
                      password = val;
                    }),
                  ),
                  const Divider(
                    height: 20,
                    color: Colors.black,
                  ),
                  PasswordVerifyInput(
                    verifyPassword: verifyPassword,
                    onPasswordChange: (String val) => setState(() {
                      verifyPassword = val;
                    }),
                    password: password,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        context
                            .read<AuthCubit>()
                            .createUserWithEmailAndPassword(
                              hotmail,
                              password,
                            );
                      }
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Validacion()));
                      },
                      child: const Text("Inicio de sesión"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
