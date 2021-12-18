import 'package:flutter/material.dart';
import 'package:visteme/data/models/blusa_model.dart';
import 'package:visteme/presentation/pages/home/screen%20blusas/blusa_card.dart';

class BlusaCarousel extends StatelessWidget {
  final List<BlusaModel> blusas;

  const BlusaCarousel({
    Key? key,
    required this.blusas,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 430,
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.8),
          itemCount: blusas.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlusaCard(
                blusa: blusas[index],
                widthFactor: 2.2,
              ),
            ));
          },
        ),
      ),
    );
  }
}
