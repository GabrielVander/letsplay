import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:letsplay/generated/assets.dart';
import 'package:letsplay/generated/l10n.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(S.of(context).loginButton),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              Assets.imagesCuteMilkshakeDog,
              fit: BoxFit.fitWidth,
              clipBehavior: Clip.none,
              semanticsLabel: S.of(context).loginPageIllustrationLabel,
            ),
            Container(
              height: 100,
              child: Center(
                child: Text(
                  S.of(context).loginButton,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 44,
                      ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: Theme.of(context).textTheme.bodyText2,
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                  focusColor: Theme.of(context).textTheme.bodyText2.color,
                  labelText: S.of(context).emailLabel,
                  hintText: S.of(context).emailHint,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: Theme.of(context).textTheme.bodyText2,
                  hintStyle: Theme.of(context).textTheme.bodyText2,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).textTheme.bodyText2.color,
                    ),
                  ),
                  labelText: S.of(context).passwordLabel,
                  hintText: S.of(context).passwordHint,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  S.of(context).loginButton,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 25,
                      ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).loginPagerNewUser,
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
