import 'package:flutter/material.dart';

enum Routes {
  EXPLORE_PAGE,
  LOGIN_PAGE,
  CHAT_PAGE
}

extension RoutesExtension on Routes {
  String get path {
    switch (this) {
      case Routes.EXPLORE_PAGE:
        return '/explore';
      case Routes.LOGIN_PAGE:
        return '/login';
      case Routes.CHAT_PAGE:
        return '/chat';
      default:
        return null;
    }
  }

  Widget get icon {
    switch (this) {
      case Routes.EXPLORE_PAGE:
        return Icon(
          Icons.explore_outlined,
        );
      default:
        return null;
    }
  }

  String get label {
    switch (this) {
      case Routes.EXPLORE_PAGE:
        return 'Explore';
      default:
        return null;
    }
  }

  int get navigationIndex {
    switch (this) {
      case Routes.EXPLORE_PAGE:
        return 1;
      default:
        return null;
    }
  }
}
