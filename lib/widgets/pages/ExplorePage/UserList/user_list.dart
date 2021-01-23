import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:letsplay/generated/assets.dart';
import 'package:letsplay/generated/l10n.dart';
import 'package:letsplay/models/user_status.dart';
import 'package:letsplay/widgets/common/IllustratedMessage/illustrated_message.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;
    final isAuthenticated = user != null;

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    String getStatusLabel(UserStatus userStatus) {
      switch (userStatus) {
        case UserStatus.ONLINE:
          return S.of(context).userStatusOnline;
        case UserStatus.OFFLINE:
          return S.of(context).userStatusOffline;
        case UserStatus.PLAYING:
          return S.of(context).userStatusPlaying;
        case UserStatus.UNKNOWN:
          return S.of(context).userStatusUnknown;
        default:
          return null;
      }
    }

    return StreamBuilder<QuerySnapshot>(
      stream: isAuthenticated
          ? users
              .where(
                FieldPath.documentId,
                isNotEqualTo: user.uid,
              )
              .snapshots()
          : users.snapshots(),
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

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(document.data()['picture_url'],
                        fit: BoxFit.fitWidth,
                        errorBuilder: (context, error, stackTrace) =>
                            Text(S.of(context).genericErrorLabel),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        }),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        document.data()['name'],
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 24,
                            ),
                      ),
                      isAuthenticated
                          ? IconButton(
                              icon: Icon(
                                Icons.chat,
                                color:
                                    Theme.of(context).textTheme.bodyText2.color,
                              ),
                              onPressed: () {},
                            )
                          : Container(),
                    ],
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).userDisplayStatusLabel,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 18,
                            ),
                      ),
                      Text(
                        getStatusLabel(
                          UserStatusHelper.getFromString(
                              document.data()['status']),
                        ),
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                              fontSize: 24,
                              color: UserStatusHelper.getFromString(
                                      document.data()['status'])
                                  .color,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
