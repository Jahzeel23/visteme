import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visteme/data/models/blusa_model.dart';
import 'package:visteme/data/models/category_model.dart';
import 'package:visteme/presentation/bloc/blouse%20cubit/bloc/blusa_bloc.dart';
import 'package:visteme/presentation/pages/home/screen%20blusas/blusa_card.dart';
import 'package:visteme/presentation/pages/home/shopping%20cart/custom_appbar.dart';
import 'package:visteme/presentation/pages/home/shopping%20cart/custom_navbar.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CatalogScreen(category: category),
    );
  }

  final Category? category;

  const CatalogScreen({
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: category!.name),
      bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<BlusaBloc, BlusaState>(
        builder: (context, state) {
          if (state is BlusaLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BlusaLoaded) {
            final List<BlusaModel> blusas = state.blusas
                .where((ropa) => ropa.category == category!.name)
                .toList();
            return GridView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
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
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }
}
