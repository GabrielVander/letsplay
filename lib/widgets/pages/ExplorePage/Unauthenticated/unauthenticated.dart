import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:letsplay/generated/assets.dart';
import 'package:letsplay/generated/l10n.dart';
import 'package:letsplay/widgets/common/IllustratedMessage/illustrated_message.dart';
import 'package:letsplay/widgets/pages/routes/routes.dart';

class Unauthenticated extends StatelessWidget {
  const Unauthenticated({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IllustratedMessage(
            picture: SvgPicture.asset(
              Assets.imagesCuteGamerDog,
              fit: BoxFit.fitWidth,
              clipBehavior: Clip.none,
              semanticsLabel: S
                  .of(context)
                  .explorePageMyFollowersTabContentIllustrationLabel,
            ),
            title: S.of(context).explorePageMyFollowersTabContentMessageTitle,
            message: S.of(context).explorePageMyFollowersTabContentMessageBody),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              child: Text(
                S.of(context).loginButton,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () =>
                  Navigator.pushNamed(context, Routes.LOGIN_PAGE.path),
            ),
            RaisedButton(
              child: Text(
                S.of(context).singUpButton,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () => {},
            ),
          ],
        ),
      ],
    );
  }
}
