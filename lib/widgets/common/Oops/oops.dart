import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Oops extends StatelessWidget {
  final String message;

  const Oops({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            'assets/images/cute_gamer_dog.svg',
            fit: BoxFit.fitWidth,
            clipBehavior: Clip.none,
            semanticsLabel: 'Cute gamer dog image',
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text(
              'Oops...',
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    fontSize: 48,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  fontSize: 24,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
