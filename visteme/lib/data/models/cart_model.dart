import 'package:equatable/equatable.dart';
import 'package:visteme/data/models/blusa_model.dart';

class Cart extends Equatable {
  final List<BlusaModel> blusas;

  const Cart({this.blusas = const <BlusaModel>[]});

  @override
  List<Object?> get props => [blusas];

  Map productQuantity(blusas) {
    var quantity = {};

    blusas.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });

    return quantity;
  }

  double get subtotal =>
      blusas.fold(0, (total, current) => total + current.precio);

  double deliveryFee(subtotal) {
    if (subtotal >= 1000.0) {
      return 0.0;
    } else {
      return 200.0;
    }
  }

  String freeDelivery(subtotal) {
    if (subtotal >= 1000.0) {
      return 'Envío gratis.';
    } else {
      double missing = 1000.0 - subtotal;
      return 'Agregar para envío gratis: \$${missing.toStringAsFixed(2)}';
    }
  }

  double total(subtotal, deliveryFee) {
    return subtotal + deliveryFee(subtotal);
  }

  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal, deliveryFee).toStringAsFixed(2);

  String get freeDeliveryString => freeDelivery(subtotal);
}
