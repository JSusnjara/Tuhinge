import 'package:cloud_firestore/cloud_firestore.dart';

class Buyer {
  String? buyer_id;
  String email;
  String first_name;
  String last_name;
  String address;
  String? profile_picture_url;
  double latitude;
  double longitude;

  Buyer({
    this.buyer_id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.address,
    this.profile_picture_url,
    required this.latitude,
    required this.longitude
  });

  factory Buyer.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Buyer(
      buyer_id: doc.id,
      email: data['email'] ?? '',
      first_name: data['first_name'] ?? '',
      last_name: data['last_name'] ?? '',
      address: data['address'] ?? '',
      profile_picture_url: data['profile_picture_url'] ?? '',
      latitude: (data['latitude'] ?? 0.0).toDouble(),
      longitude: (data['longitude'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toFirestoreData() {
    return {
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'address': address,
      'profile_picture_url': profile_picture_url,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

}