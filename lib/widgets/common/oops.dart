import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Oops extends StatelessWidget {
  const Oops({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/cute_gamer_dog.svg',
              fit: BoxFit.contain,
              semanticsLabel: 'Cute gamer dog image',
            ),
            Text(
              'Oops...',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 48,
                  ),
              textAlign: TextAlign.center,
            ),
            Text(
              'You must be logged in to access this',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 24,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
