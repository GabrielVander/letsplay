import 'package:flutter/material.dart';
import 'package:letsplay/models/chat_page_arguments.dart';
import 'package:letsplay/widgets/pages/ChatPage/chat_page.dart';
import 'package:letsplay/widgets/pages/ExplorePage/explore_page.dart';
import 'package:letsplay/widgets/pages/LoginPage/login_page.dart';
import 'package:letsplay/widgets/pages/routes/routes.dart';
import 'package:letsplay/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class LetsPlayApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Let\'s play',
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
      initialRoute: Routes.EXPLORE_PAGE.path,
      routes: {
        Routes.EXPLORE_PAGE.path: (context) => ExplorePage(),
        Routes.LOGIN_PAGE.path: (context) => LoginPage(),
        Routes.CHAT_PAGE.path: (context) {
          final ChatPageArguments routeArguments =
              ModalRoute.of(context).settings.arguments;

          return ChatPage(
            chatTitle: routeArguments.chatTitle,
            targetId: routeArguments.targetId,
          );
        },
      },
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
