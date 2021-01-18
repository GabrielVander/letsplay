import 'package:flutter/material.dart';
import 'package:letsplay/generated/l10n.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 25,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: TabBar(
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).primaryColor,
        ),
        labelStyle: Theme.of(context).primaryTextTheme.bodyText2.copyWith(
              fontSize: 24,
            ),
        unselectedLabelStyle:
            Theme.of(context).primaryTextTheme.bodyText2.copyWith(
                  fontSize: 24,
                ),
        tabs: [
          Tab(
            child: Text(S.of(context).explorePageMyFollowersTabTitle),
          ),
          Tab(
            child: Text(S.of(context).explorePageNewPeopleTabTitle),
          ),
        ],
      ),
    );
  }
}
