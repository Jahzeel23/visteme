part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}

class WishlistStarted extends WishlistEvent {
  @override
  List<Object> get props => [];
}

class WishlistProductAdded extends WishlistEvent {
  final BlusaModel blusa;

  const WishlistProductAdded(this.blusa);

  @override
  List<Object> get props => [blusa];
}

class WishlistProductRemoved extends WishlistEvent {
  final BlusaModel blusa;

  const WishlistProductRemoved(this.blusa);

  @override
  List<Object> get props => [blusa];
}
