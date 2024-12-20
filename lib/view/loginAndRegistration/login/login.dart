import 'package:flutter/material.dart';
import 'package:netflix/model/Log&signUPModel/login.dart';
import 'package:netflix/model/Log&signUPModel/lsmodel.dart';
import 'package:netflix/services/user/userservices.dart';
import 'package:netflix/view/loginAndRegistration/registration/signup.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: usernameCtrl,
              decoration: InputDecoration(
                  hintText: 'username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Userservices ser = Userservices();
                final save = Login(
                    username: usernameCtrl.text, password: passwordCtrl.text);
                ser.login(save, context);
              },
              child: Text("login")),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Signup()));
              },
              child: Text("don't have an account??")),
        ],
      ),
    );
  }
}
