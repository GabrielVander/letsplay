import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letsplay/generated/l10n.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(context).explorePageHeaderTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            user == null
                ? Container()
                : IconButton(
                    icon: Icon(Icons.logout),
                    color: Theme.of(context).textTheme.bodyText2.color,
                    tooltip: S.of(context).logoutButtonTooltip,
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();

                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(user.uid)
                          .update({'status': 'offline'});

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(S.of(context).authLoggedOut),
                        ),
                      );
                    },
                  )
          ],
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
