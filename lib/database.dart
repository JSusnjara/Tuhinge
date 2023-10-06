import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/seller.dart';
import 'models/buyer.dart';

class Database{

  late FirebaseFirestore _firestore;

  Database() {
    initializeApp();
  }

  Future<void> initializeApp() async {
    await Firebase.initializeApp().then((value) => {
    _firestore = FirebaseFirestore.instance
    });
  }



  Future<List<Seller>> getAllSellers() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection('Seller').get();

      return snapshot.docs.map((doc) => Seller.fromFirestore(doc)).toList();
    } catch (error) {
      print('Error fetching sellers: $error');
      throw error;
    }
  }

  Future<void> addSeller(Seller seller) async {
    try {
      await _firestore.collection('Seller').add(seller.toFirestoreData());
    } catch (error) {
      print('Error adding seller: $error');
      throw error;
    }
  }

  Future<void> updateSeller(Seller seller) async {
    try {
      await _firestore
          .collection('Seller')
          .doc(seller.seller_id)
          .update(seller.toFirestoreData());
    } catch (error) {
      print('Error updating seller: $error');
      throw error;
    }
  }



  Future<List<Buyer>> getAllBuyers() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> snapshot =
      await _firestore.collection('Buyer').get();

      return snapshot.docs.map((doc) => Buyer.fromFirestore(doc)).toList();
    } catch (error) {
      print('Error fetching buyers: $error');
      throw error;
    }
  }

  Future<void> addBuyer(Buyer buyer) async {
    try {
      await _firestore.collection('Buyer').add(buyer.toFirestoreData());
    } catch (error) {
      print('Error adding buyer: $error');
      throw error;
    }
  }

  Future<void> updateBuyer(Buyer buyer) async {
    try {
      await _firestore
          .collection('Buyer')
          .doc(buyer.buyer_id)
          .update(buyer.toFirestoreData());
    } catch (error) {
      print('Error updating buyer: $error');
      throw error;
    }
  }



}