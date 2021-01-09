import 'package:flutter/material.dart';

enum Routes {
  EXPLORE_PAGE,
}

extension RoutesExtension on Routes {
  String get path {
    switch (this) {
      case Routes.EXPLORE_PAGE:
        return '/explore';
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