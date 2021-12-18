import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visteme/data/models/blusa_model.dart';
import 'package:visteme/presentation/bloc/cart/cart_bloc.dart';
import 'package:visteme/presentation/bloc/wishlist/wishlist_bloc.dart';
import 'package:visteme/presentation/pages/home/widgets/cart_screen.dart';
import 'package:visteme/presentation/pages/home/widgets/wishlist_screen.dart';

class BlusaScreen extends StatelessWidget {
  Widget create(BuildContext context) => BlusaScreen(blusa: blusa);
  final BlusaModel blusa;
  final bool automaticallyImplyLeading;
  // ignore: use_key_in_widget_constructors
  const BlusaScreen({
    required this.blusa,
    this.automaticallyImplyLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return const CircularProgressIndicator();
          }
          if (state is WishlistLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 35,
                  ),
                  onPressed: () {
                    const snackBar =
                        SnackBar(content: Text('Agregado a favoritos.'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    context
                        .read<WishlistBloc>()
                        .add(WishlistProductAdded(blusa));
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    if (state is CartLoading) {
                      return const CircularProgressIndicator();
                    }
                    if (state is CartLoaded) {
                      return IconButton(
                        onPressed: () {
                          context.read<CartBloc>().add(CartProductAdded(blusa));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(),
                              ));
                        },
                        icon: const Icon(
                          Icons.shopping_bag,
                          color: Colors.brown,
                          size: 40,
                        ),
                      );
                    }
                    return const Text('Ha ocurrido un error.');
                  },
                )
              ],
            );
          }
          return const Text('Ha ocurrido un error.');
        },
      ),
      appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WishlistScreen(),
                    ));
              },
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: automaticallyImplyLeading,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            blusa.descripcion,
            style: const TextStyle(
                fontFamily: 'Itim', fontSize: 22, color: Colors.black),
          )),
      body: ListView(
        children: [
          Image.network(blusa.image),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      margin: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '-Color: ${blusa.color}',
                            style: const TextStyle(
                              fontFamily: 'Itim',
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '-Cantidad: ${blusa.cantidad}',
                            style: const TextStyle(
                              fontFamily: 'Itim',
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '-Talla: ${blusa.talla}',
                            style: const TextStyle(
                              fontFamily: 'Itim',
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '-Marca: ${blusa.marca}',
                            style: const TextStyle(
                              fontFamily: 'Itim',
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            '-Precio: \$${blusa.precio}',
                            style: const TextStyle(
                              fontFamily: 'Itim',
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  collapsedIconColor: Colors.red,
                  iconColor: Colors.red.shade200,
                  initiallyExpanded: false,
                  title: const Text(
                    "Más información",
                    style: TextStyle(
                      fontFamily: 'Itim',
                      fontSize: 22,
                      color: Colors.red,
                    ),
                  ),
                  children: const <Widget>[
                    ListTile(
                      title: Text(
                        'Detalles',
                        style: TextStyle(
                          fontFamily: 'Itim',
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
