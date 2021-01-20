import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:letsplay/generated/assets.dart';
import 'package:letsplay/generated/l10n.dart';
import 'package:letsplay/widgets/common/IllustratedMessage/illustrated_message.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return IllustratedMessage(
            picture: SvgPicture.asset(
              Assets.imagesCuteProgrammer,
              fit: BoxFit.fitHeight,
              semanticsLabel: S.of(context).errorIllustrationLabel,
            ),
            title: S.of(context).errorMessageTitle,
            message: S.of(context).errorMessageBody +
                '\n' +
                snapshot.error.toString(),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.data.size == 0) {
          return IllustratedMessage(
            picture: SvgPicture.asset(
              Assets.imagesSleepyCoala,
              fit: BoxFit.fitWidth,
              clipBehavior: Clip.none,
              semanticsLabel:
                  S.of(context).explorePageNewPeopleTabContentIllustrationLabel,
            ),
            title: S.of(context).explorePageNewPeopleTabContentMessageTitle,
            message: S.of(context).explorePageNewPeopleTabContentMessageBody,
          );
        }

        return new ListView(
          padding: const EdgeInsets.all(8),
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return new ListTile(
              leading: document.data()['name'] ?? 'https://picsum.photos/200',
              title: new Text(document.data()['name']),
              // subtitle: new Text(document.data()['company']),
            );
          }).toList(),
        );
      },
    );
  }
}
