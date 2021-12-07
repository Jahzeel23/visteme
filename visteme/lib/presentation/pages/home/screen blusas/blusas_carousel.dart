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
        height: 300,
        child: ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: blusas.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: BlusaCard(blusa: blusas[index]),
            );
          },
        ),
      ),
    );
  }
}
