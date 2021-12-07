import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String image;

  const Category({
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [
        name,
        image,
      ];

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category = Category(
      name: snap['name'],
      image: snap['image'],
    );
    return category;
  }
}
