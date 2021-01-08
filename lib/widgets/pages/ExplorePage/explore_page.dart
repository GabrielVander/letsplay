import 'package:flutter/material.dart';
import 'package:letsplay/widgets/common/oops.dart';
import 'package:letsplay/widgets/pages/ExplorePage/CustomTabBar/custom_tab_bar.dart';
import 'package:letsplay/widgets/pages/ExplorePage/Header/header.dart';
import 'package:flutter/painting.dart';

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
                        Oops(),
                        Container(
                          color: Colors.pink,
                          child: Center(
                            child: Text(
                              'Car',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
