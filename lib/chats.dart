import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  String collectionId;
  String username;

  Chats(this.collectionId, this.username, {super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> cricketStream = FirebaseFirestore.instance
        .collection(widget.collectionId)
        .orderBy('timestamp', descending: false)
        .snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: cricketStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(
              child: Text(
            'Something went wrong',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
          ));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text(
              "Loading",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
            ),
          );
        }
        return snapshot.data!.docs.isNotEmpty
            ? ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Column(
                    crossAxisAlignment: widget.username == data['name']
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: widget.username == data['name']
                                  ? Colors.blue.shade500
                                  : Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(23)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.username == data['name']
                                    ? "You"
                                    : data["name"].toString(),
                                style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                data["msg"].toString(),
                                style: const TextStyle(fontSize: 18),
                              )
                            ],
                          )),
                      const SizedBox(
                        height: 13,
                      )
                    ],
                  );
                }).toList(),
              )
            : const Center(
                child: Text(
                  "Be the first Messanger",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w200),
                ),
              );
      },
    );
  }
}
