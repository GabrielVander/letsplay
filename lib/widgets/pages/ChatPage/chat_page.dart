import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letsplay/generated/assets.dart';
import 'package:letsplay/generated/l10n.dart';
import 'package:letsplay/widgets/common/IllustratedMessage/illustrated_message.dart';

class ChatPage extends StatefulWidget {
  final String targetId;
  final String chatTitle;

  ChatPage({
    Key key,
    @required this.chatTitle,
    @required this.targetId,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  DocumentReference _chatRef;
  bool _isLoading = true;

  @override
  void initState() {
    User user = FirebaseAuth.instance.currentUser;

    super.initState();
    FirebaseFirestore.instance
        .collection('chats')
        .where('members', arrayContains: [widget.targetId, user.uid])
        .where('isGroup', isEqualTo: false)
        .get()
        .then((value) async {
          if (value.size != 0) {
            return value.docs[0];
          }
          DocumentReference chatRef =
              await FirebaseFirestore.instance.collection('chats').add({
            'members': [user.uid, widget.targetId],
            'isGroup': false,
          });

          return chatRef;
        })
        .then((chatRef) {
          setState(() {
            _isLoading = false;
            _chatRef = chatRef;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.chatTitle),
        automaticallyImplyLeading: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : StreamBuilder(
              stream: _chatRef
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  return Center(
                    child: IllustratedMessage(
                      picture: SvgPicture.asset(
                        Assets.imagesCuteSleepyPanda,
                      ),
                      title: S.of(context).emptyMessageTitle,
                      message: S.of(context).emptyChatMessageBody,
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    User user = FirebaseAuth.instance.currentUser;

                    Object rawTimestamp = document.data()['timestamp'];
                    Timestamp timestamp = rawTimestamp as Timestamp;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: new BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Align(
                          alignment: document.data()['sender'] == user.uid
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          child: ListTile(
                            contentPadding: EdgeInsets.all(10),
                            title: Text(
                              document.data()['content'],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    fontSize: 24,
                                  ),
                            ),
                            subtitle: Text(
                              DateTime.fromMillisecondsSinceEpoch(
                                      timestamp.millisecondsSinceEpoch)
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
    );
  }
}
