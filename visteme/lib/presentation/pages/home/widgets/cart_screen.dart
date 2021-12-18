import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visteme/presentation/bloc/cart/cart_bloc.dart';
import 'package:visteme/presentation/pages/home/my_home.dart';
import 'package:visteme/presentation/pages/home/shopping%20cart/custom_appbar.dart';
import 'package:visteme/presentation/pages/home/shopping%20cart/custom_navbar.dart';
import 'package:visteme/presentation/pages/home/widgets/cart_product_card.dart';
import 'package:visteme/presentation/pages/home/widgets/checkout_screen.dart';
import 'package:visteme/presentation/pages/home/widgets/order_summary.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Cart'),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CheckoutScreen(),
              ));
        },
        child: const Text(
          'Ingresa tus datos para el envío.',
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.cart.freeDeliveryString,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MyHome(),
                              ));
                        },
                        icon: const Icon(
                          Icons.add_box_outlined,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                        itemCount: state.cart
                            .productQuantity(state.cart.blusas)
                            .keys
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartProductCard(
                            product: state.cart
                                .productQuantity(state.cart.blusas)
                                .keys
                                .elementAt(index),
                            quantity: state.cart
                                .productQuantity(state.cart.blusas)
                                .values
                                .elementAt(index),
                          );
                        }),
                  ),
                  const OrderSummary(),
                ],
              ),
            );
          }
          return const Text('Something went wrong');
        },
      ),
    );
  }
}
