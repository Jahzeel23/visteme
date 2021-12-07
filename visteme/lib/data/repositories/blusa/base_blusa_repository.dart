import 'package:visteme/data/models/blusa_model.dart';

abstract class BaseBlusaRepository {
  Stream<List<BlusaModel>> getAllBlusas();
}
