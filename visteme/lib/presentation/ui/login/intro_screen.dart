import 'dart:ffi';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/src/provider.dart';
import 'package:visteme/presentation/bloc/auth_cubit.dart';
import 'package:visteme/presentation/ui/login/validacion.dart';

class IntroScreen extends StatelessWidget {
  static Widget create(BuildContext context) => IntroScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _IntroPage(),
    );
  }
}

class _IntroPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isSigningIn = context.watch<AuthCubit>().state is AuthSigningIn;
    PageController controller = PageController();
    return SizedBox(
      width: double.infinity,
      child: AbsorbPointer(
        absorbing: isSigningIn,
        child: PageIndicatorContainer(
          shape: IndicatorShape.circle(size: 10),
          indicatorSelectorColor: Colors.blue,
          indicatorColor: Colors.black87,
          length: 4,
          child: PageView(
            physics: const BouncingScrollPhysics(),
            children: [
              Stack(
                children: [
                  Positioned(
                    right: 10,
                    top: 25,
                    child: TextButton(
                      onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Validacion())),
                      child: const Text('Saltar'),
                    ),
                  ),
                  const Positioned(
                    left: 5,
                    top: 2,
                    child: _DescriptionPage(
                        text: 'Página 1',
                        imagePath: 'assets/images/intro1.jpg'),
                  ),
                ],
              ),
              _DescriptionPage(
                  text: 'Página 2', imagePath: 'assets/images/logovisteme.jpg'),
              _DescriptionPage(
                  text: 'Página 3', imagePath: 'assets/images/logovisteme.jpg'),
              _LoginPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DescriptionPage extends StatelessWidget {
  final String text;
  final String imagePath;

  const _DescriptionPage(
      {Key? key, required this.text, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        imagePath,
        width: 250,
        height: 400,
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  static Widget create(BuildContext context) => _LoginPage();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const Validacion()));
      },
      child: const Text('Iniciar Sesión'),
    );
  }
}
