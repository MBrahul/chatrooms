import 'package:chatrooms/chathome.dart';
import 'package:chatrooms/main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserName extends StatelessWidget {
  var username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chatrooms"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue.shade100,
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 90,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: username,
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w200),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400),
                    onPressed: () async {
                      var name = username.text.toString();
                      if (name.isNotEmpty) {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString(
                            "username", username.text.toString());
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return ChatHome();
                        }));
                      }
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(color: Colors.black, fontSize: 17),
                    )))
          ],
        )),
      ),
    );
  }
}
