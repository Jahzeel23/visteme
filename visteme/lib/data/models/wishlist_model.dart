import 'package:equatable/equatable.dart';
import 'package:visteme/data/models/blusa_model.dart';

class Wishlist extends Equatable {
  final List<BlusaModel> blusas;

  const Wishlist({this.blusas = const <BlusaModel>[]});

  @override
  List<Object?> get props => [blusas];
}
