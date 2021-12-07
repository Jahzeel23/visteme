import 'package:equatable/equatable.dart';

class AuthUser extends Equatable {
  String uid = "";
  dynamic email;

  AuthUser(this.uid, this.email);

  @override
  List<Object?> get props => [uid, email];
}

abstract class AuthRepositoryBase {
  Stream<AuthUser?> get onAuthStateChanged;

  Future<AuthUser?> signInWithEmailAndPassword(String email, String password);

  Future<AuthUser?> createUserWithEmailAndPassword(
      String email, String password);

  Future<AuthUser?> signInAnonymously();

  Future<AuthUser?> signInWithGoogle();

  Future<AuthUser?> signInWithFacebook();

  Future<void> signOut();
}
