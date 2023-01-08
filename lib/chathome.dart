import 'package:chatrooms/chats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChatHomeState();
  }
}

class _ChatHomeState extends State<ChatHome> {
  String collectionId = "";
  String? username = '';
  Map iconColors = {
    "football": Colors.black38,
    "cricket": Colors.black38,
    "computer": Colors.black38,
    "games": Colors.black38,
    "gym": Colors.black38,
  };
  var msg = TextEditingController();

  getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
  }

  switchChats(collectionId) {
    setState(() {
      this.collectionId = collectionId;
    });
    iconColors.forEach((key, value) {
      if (key == collectionId) {
        iconColors[key] = Colors.white;
      } else {
        iconColors[key] = Colors.black38;
      }
    });
  }

  sendMsg(collectionId) {
    FirebaseFirestore.instance.collection(collectionId).add({
      "name": username,
      "msg": msg.text.toString(),
      "timestamp": Timestamp.now()
    }).then((value) => null);
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 50),
      height: double.infinity,
      width: double.infinity,
      color: Colors.blue,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: 65,
            color: Colors.transparent,
            child: Column(
              children: [
                Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: iconColors['football']),
                    child: IconButton(
                        onPressed: () {
                          switchChats("football");
                        },
                        icon: const Icon(
                          Icons.sports_baseball,
                          size: 30,
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: iconColors['cricket']),
                    child: IconButton(
                        onPressed: () {
                          switchChats('cricket');
                        },
                        icon: const Icon(
                          Icons.sports_cricket,
                          size: 30,
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: iconColors['computer']),
                    child: IconButton(
                        onPressed: () {
                          switchChats('computer');
                        },
                        icon: const Icon(
                          Icons.computer_outlined,
                          size: 30,
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    // color: Colors.white,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: iconColors['games']),
                    child: IconButton(
                        onPressed: () {
                          switchChats('games');
                        },
                        icon: const Icon(
                          Icons.sports_esports_outlined,
                          size: 30,
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: iconColors['gym']),
                    child: IconButton(
                        onPressed: () {
                          switchChats('gym');
                        },
                        icon: const Icon(
                          Icons.sports_gymnastics_outlined,
                          size: 30,
                        )))
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                color: Colors.transparent,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      collectionId.toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: collectionId == ""
                        ? const Center(
                            child: Text(
                              'Enter in a chat room',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w200),
                            ),
                          )
                        : Chats(collectionId, username!)),
              ),
              Container(
                height: 70,
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.only(
                    bottom: 22, top: 10, left: 5, right: 5),
                child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    controller: msg,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: 'Type your msg ...',
                        hintStyle: const TextStyle(color: Colors.black),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        suffix: IconButton(
                            onPressed: () {
                              if (msg.text.toString() != "") {
                                sendMsg(collectionId);
                              }
                              msg.text = '';
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.black,
                            )))),
              )
            ],
          ))
        ],
      ),
    ));
  }
}
