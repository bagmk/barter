import 'package:animator/animator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttershare/models/user.dart';

import 'package:fluttershare/pages/activity_feed.dart';

import 'package:fluttershare/pages/home.dart';

import 'package:fluttershare/widgets/progress.dart';

class SellList extends StatefulWidget {
  final String postId;
  final String userId;
  final String type;
  final String username;
  final String item;
  final Timestamp timestamp;
  final String mediaUrl;

  SellList(
      {this.postId,
      this.userId,
      this.type,
      this.username,
      this.timestamp,
      this.item,
      this.mediaUrl});

  factory SellList.fromDocument(DocumentSnapshot doc) {
    return SellList(
        postId: doc.data()['postId'],
        userId: doc.data()['userId'],
        timestamp: doc.data()['timestamp'],
        type: doc.data()['Cash/Item'],
        username: doc.data()['username'],
        item: doc.data()['item'],
        mediaUrl: doc.data()['mediaUrl']);
  }

  @override
  _SellListState createState() => _SellListState(
      postId: this.postId,
      userId: this.userId,
      timestamp: this.timestamp,
      type: this.type,
      username: this.username,
      item: this.item,
      mediaUrl: this.mediaUrl);
}

class _SellListState extends State<SellList> {
  final String postId;
  final String userId;
  final Timestamp timestamp;
  final String type;
  final String item;
  final String username;
  final String mediaUrl;

  _SellListState(
      {this.postId,
      this.userId,
      this.timestamp,
      this.type,
      this.username,
      this.item,
      this.mediaUrl});

  buildPostHeader() {
    return FutureBuilder(
      future: usersRef.doc(userId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return circularProgress();
        }
        User user = User.fromDocument(snapshot.data);

        return ListTile(
            leading: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(user.photoUrl),
              backgroundColor: Colors.grey,
            ),
            title: Row(children: [
              Text(
                  type == "Cash"
                      ? " <- This guy bid with \$"
                      : "<- This guy barter with ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text(item,
                  style: TextStyle(
                      color: Colors.pink, fontWeight: FontWeight.bold)),
            ]));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        buildPostHeader(),
      ],
    );
  }
}
