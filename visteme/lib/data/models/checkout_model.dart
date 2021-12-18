import 'package:equatable/equatable.dart';
import 'package:visteme/data/models/blusa_model.dart';

class Checkout extends Equatable {
  final String? nombre;
  final String? email;
  final String? direccion;
  final String? ciudad;
  final String? pais;
  final String? postal;
  final List<BlusaModel>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout({
    required this.nombre,
    required this.email,
    required this.direccion,
    required this.ciudad,
    required this.pais,
    required this.postal,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  List<Object?> get props => [
        nombre,
        email,
        direccion,
        ciudad,
        pais,
        postal,
        products,
        subtotal,
        deliveryFee,
        total,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['direccion'] = direccion;
    customerAddress['ciudad'] = ciudad;
    customerAddress['pais'] = pais;
    customerAddress['postal'] = postal;

    return {
      'customerAddress': customerAddress,
      'customerName': nombre!,
      'customerEmail': email!,
      'products': products!.map((product) => product.descripcion).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!
    };
  }
}
