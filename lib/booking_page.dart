import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projecta/color_utils.dart';
import 'package:projecta/reusable_widget.dart';

import 'Fetching.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage>{
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _userNameTextController=TextEditingController();
  TextEditingController _CarServiceTextController=TextEditingController();
  TextEditingController _timingsTextController=TextEditingController();
  late DatabaseReference dbRef;


  void initState()
  {
    super.initState();
    dbRef=FirebaseDatabase.instance.ref().child('Customers');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Container(

       // child: Padding(
         // padding: EdgeInsets.fromLTRB(
           //   20,120, 20, 0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                hexStringToColor("FFFFFF"),
                hexStringToColor("000000"),
                hexStringToColor("666666"),

              ],
            ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment:Alignment.topCenter ,
                  child: Text('Customer \nBooking Panel',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 34,
                    letterSpacing: 1.2,
                  )),
                ),
                logoWidget("asset/images/p10.png"),

                SingleChildScrollView(child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
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
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Enter Car Service", Icons.car_repair, true,
                          _CarServiceTextController),
                      SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Enter Timings", Icons.access_time, true,
                          _timingsTextController),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Map<String,String> customers ={
                              'Name':_userNameTextController.text,
                              'Email-ID':_emailTextController.text,
                              'Password':_passwordTextController.text,
                              'Car Service':_CarServiceTextController.text,
                              'Timings':_timingsTextController.text,
                            };
                            dbRef.push().set(customers);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Fetching()),
                            );
                          },
                          child: Text("OK",style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ],
                  ),
               ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}