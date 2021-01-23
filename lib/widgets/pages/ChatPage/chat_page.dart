import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:letsplay/generated/assets.dart';
import 'package:letsplay/generated/l10n.dart';
import 'package:letsplay/models/chat_page_arguments.dart';
import 'package:letsplay/widgets/common/IllustratedMessage/illustrated_message.dart';

class ChatPage extends StatefulWidget {
  ChatPage({
    Key key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String _chatId;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    final ChatPageArguments routeArguments =
        ModalRoute.of(context).settings.arguments;
    final String targetId = routeArguments.targetId;
    final String chatTitle = routeArguments.chatTitle;

    User user = FirebaseAuth.instance.currentUser;

    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('chats')
        .doc(targetId)
        .get()
        .then((value) async {
      if (value.exists) {
        return value.get('chatId');
      }
      DocumentReference chatRef = await FirebaseFirestore.instance
          .collection('chats')
          .add({'createdBy': user.uid});

      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('chats')
          .doc(targetId)
          .set({'chatId': chatRef.id});

      return chatRef.id;
    }).then((chatId) {
      setState(() {
        _isLoading = false;
        _chatId = chatId;
      });
    });

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(chatTitle),
        automaticallyImplyLeading: true,
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('chats')
                  .doc(_chatId)
                  .collection('messages')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: IllustratedMessage(
                      picture: SvgPicture.asset(
                        Assets.imagesCuteSleepyPanda,
                      ),
                      title: S.of(context).emptyMessageTitle,
                      message: S.of(context).emptyChatMessageBody,
                    ),
                  );
                } else {
                  return ListView(
                    children:
                        snapshot.data.docs.map((DocumentSnapshot document) {
                          Object rawTimestamp = document.data()['timestamp'];
                          Timestamp timestamp = (Timestamp)timestamp;

                          return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: new BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
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
                              DateTime.fromMillisecondsSinceEpoch(timestamp.).toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                    fontSize: 18,
                                  ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            ),
    );
  }
}
