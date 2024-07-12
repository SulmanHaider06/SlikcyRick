import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projecta/Maps.dart';
import 'package:projecta/Feedback.dart';
import 'package:projecta/SignInScreen.dart';

import 'Contact.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late GoogleMapController googleMapController;
  final LatLng coordinates =LatLng(30.3753, 69.3451);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white70,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(accountName: Text("Sulman Haider"),
              accountEmail:Text("sulmanhaider301@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:new AssetImage("asset/images/p4.jpg"),
            ),
            decoration: BoxDecoration(
              image:DecorationImage(
              image:new AssetImage("asset/images/p5.jpg"),fit: BoxFit.cover,
            ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout",style: TextStyle(fontSize: 15),),
            onTap: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));

            },
          ),
        ],
    ),
    );
  }
}
