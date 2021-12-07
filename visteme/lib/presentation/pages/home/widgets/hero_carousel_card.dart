import 'package:flutter/material.dart';
import 'package:visteme/data/models/blusa_model.dart';
import 'package:visteme/data/models/category_model.dart';

class HeroCarouselCard extends StatelessWidget {
  final Category? category;
  final BlusaModel? blusa;

  const HeroCarouselCard({
    Key? key,
    this.category,
    this.blusa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (this.blusa == null) {
          Navigator.pushNamed(
            context,
            '/catalog',
            arguments: category,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 5,
          right: 5,
          top: 20.0,
          bottom: 10.0,
        ),
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 150,
              child: Image.network(
                blusa == null ? category!.image : blusa!.image,
                width: 1000.0,
              ),
            ),
            this.blusa == null
                ? Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        blusa == null ? category!.name : blusa!.descripcion,
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Kalam",
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
