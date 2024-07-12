import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projecta/Admin.dart';
import 'package:projecta/AdminLogin.dart';
import 'package:projecta/Maps.dart';
import 'package:projecta/services_page.dart';

import 'Feedback.dart';
import 'booking_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      body: Stack(
        children:<Widget> [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Colors.black,
              image:DecorationImage(
                  alignment: Alignment.centerLeft,
                  image: AssetImage("asset/images/smoke.png")),
            ),
          ),
          SafeArea(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children:<Widget> [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image:DecorationImage(
                            image: AssetImage("asset/images/p7.webp"),fit: BoxFit.cover),
                      ),

                    ),
                  ),
                  Text('  SlickyRick\nServing with Quality.',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 34,
                    letterSpacing: 1.2,
                  )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                    decoration: BoxDecoration(color: Colors.white,
                        borderRadius: BorderRadius.circular(29.5)),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children:<Widget> [
                        CategoryCard(
                          title:"Bookings",
                          photo: "asset/images/p1.jpg",
                          press: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesPage()));

                          },

                        ),
                        CategoryCard(
                          title:"Services",
                          photo: "asset/images/p2.jpg",
                          press: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingPage()));
                          },

                        ),
                        CategoryCard(
                          title:"Our Location",
                          photo: "asset/images/p3.jpg",
                          press: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>  GoogleMapScreen()));

                          },

                        ),
                        CategoryCard(
                          title:"Rate us",
                          photo: "asset/images/p6.jpg",
                          press: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFeedback()));
                          },
                        ),

                                  CategoryCard(
                                    title:"Admin Panel",
                                    photo: "asset/images/p8.jpeg",
                                    press: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminLogin()));
                                    },
                                  ) ,

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String photo;
  final String title;
  final void Function()? press;

  const CategoryCard({
    Key? key,
    required this.photo,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              offset: Offset(17, 0),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.grey.withOpacity(0.4),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  Image.asset(photo), // Use Image.asset instead of SvgPicture.asset
                  Spacer(),
                  Text(
                    title,
                    style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}