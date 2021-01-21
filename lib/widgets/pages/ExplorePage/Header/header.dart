import 'package:flutter/material.dart';
import 'package:letsplay/generated/l10n.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).explorePageHeaderTitle,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          S.of(context).explorePageHeaderSubtitle,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
