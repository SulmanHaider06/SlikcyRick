import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projecta/color_utils.dart';
import 'package:projecta/reusable_widget.dart';

import 'Admin.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(gradient: LinearGradient(
          colors: [hexStringToColor("FFFFFF"),
        hexStringToColor("666666"),
        hexStringToColor("000000")
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.fromLTRB(20, MediaQuery
            .of(context)
            .size
            .height * 0.2, 20, 0),
          child: Column(
            children: <Widget>[
              logoWidget("asset/images/p9.png"),
              Text("Admin",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color:Colors.white),),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Email",Icons.person_outline,false,
                  _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
                  _passwordTextController),
              const SizedBox(
                height: 20,
              ),
              SignInSignUpButton(context, true,(){
                FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailTextController.text,
                    password: _passwordTextController.text)
                    .then((value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Admin()));
                }).onError((error, stackTrace) {
                  print("error: ${error.toString()}");
                });
              } ),

            ],
          ),
        ),
      ),
    ),
    );
  }
  }

