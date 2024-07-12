import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projecta/color_utils.dart';
import 'package:projecta/reusable_widget.dart';

class Update extends StatefulWidget {
  const Update({Key? key, this.customerkey}) : super(key: key);
  final customerkey;

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
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
    getcustomerdata();
  }
  void getcustomerdata ()
  async {
    DataSnapshot snapshot = await dbRef.child(widget.customerkey).get();
    Map customer=snapshot.value as Map;
    setState(() {
      _userNameTextController.text=customer['Name'];
      _emailTextController.text=customer['Email-ID'];
      _passwordTextController.text=customer['Password'];
      _CarServiceTextController.text=customer['Car Service'];
      _timingsTextController.text=customer['Timings'];
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(

        // child: Padding(
        // padding: EdgeInsets.fromLTRB(
        //   20,120, 20, 0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [hexStringToColor("CB2B43"),
              hexStringToColor("1B0613"),
              hexStringToColor("A4A4A4")
            ],
          ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SingleChildScrollView(child: Padding(
                padding: EdgeInsets.fromLTRB(
                    50,10, 50, 200),
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
                    reusableTextField("Enter Car Service", Icons.car_repair, false,
                        _CarServiceTextController),
                    SizedBox(
                      height: 20,
                    ),
                    reusableTextField("Enter Timings", Icons.access_time, false,
                        _timingsTextController),
                    ElevatedButton(
                      onPressed: () {
                        Map<String,String> customers ={
                          'Name':_userNameTextController.text,
                          'Email-ID':_emailTextController.text,
                          'Password':_passwordTextController.text,
                          'Car Service':_CarServiceTextController.text,
                          'Timings':_timingsTextController.text,
                        };
                        dbRef.child(widget.customerkey).update(customers).
                        then((value) => {
                          Navigator.pop(context)
                        });
                      },
                      child: Text("Updated Data"),
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
