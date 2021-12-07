import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visteme/presentation/bloc/blouse%20cubit/bloc/blusa_bloc.dart';
import 'package:visteme/presentation/pages/home/screen%20blusas/blusas_carousel.dart';

class BlusaInicio extends StatelessWidget {
  const BlusaInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlusaInicio(),
    );
  }
}

class BlusaInicioo extends StatefulWidget {
  BlusaInicioo({Key? key}) : super(key: key);

  @override
  _BlusaIniciooState createState() => _BlusaIniciooState();
}

class _BlusaIniciooState extends State<BlusaInicioo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<BlusaBloc, BlusaState>(
        builder: (context, state) {
          if (state is BlusaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BlusaLoaded) {
            return BlusaCarousel(
              blusas: state.blusas.toList(),
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
