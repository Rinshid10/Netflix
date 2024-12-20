import 'package:flutter/material.dart';
import 'package:netflix/model/Log&signUPModel/lsmodel.dart';
import 'package:netflix/services/user/userservices.dart';
import 'package:netflix/view/loginAndRegistration/login/login.dart';

class Signup extends StatelessWidget {
  TextEditingController nameCrtl = TextEditingController();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();

  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameCrtl,
              decoration: InputDecoration(
                  hintText: 'name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
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
              controller: emailCtrl,
              decoration: InputDecoration(
                  hintText: 'email',
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  Userservices ser = Userservices();
                  final save = UserModel(
                      email: emailCtrl.text,
                      name: nameCrtl.text,
                      password: passwordCtrl.text,
                      username: usernameCtrl.text);
                  ser.register(save, context);
                },
                child: Text("submit")),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text("already have an account??"))
        ],
      ),
    );
  }
}
