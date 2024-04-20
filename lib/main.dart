import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vehiclerecog/cam/cam_view.dart';
import 'package:vehiclerecog/services/firestore_service.dart';
import 'package:vehiclerecog/services/notification_service.dart';
import 'package:vehiclerecog/views/car_registration_view.dart';
import 'package:vehiclerecog/views/decider_view.dart';
import 'package:vehiclerecog/views/home_view.dart';
import 'package:vehiclerecog/views/learn_more_view.dart';
import 'package:vehiclerecog/views/verify_view.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService notificationService = NotificationService();
  await notificationService.initNotification();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => DeciderView(),
        '/home': (context) => HomeView(),
        '/cam': (context) => CamView(),
        '/form': (context) => CarRegistrationView(),
        '/learn': (context) => LearnMore(),
        '/verify': (context) => VerifyView(),
        '/profile': (context) => ProfileScreen(
              appBar: AppBar(
                title: Text("Profile"),
              ),
              actions: [
                SignedOutAction((context) {
                  Navigator.restorablePushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                }),
              ],
            ),
        '/phone': (context) => PhoneInputScreen(
              actions: [
                SMSCodeRequestedAction(
                  (context, action, flowKey, phoneNumber) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SMSCodeInputScreen(
                          flowKey: flowKey,
                          actions: [
                            AuthStateChangeAction<SigningIn>(
                                (context, state) async {
                              Navigator.restorablePushNamedAndRemoveUntil(
                                  context, '/verify', (route) => false);
                            }),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
