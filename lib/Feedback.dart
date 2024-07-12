import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyFeedback extends StatefulWidget {
  const MyFeedback({Key? key}) : super(key: key);

  @override
  State<MyFeedback> createState() => _MyFeedbackState();
}

class _MyFeedbackState extends State<MyFeedback> {
  double rate=0.0;
  late DatabaseReference dbRef;


  void initState()
  {
    super.initState();
    dbRef=FirebaseDatabase.instance.ref().child('Feedbacks');
  }

  String feedbackText = '';

  void updateFeedbackText() {
    setState(() {
      feedbackText = "Thank you for your feedback";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Feedback',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Padding(
               padding: EdgeInsets.all(10),
             child:InkWell(
               onTap: (){
                 updateFeedbackText();
               },
               child:starRate(),
             ),

             
           ) ,
            Text('Rate us',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)

          ],
        ),
      ),
    );
  }
  starRate()
  {
    return RatingBar.builder(
      initialRating: 1,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 6,
      itemPadding:const EdgeInsets.symmetric (horizontal: 6),
      itemBuilder: (context, _)=> const Icon(Icons.star,color: Colors.amber,),
      onRatingUpdate: (rating) {
        setState(() {
          rate=rating;
  Map<String,String> feedback ={
             "Feedback":rating.toString(),
       };
          dbRef.push().set(feedback);
          feedbackText = "Thank you for your feedback";
        });
        debugPrint(rating.toString());
      },
    // onRatingUpdate: (rating)=> debugPrint(rating.toString()),
    );
  }
  double rates()
  {
    return rate;
  }
}
