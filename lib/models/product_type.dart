import 'package:cloud_firestore/cloud_firestore.dart';

class Product_type{
  String? product_type_id;
  String product_type_name;

  Product_type({
    this.product_type_id,
    required this.product_type_name
});

  factory Product_type.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product_type(
      product_type_id: doc.id,
      product_type_name: data['product_type_name'] ?? '',
    );
  }

  Map<String, dynamic> toFirestoreData() {
    return {
      'product_type_name': product_type_name,
    };
  }
}