part of 'blusa_bloc.dart';

@immutable
abstract class BlusaEvent extends Equatable {
  const BlusaEvent();

  @override
  List<Object> get props => [];
}

class LoadBlusas extends BlusaEvent {}

class UpdateBlusas extends BlusaEvent {
  final List<BlusaModel> blusas;

  UpdateBlusas(this.blusas);

  @override
  List<Object> get props => [blusas];
}
