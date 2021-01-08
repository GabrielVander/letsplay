import 'package:letsplay/widgets/pages/routes/routes.dart';

class PageRoutes {
  static final Map<int, Routes> _indexedRoutes = {
    0: null,
    1: Routes.EXPLORE_PAGE,
    2: null,
  };

  static Routes getRouteByIndex(int index) {
    return _indexedRoutes.containsKey(index) ? _indexedRoutes[index] : null;
  }
}
