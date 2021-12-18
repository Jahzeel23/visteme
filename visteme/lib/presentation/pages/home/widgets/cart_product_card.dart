import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visteme/data/models/blusa_model.dart';
import 'package:visteme/presentation/bloc/cart/cart_bloc.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  final BlusaModel product;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            product.image,
            fit: BoxFit.cover,
            width: 100,
            height: 80,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.descripcion,
                ),
                Text(
                  '\$${product.precio}',
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state is CartLoading) {
                return const CircularProgressIndicator();
              }
              if (state is CartLoaded) {
                return Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle),
                      onPressed: () {
                        context.read<CartBloc>().add(
                              CartProductRemoved(product),
                            );
                      },
                    ),
                    Text(
                      '$quantity',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle),
                      onPressed: () {
                        context.read<CartBloc>().add(
                              CartProductAdded(product),
                            );
                      },
                    ),
                  ],
                );
              }
              return const Text('Something went wrong!');
            },
          ),
        ],
      ),
    );
  }
}
