import 'package:flutter/material.dart';
import 'package:letsplay/widgets/pages/routes/page_routes.dart';
import 'package:letsplay/widgets/pages/routes/routes.dart';

class NavigationBar extends StatefulWidget {
  final int index;

  const NavigationBar({
    Key key,
    this.index = 0,
  }) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index != null ? _index : widget.index,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).textTheme.bodyText2.color,
      unselectedItemColor: Theme.of(context).backgroundColor,
      type: BottomNavigationBarType.shifting,
      onTap: (index) {
        if (index == _index) {
          return;
        }

        setState(() {
          _index = index;
        });

        final Routes route = PageRoutes.getRouteByIndex(index);

        if (route != null) {
          Navigator.pushNamed(
            context,
            route.path,
          );
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.block,
          ),
          label: 'Example',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Routes.EXPLORE_PAGE.icon,
          label: Routes.EXPLORE_PAGE.label,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.block,
          ),
          label: 'Example',
          backgroundColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
