import 'package:projecta/Contact.dart';
import 'package:projecta/Feedback.dart';
import 'package:projecta/home_page.dart';
import 'package:projecta/NavBar.dart';
import 'package:projecta/services_page.dart';
import 'package:projecta/booking_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> with SingleTickerProviderStateMixin {
  GlobalKey<CurvedNavigationBarState> Navkey = GlobalKey ();
  final screens=[BookingPage(),HomePage(),ServicesPage() ];
  int index=1;

  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this,initialIndex:0);
  }

  @override
  Widget build(BuildContext context) {

    final items=<Widget>[
      Icon(Icons.person,size: 40),
      Icon(Icons.home,size: 40),
      Icon(Icons.view_list_outlined,size: 40),
    ];
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white24,
        title:  Text("SlickyRick motors",style: TextStyle(color: Colors.blueGrey),),
     //   InkWell(
       //   onTap: () {
         //   Navigator.push(context,MaterialPageRoute(builder: (context)=>NavBar()));
          //},
          //child: Icon(Icons.list),
        //),
        actions: <Widget>[
          PopupMenuButton(color:Colors.blue,itemBuilder: (BuildContext context)
          {


            return
              [
                 PopupMenuItem(child: InkWell(onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFeedback()));

                },child: Text("Rate Us"))),

                PopupMenuItem(child: InkWell(onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact()));

                },child: Text("Contact"))),

              ];
          }
          )
        ],
        // bottom: TabBar(
        //   labelColor: Colors.white,
        //   indicatorColor: Colors.lightGreenAccent,
        //   controller: _controller,
        //   tabs: [
        //     Tab(
        //       icon: Icon(Icons.home),
        //     ),
        //     Tab(
        //       icon: Icon(Icons.call),
        //     ),
        //     Tab(
        //       icon: Icon(Icons.location_on),
        //     ),
        //
        //   ],
        // ),

      ),
      //////////////////////

//////////////////////////////
      bottomNavigationBar: CurvedNavigationBar(
        key: Navkey,
        buttonBackgroundColor: Colors.blueGrey,
        backgroundColor: Colors.transparent,
        height: 60,
        index: index,
        items: items,
        onTap: (index) {
          setState(() => this.index = index);
        },
        animationCurve: Curves.fastLinearToSlowEaseIn, color: Colors.black12,
      ),
      body: screens[index],
    );
  }
}