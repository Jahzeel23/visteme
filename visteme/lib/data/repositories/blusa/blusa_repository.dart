import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:visteme/data/models/blusa_model.dart';
import 'package:visteme/data/repositories/blusa/base_blusa_repository.dart';

class BlusaRepository extends BaseBlusaRepository {
  final FirebaseFirestore _firebaseFirestore2;

  BlusaRepository({FirebaseFirestore? firebaseFirestore2})
      : _firebaseFirestore2 = firebaseFirestore2 ?? FirebaseFirestore.instance;

  @override
  Stream<List<BlusaModel>> getAllBlusas() {
    return _firebaseFirestore2.collection('blusas').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => BlusaModel.fromSnapshot(doc)).toList();
    });
  }
}
