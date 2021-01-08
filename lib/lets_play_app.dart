import 'package:flutter/material.dart';
import 'package:letsplay/widgets/pages/ExplorePage/explore_page.dart';

class LetsPlayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: const Color(0xFF5d36d6),
        backgroundColor: const Color(0xFF36008b),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: const Color(0xFFe5e5e5),
            fontFamily: 'Roboto',
          ),
        ),
      ),
      home: ExplorePage(),
    );
  }
}
