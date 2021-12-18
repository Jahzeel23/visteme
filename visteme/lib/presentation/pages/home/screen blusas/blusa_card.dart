import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:visteme/data/models/blusa_model.dart';
import 'package:visteme/presentation/bloc/cart/cart_bloc.dart';
import 'package:visteme/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:visteme/presentation/pages/home/screen%20blusas/blusa_screen.dart';

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
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlusaScreen(
                blusa: blusa,
              ),
            ));
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
                child: Row(children: [
                  Column(
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
                ]),
              ),
            ),
          ),
          Positioned(
            left: 0,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: Text('Added to your Cart!'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    context.read<CartBloc>().add(
                          CartProductAdded(blusa),
                        );
                  },
                ),
                additionalButtons
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          const snackBar = SnackBar(
                            content: Text('Se ha eliminado de favoritos.'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          context
                              .read<WishlistBloc>()
                              .add(WishlistProductRemoved(blusa));
                        },
                      )
                    : const SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
