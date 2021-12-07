import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visteme/domain/entities/user.dart';
import 'package:visteme/presentation/bloc/auth%20cubit/auth_cubit.dart';
import 'package:visteme/presentation/bloc/user%20cubit/my_user_cubit.dart';
import 'package:visteme/presentation/pages/home/profile%20data/guardar_datos.dart';

class DesignMyDraw extends StatelessWidget {
  const DesignMyDraw({Key? key}) : super(key: key);
  static Widget create(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<MyUserCubit>(context),
      child: DesignMyDraw(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyUserCubit, MyUserState>(
      builder: (_, state) {
        if (state is MyUserReadyState) {
          return MyDraw(
            user: state.user,
            pickedImage: state.pickedImage,
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class MyDraw extends StatefulWidget {
  final MyUser? user;
  final File? pickedImage;
  const MyDraw({Key? key, this.pickedImage, this.user}) : super(key: key);

  @override
  _MyDrawState createState() => _MyDrawState();
}

class _MyDrawState extends State<MyDraw> {
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      'assets/images/intro_3.png',
      fit: BoxFit.fill,
    );

    if (widget.pickedImage != null) {
      image = Image.file(
        widget.pickedImage!,
        fit: BoxFit.fill,
      );
    } else if (widget.user?.image != null && widget.user!.image!.isNotEmpty) {
      image = CachedNetworkImage(
        imageUrl: widget.user!.image!,
        progressIndicatorBuilder: (_, __, progress) =>
            CircularProgressIndicator(value: progress.progress),
        errorWidget: (_, __, ___) => const Icon(Icons.error),
        fit: BoxFit.fill,
      );
    }

    return BlocBuilder<MyUserCubit, MyUserState>(
      builder: (_, state) {
        final datos = (state as MyUserReadyState).user;
        return BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (_, current) => current is AuthSignedIn,
            builder: (_, state) {
              final datos2 = (state as AuthSignedIn).user;
              final drawerHeader = UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.deepPurple.shade200),
                accountName: Text('${datos.name} ' '${datos.lastName}'),
                accountEmail: Text(datos2.email),
                currentAccountPicture: ClipOval(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: image,
                  ),
                ),
                otherAccountsPictures: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.logout),
                    tooltip: 'Logout',
                    onPressed: () => context.read<AuthCubit>().signOut(),
                  )
                ],
              );
              return Container(
                color: Colors.amber.shade100,
                child: ListView(
                  children: <Widget>[
                    drawerHeader,
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: const Text(
                          'Configuración',
                          style:
                              TextStyle(fontSize: 25, fontFamily: "Courgette"),
                        ),
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                          return BlocProvider.value(
                            value: BlocProvider.of<MyUserCubit>(context),
                            child: GuardarDatos(),
                          );
                        })),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: const Text(
                          'Favoritos',
                          style:
                              TextStyle(fontSize: 25, fontFamily: "Courgette"),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: const Text(
                          'Compras',
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: "Courgette",
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: const Text(
                          'Cerrar Sesión',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 25,
                              fontFamily: "Courgette"),
                        ),
                        onTap: () => context.read<AuthCubit>().signOut(),
                      ),
                    ),
                  ],
                ),
              );
            });
      },
    );
  }
}
