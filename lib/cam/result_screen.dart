// result_screen.dart
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:vehiclerecog/cam/cam_view.dart';
import 'package:vehiclerecog/services/firestore_service.dart';

class ResultScreen extends StatefulWidget {
  final String text;

  const ResultScreen({required this.text, super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirestoreService firestoreService = FirestoreService();
    firestoreService.sendNotification(globalRecognizedText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: Text(
          globalRecognizedText,
          style: TextStyle(
            fontSize: 18.0, // Adjust the font size as needed
            fontWeight: FontWeight.bold, // Make the font bold
          ),
        ),
      ),
    );
  }
}
