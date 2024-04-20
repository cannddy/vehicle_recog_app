import 'package:flutter/material.dart';
import 'package:vehiclerecog/services/firestore_service.dart';
import 'package:vehiclerecog/services/notification_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  FirestoreService firestoreService = FirestoreService();
  NotificationService notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    displayNotification();
  }

  void displayNotification() async {
    firestoreService.firestore
        .collection("notifications")
        .snapshots()
        .listen((event) {
      final data = event.docs;
      for (var notification in data) {
        final uid = notification.get("user_id");
        if (firestoreService.auth.currentUser!.uid == uid) {
          notificationService.showNotification(
            id: data.length,
            title: "Vehicle Alert",
            body: "Your Vehicle has crossed the gate ",
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.loose,
        children: [
          // Background Image
          Image.asset(
            'assets/sec-2.jpeg', // Replace with your image asset
            fit: BoxFit.fill,
          ),

          // Content
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                "                                              Notification pops up when your vehicle has crossed the gate. This app ensures safety for your vehicles",
                style: TextStyle(
                  fontSize: 18.0, // Adjust the font size as needed
                  fontWeight: FontWeight.bold, // Make the font bold
                  color: Colors.black, // Set text color
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),

          // App Bar
        ],
      ),
    );
  }
}
