import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visteme/presentation/bloc/auth%20cubit/auth_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:visteme/presentation/pages/registro/validacion_registrar.dart';

class Validacion extends StatefulWidget {
  const Validacion({Key? key}) : super(key: key);

  @override
  _ValidacionState createState() => _ValidacionState();
}

class _ValidacionState extends State<Validacion> {
  bool isObscure = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 60.0,
        ),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (_, state) {
            return Form(
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
                  Card(
                    child: Image.asset(
                      'assets/images/logovisteme.jpg',
                      height: 200,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    maxLength: 30,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(FontAwesomeIcons.envelope),
                      hintText: "Ingrese un hotmail",
                      labelText: "Hotmail",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20,
                    color: Colors.black,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    maxLength: 30,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Deben ser más de 6 dígitos';
                      }
                      return null;
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
                          isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off,
                        ),
                      ),
                      prefixIcon: const Icon(Icons.lock_outlined),
                      hintText: "Ingrese una contraseña",
                      labelText: "Contraseña",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signInWithEmailAndPassword(
                                _emailController.text,
                                _passwordController.text,
                              );
                        }
                      },
                      child: Text('Iniciar Sesión')),
                  const Divider(
                    color: Colors.black,
                    height: 20,
                  ),
                  const Text('Otros medios para iniciar sesión: ',
                      style: TextStyle(
                          fontFamily: 'AmaticSC',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () =>
                              context.read<AuthCubit>().signInWithGoogle(),
                          icon: const Icon(
                            FontAwesomeIcons.google,
                            color: Colors.red,
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('o'),
                      const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                          onPressed: () =>
                              context.read<AuthCubit>().signInWithFacebook(),
                          icon: const Icon(
                            FontAwesomeIcons.facebook,
                            color: Colors.blue,
                            size: 33,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<AuthCubit>().signInAnonymously(),
                    child: const Text('Inicia Sesión como invitado.'),
                    style: ElevatedButton.styleFrom(onPrimary: Colors.white70),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('No estás registrado?'),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ValidacionRegistrar(),
                                ));
                          },
                          child: const Text(
                            'Registrate!',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
