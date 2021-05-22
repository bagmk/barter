import 'dart:math';
import 'package:flutter/material.dart';

import 'KeyPad.dart';
import 'home.dart';

class Barter extends StatefulWidget {
  final String currentUserId;
  final String postId;
  final String ownerId;

  Barter({
    this.currentUserId,
    this.postId,
    this.ownerId,
  });

  @override
  _BarterState createState() => _BarterState();
}

class _BarterState extends State {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barter'),
        backgroundColor: Colors.blue,
      ),
      body: Builder(
        builder: (BuildContext context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  'How much do you want to pay?',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                      // fontFamily: AppTextStyle.robotoBold
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 15),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.orangeAccent,
                      border:
                          Border.all(color: Colors.orangeAccent, width: 1.5)),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: TextField(
                      controller: pinController,
                      readOnly: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        // fontWeight: FontWeight.bold
                        // fontFamily: AppTextStyle.robotoBold
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '\$\$\$',
                      ),
                      // controller: userDisplayName,
                    ),
                  ),
                ),
              ),
              KeyPad(
                pinController: pinController,
                isPinLogin: false,
                onChange: (String pin) {
                  pinController.text = pin;
                  print('${pinController.text}');
                  setState(() {});
                },
                onSubmit: (String pin) {
                  pinController.text = pin;
                  print('submit \$ ${pinController.text}');
                  //handleBarter(pin);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//handleBarter(String pin) {
//  barterRef
//.doc(ownerId)
//.collection('barter')
//.doc(postId)
//.update({'bid.$currentUserId': pin});
//}