import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  void registerVehicle(String name, String number) async {
    final json = {
      'id': auth.currentUser!.uid,
      'name': name,
      'number_plate': number
    };
    await firestore.collection("users").doc(auth.currentUser!.uid).set(json);
    await auth.currentUser!.updateDisplayName(name);
  }

  Future<bool> isAlreadyUser() async {
    if (auth.currentUser != null) {
      final doc =
          await firestore.collection("users").doc(auth.currentUser!.uid).get();
      return doc.exists;
    } else {
      await Future.delayed(Duration(seconds: 4));
      final doc =
          await firestore.collection("users").doc(auth.currentUser!.uid).get();
      return doc.exists;
    }
  }

  void sendNotification(String vehicleNumber) async {
    final query = await firestore
        .collection("users")
        .where("number_plate", isEqualTo: vehicleNumber)
        .get();
    if (query.docs.isNotEmpty) {
      final data = {
        'user_id': query.docs[0].id,
        'created_at': Timestamp.now(),
      };
      await firestore.collection("notifications").add(data);
    } 
  }
}
