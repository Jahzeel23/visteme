// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visteme/presentation/pages/intro/intro.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static Widget create(BuildContext context) => IntroScreen();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smooth Page Indicator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              SizedBox(
                  height: 600,
                  child: PageView(
                    controller: _pageController,
                    children: const [
                      Intro(),
                    ],
                  )),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: SwapEffect(
                  activeDotColor: Colors.pink,
                  dotColor: Colors.grey,
                  dotHeight: 16,
                  dotWidth: 16,
                  type: SwapType.yRotation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
