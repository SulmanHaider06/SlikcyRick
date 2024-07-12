import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:projecta/SignInScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  initState()
  {
    super.initState();
    //setting time for loading the new image
    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SignInScreen()));
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Lottie.network('https://assets3.lottiefiles.com/packages/lf20_jvlBSF.json'),
            ),
          SizedBox(
            height: 20,
          ),
          Text("SlickyRick",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold ),),
        ],
      ),
    ),

    );
  }
}


