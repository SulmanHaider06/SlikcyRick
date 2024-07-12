import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecta/SignInScreen.dart';
import 'package:projecta/reusable_widget.dart';
import 'color_utils.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _userNameTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Sign Up",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: LinearGradient(colors: [hexStringToColor("FFFFFF"),
          hexStringToColor("666666"),
          hexStringToColor("000000")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(child: Padding(
          padding: EdgeInsets.fromLTRB(
              20,120, 20, 0),
          child: Column(
            children:<Widget>[
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter username", Icons.person_outline,false,
                  _userNameTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter email-ID",Icons.email,false,
                  _emailTextController),
              SizedBox(
                height: 20,
              ),
              reusableTextField("Enter Password", Icons.lock_outline, true,
                  _passwordTextController),



                  SignInSignUpButton(context, false,(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: _emailTextController.text, password: _passwordTextController.text)
        .then((value) {
          print(Text("New Account Successfully Created",style: TextStyle(fontWeight: FontWeight.bold),));
    Navigator.push(context,
    MaterialPageRoute(builder: (context) =>SignInScreen()));
    }).onError((error, stackTrace) {
    print("error: ${error.toString()}");
    });
    } ),
            ],
          ),
        ),),
      ),
    );

  }
}