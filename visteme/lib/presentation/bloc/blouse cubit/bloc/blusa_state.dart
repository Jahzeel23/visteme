part of 'blusa_bloc.dart';

@immutable
abstract class BlusaState extends Equatable {
  const BlusaState();

  @override
  List<Object> get props => [];
}

class BlusaLoading extends BlusaState {}

class BlusaLoaded extends BlusaState {
  final List<BlusaModel> blusas;

  BlusaLoaded({this.blusas = const <BlusaModel>[]});

  @override
  List<Object> get props => [blusas];
}
