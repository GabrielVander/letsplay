import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:letsplay/widgets/app/lets_play_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print('Something went wrong while attempting to initialize app: ' +
              snapshot.error.toString());
          return Text('Initialization error');
        } else if (snapshot.hasData) {
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
