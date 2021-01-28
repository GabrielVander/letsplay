import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:letsplay/widgets/lets_play_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  final String env = String.fromEnvironment(
    'ENV',
    defaultValue: 'development',
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Something went wrong while attempting to initialize app: ' +
              snapshot.error.toString());
          return Text('Initialization error');
        } else if (snapshot.hasData) {
          if (env == 'development') {
            String host = defaultTargetPlatform == TargetPlatform.android
                ? '10.0.2.2:8080'
                : 'localhost:8080';

            FirebaseFirestore.instance.settings =
                Settings(host: host, sslEnabled: false);
          }
          return LetsPlayApp();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: _firebaseApp,
    );
  }
}
