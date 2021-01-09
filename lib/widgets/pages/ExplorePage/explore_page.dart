import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:letsplay/generated/assets.dart';
import 'package:letsplay/widgets/common/IllustratedMessage/illustrated_message.dart';
import 'package:letsplay/widgets/common/NavigationBar/navigation_bar.dart';
import 'package:letsplay/widgets/pages/ExplorePage/CustomTabBar/custom_tab_bar.dart';
import 'package:letsplay/widgets/pages/ExplorePage/Header/header.dart';
import 'package:letsplay/widgets/pages/routes/routes.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        IllustratedMessage(
                            picture: SvgPicture.asset(
                              Assets.imagesCuteGamerDog,
                              fit: BoxFit.fitWidth,
                              clipBehavior: Clip.none,
                              semanticsLabel: 'Cute gamer dog image',
                            ),
                            title: 'Oops...',
                            message: 'You should be logged in to access this'),
                        IllustratedMessage(
                            picture: SvgPicture.asset(
                              Assets.imagesSleepyCoala,
                              fit: BoxFit.fitWidth,
                              clipBehavior: Clip.none,
                              semanticsLabel: 'Cute sleepy girl image',
                            ),
                            title: 'Oh no...',
                            message:
                                'It seems no one is online. Help us grow by sharing the app with your friends!'),
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
