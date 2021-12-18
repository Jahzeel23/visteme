import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:visteme/domain/entities/blusa.dart';

class BlusaModel extends Equatable {
  final String descripcion;
  final String category;
  final String color;
  final String image;
  final int cantidad;
  final String talla;
  final String marca;
  final int precio;
  final bool isRecommended;
  const BlusaModel({
    required this.descripcion,
    required this.category,
    required this.color,
    required this.image,
    required this.cantidad,
    required this.talla,
    required this.marca,
    required this.precio,
    required this.isRecommended,
  });
  @override
  List<Object?> get props => [
        descripcion,
        category,
        color,
        image,
        cantidad,
        talla,
        marca,
        precio,
        isRecommended,
      ];
  static BlusaModel fromSnapshot(DocumentSnapshot snapshot) {
    BlusaModel blusaModel = BlusaModel(
      descripcion: snapshot["descripcion"],
      category: snapshot["category"],
      color: snapshot["color"],
      image: snapshot["image"],
      cantidad: snapshot["cantidad"],
      talla: snapshot["talla"],
      marca: snapshot["marca"],
      precio: snapshot["precio"],
      isRecommended: snapshot['isRecommended'],
    );
    return blusaModel;
  }
}
