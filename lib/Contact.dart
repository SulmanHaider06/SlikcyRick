import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
        child:Container(
          height: 400,
          width: 400,
          child: Column(
       children:[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 400,
                child: Text('Phone no :03165692827',style: TextStyle(fontSize:25,backgroundColor: Colors.grey,fontWeight: FontWeight.bold),)),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('Address :Shop no:134 ,Street no:6 ,Sector:G9/4 Islamabad',style: TextStyle(fontSize:25,backgroundColor: Colors.grey,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('Email Address :210991@students.au.edu.pk',style: TextStyle(fontSize:25,backgroundColor: Colors.grey,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text('Email Address :210967@students.au.edu.pk',style: TextStyle(fontSize:25,backgroundColor: Colors.grey,fontWeight: FontWeight.bold),),
          ),
     ],
      ),
      ),
      ),
    );
  }
}
