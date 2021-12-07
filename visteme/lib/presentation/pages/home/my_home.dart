import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visteme/data/repositories/implementations/my_user_repository.dart';
import 'package:visteme/presentation/bloc/blouse%20cubit/bloc/blusa_bloc.dart';
import 'package:visteme/presentation/bloc/category%20cubit/bloc/category_bloc.dart';
import 'package:visteme/presentation/bloc/user%20cubit/my_user_cubit.dart';
import 'package:visteme/presentation/pages/home/profile%20data/design_my_draw.dart';
import 'package:visteme/presentation/pages/home/screen%20blusas/blusas_carousel.dart';
import 'package:visteme/presentation/pages/home/widgets/hero_carousel_card.dart';

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);
  static Widget create(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MyUserCubit(MyUserRepository())..getMyUser(),
        ),
      ],
      child: const MyHome(),
    );
  }

  static const String routeName = '/';
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => MyHome(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Colors.pink.shade50,
          drawer: const SizedBox(width: 300, child: DesignMyDraw()),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black54,
            title: const Text('Catálogo',
                style: TextStyle(
                    fontFamily: 'Courgette',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.limeAccent)),
          ),
          body: _MyUserSection()),
    );
  }
}

class _MyUserSection extends StatefulWidget {
  @override
  _MyUserSectionState createState() => _MyUserSectionState();
}

class _MyUserSectionState extends State<_MyUserSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.6,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),
                  items: state.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                );
              } else {
                return Text('Ocurrió un error.');
              }
            },
          ),
          BlocBuilder<BlusaBloc, BlusaState>(
            builder: (context, state) {
              if (state is BlusaLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is BlusaLoaded) {
                return BlusaCarousel(
                  blusas: state.blusas.toList(),
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
    );
  }
}
