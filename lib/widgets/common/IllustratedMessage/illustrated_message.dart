import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IllustratedMessage extends StatelessWidget {
  const IllustratedMessage({
    Key key,
    @required this.picture,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  final SvgPicture picture;
  final String title;
  final String message;

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
          picture,
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Text(
              title,
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
