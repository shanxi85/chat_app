import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  // we will link this controller with the textfiled
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: "Username"),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(hintText: "Password"),
          ),
          FlatButton(
            child: Text("Register"),
            onPressed: () async {
              FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
                      email: emailController.text.trim(),
                      password: passwordController.text))
                  .user;
              if (user != null) {
                //add new data inside the database
                //the data will be stored inside
                Firestore.instance.collection("users").document(user.uid).setData({
                  'email':user.email,
                  'id':user.uid,
                  'createdAt':DateTime.now(),
                  'chattingWith':null
                });


                print("Success");
              } else {
                print("Fail");
              }
            },
          )
        ],
      ),
    );
  }
}
