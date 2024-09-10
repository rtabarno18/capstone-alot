import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> updateUserData(
      String userId, String name, String phone, bool isClient) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'name': name,
        'phone': phone,
        'role': isClient
            ? 'client'
            : 'barber', // Store the role as 'client' or 'barber'
      });
    } catch (e) {
      print('Error updating user data: $e');
    }
  }
}
