import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visteme/app.dart';
import 'package:visteme/data/repositories/blusa/blusa_repository.dart';
import 'package:visteme/data/repositories/category/category_repository.dart';
import 'package:visteme/data/repositories/checkout/checkout_repository.dart';
import 'package:visteme/data/repositories/implementations/auth_repository.dart';
import 'package:visteme/presentation/bloc/auth%20cubit/auth_cubit.dart';
import 'package:visteme/presentation/bloc/blouse%20cubit/bloc/blusa_bloc.dart';
import 'package:visteme/presentation/bloc/cart/cart_bloc.dart';
import 'package:visteme/presentation/bloc/category%20bloc/category%20bloc/category_bloc.dart';
import 'package:visteme/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:visteme/presentation/bloc/wishlist/wishlist_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final authCubit = AuthCubit(AuthRepository());
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => authCubit..init(),
        ),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => BlusaBloc(
            blusaRepository: BlusaRepository(),
          )..add(LoadBlusas()),
        ),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(WishlistStarted())),
      ],
      child: MyApp.create(),
    ),
  );
}
