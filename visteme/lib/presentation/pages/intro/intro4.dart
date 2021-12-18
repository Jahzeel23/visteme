import 'package:flutter/material.dart';
import 'package:visteme/presentation/pages/login/validacion.dart';

class Intro4 extends StatelessWidget {
  const Intro4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              SizedBox(
                  height: 360,
                  width: 360,
                  child: Image.asset('assets/images/logovisteme.jpg')),
              Text('Bienvenidos a la aplicación de la botique "Visteme". ')
            ],
          ),
        ),
        Positioned(
            right: 0,
            top: 0,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black54),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Validacion())),
                child: const Text('Saltar')))
      ],
    );
  }
}
