import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visteme/domain/entities/user.dart';
import 'package:visteme/domain/repositories/implementations/my_user_repository.dart';
import 'package:visteme/presentation/bloc/auth_cubit.dart';
import 'package:visteme/presentation/bloc/my_user_cubit.dart';

class DesignMyDraw extends StatelessWidget {
  const DesignMyDraw({Key? key}) : super(key: key);
  static Widget create(BuildContext context) => const DesignMyDraw();

  @override
  Widget build(BuildContext context) {
    return const MyDraw();
  }
}

class MyDraw extends StatefulWidget {
  const MyDraw({Key? key}) : super(key: key);

  @override
  _MyDrawState createState() => _MyDrawState();
}

class _MyDrawState extends State<MyDraw> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyUserCubit, MyUserState>(
      builder: (_, state) {
        final datos = (state as MyUserReadyState).user;
        return BlocBuilder<AuthCubit, AuthState>(builder: (_, state) {
          final datos2 = (state as AuthSignedIn).user;
          final drawerHeader = UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple.shade200),
            accountName: Text('${datos.name}' '${datos.lastName}'),
            accountEmail: Text(datos2.email),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: FlutterLogo(size: 42.0),
            ),
            otherAccountsPictures: const <Widget>[
              CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Text('A'),
              ),
              CircleAvatar(
                backgroundColor: Colors.red,
                child: Text('B'),
              )
            ],
          );
          return Container(
            color: Colors.grey.shade300,
            child: ListView(
              children: <Widget>[
                drawerHeader,
                ListTile(
                  title: const Text('To page 1'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('To page 2'),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('other drawer item'),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
