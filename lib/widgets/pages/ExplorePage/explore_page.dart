import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letsplay/generated/assets.dart';
import 'package:letsplay/generated/l10n.dart';
import 'package:letsplay/widgets/common/IllustratedMessage/illustrated_message.dart';
import 'package:letsplay/widgets/common/NavigationBar/navigation_bar.dart';
import 'package:letsplay/widgets/pages/ExplorePage/CustomTabBar/custom_tab_bar.dart';
import 'package:letsplay/widgets/pages/ExplorePage/Header/header.dart';
import 'package:letsplay/widgets/pages/ExplorePage/Unauthenticated/unauthenticated.dart';
import 'package:letsplay/widgets/pages/ExplorePage/UserList/user_list.dart';
import 'package:letsplay/widgets/pages/routes/routes.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(),
                  CustomTabBar(),
                  Expanded(
                    child: TabBarView(
                      children: [
                        user == null
                            ? Unauthenticated()
                            : IllustratedMessage(
                                picture: SvgPicture.asset(
                                  Assets.imagesCuteSleepyPanda,
                                  semanticsLabel:
                                      S.of(context).emptyIllustrationLabel,
                                ),
                                title: S.of(context).emptyMessageTitle,
                                message: S.of(context).emptyMessageBody,
                              ),
                        UserList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          index: Routes.EXPLORE_PAGE.navigationIndex,
        ),
      ),
    );
  }
}
