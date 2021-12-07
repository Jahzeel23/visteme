import 'dart:io';

import 'package:visteme/data/repositories/my_user_repository.dart';
import 'package:visteme/domain/entities/provider/firebase_provider.dart';
import 'package:visteme/domain/entities/user.dart';

class MyUserRepository extends MyUserRepositoryBase {
  final provider = FirebaseProvider();

  @override
  Future<MyUser?> getMyUser() => provider.getMyUser();

  @override
  Future<void> saveMyUser(MyUser user, File? image) =>
      provider.saveMyUser(user, image);
}
