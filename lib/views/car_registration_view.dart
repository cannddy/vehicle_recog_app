import 'package:flutter/material.dart';
import 'package:vehiclerecog/services/firestore_service.dart';

class CarRegistrationView extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  FirestoreService firestoreService = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehicle Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Resident Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Vehicle Number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: vehicleNumberController,
              decoration: InputDecoration(
                hintText: 'Enter your vehicle number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                firestoreService.registerVehicle(
                    nameController.text, vehicleNumberController.text);
                Navigator.restorablePushNamedAndRemoveUntil(
                    context, '/home', (route) => false);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
