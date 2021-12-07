import 'package:flutter/material.dart';
import 'package:visteme/data/models/blusa_model.dart';

class BlusaCard extends StatelessWidget {
  final BlusaModel blusa;
  final double widthFactor;
  final bool additionalButtons;

  const BlusaCard({
    Key? key,
    required this.blusa,
    this.widthFactor = 2.25,
    this.additionalButtons = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;

    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product',
          arguments: blusa,
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: widthValue,
            height: 200,
            child: Image.network(
              blusa.image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 140,
            left: 1,
            child: Container(
              width: widthValue - 2,
              height: 60,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(70),
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 1,
            child: Container(
              width: widthValue - 2,
              height: 60,
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      blusa.descripcion,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "AmaticSC"),
                    ),
                    Text(
                      '\$${blusa.precio}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.lightGreenAccent.shade100,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Itim",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
