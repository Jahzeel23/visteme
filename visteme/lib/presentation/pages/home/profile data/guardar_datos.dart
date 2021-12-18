import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visteme/data/models/user.dart';
import 'package:visteme/presentation/bloc/auth%20cubit/auth_cubit.dart';
import 'package:visteme/presentation/bloc/user%20cubit/my_user_cubit.dart';
import 'package:visteme/presentation/pages/home/profile%20data/design_my_draw.dart';

class GuardarDatos extends StatelessWidget {
  const GuardarDatos({Key? key}) : super(key: key);
  static Widget create(BuildContext context) => GuardarDatos();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.red.shade200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
      body: BlocBuilder<MyUserCubit, MyUserState>(
        builder: (_, state) {
          if (state is MyUserReadyState) {
            return _MyUserSection(
              user: state.user,
              pickedImage: state.pickedImage,
              isSaving: state.isSaving,
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _MyUserSection extends StatefulWidget {
  final MyUser? user;
  final File? pickedImage;
  final bool isSaving;

  const _MyUserSection({this.user, this.pickedImage, this.isSaving = false});

  @override
  _MyUserSectionState createState() => _MyUserSectionState();
}

class _MyUserSectionState extends State<_MyUserSection> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  final picker = ImagePicker();

  @override
  void initState() {
    _nameController.text = widget.user?.name ?? '';
    _lastNameController.text = widget.user?.lastName ?? '';
    _ageController.text = widget.user?.age.toString() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      'assets/images/user.png',
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

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                final pickedImage =
                    await picker.getImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  context.read<MyUserCubit>().setImage(File(pickedImage.path));
                }
              },
              child: Center(
                child: ClipOval(
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: image,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                  labelText: 'Nombre(s)',
                  labelStyle: TextStyle(
                      color: Colors.pink, fontSize: 30, fontFamily: "Itim")),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                  labelText: 'Apellidos',
                  labelStyle: TextStyle(
                      color: Colors.pink, fontSize: 30, fontFamily: "Itim")),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Edad',
                  labelStyle: TextStyle(
                      color: Colors.pink, fontSize: 30, fontFamily: "Itim")),
            ),
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Save'),
                  onPressed: widget.isSaving
                      ? null
                      : () {
                          context.read<MyUserCubit>().saveMyUser(
                                (context.read<AuthCubit>().state
                                        as AuthSignedIn)
                                    .user
                                    .uid,
                                _nameController.text,
                                _lastNameController.text,
                                int.tryParse(_ageController.text) ?? 0,
                              );
                        },
                ),
                if (widget.isSaving) const CircularProgressIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
