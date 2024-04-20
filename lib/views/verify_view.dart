import 'package:flutter/material.dart';
import 'package:vehiclerecog/services/firestore_service.dart';

class VerifyView extends StatefulWidget {
  const VerifyView({super.key});

  @override
  State<VerifyView> createState() => _VerifyViewState();
}

class _VerifyViewState extends State<VerifyView> {
  FirestoreService firestoreService = FirestoreService();
  @override
  void initState() {
    super.initState();
    verifyUser();
  }

  void verifyUser() async {
    final isUser = await firestoreService.isAlreadyUser();
    print(isUser);
    if (isUser) {
      Navigator.restorablePushNamedAndRemoveUntil(
          context, '/home', (route) => false);
    } else {
      Navigator.restorablePushNamedAndRemoveUntil(
          context, '/form', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(firestoreService.auth.currentUser);
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
