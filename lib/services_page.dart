import 'package:flutter/material.dart';
import 'package:projecta/booking_page.dart';

import 'color_utils.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Services",style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white70),),
        centerTitle: true,
        actions:<Widget> [
          Icon(Icons.notification_important),
        ],
      ),
      body: Container(
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
          child:Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
            Container( height:20.0,),
            Text("Categories",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 42,
              fontFamily:'Varelra',
            ),
            ),
              SizedBox( height:20.0),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                width: MediaQuery.of(context).size.width-30,
               height: MediaQuery.of(context).size.width-50,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  primary: false,
                  mainAxisSpacing: 15,
                  childAspectRatio: 0.8,
                  children: <Widget>[
                    CategoryCard(photo: "asset/images/oil.jpeg", title: "Oil Change", press: (){

                    }, price: '3000Rs',
                    ),
                    CategoryCard(photo: "asset/images/tuning1.jpeg", title: "Tuning", press: (){

                    }, price: '3000Rs',
                    ),
                    CategoryCard(photo: "asset/images/p6.jpg", title: "Tire change", press: (){

                    }, price: '3500Rs',
                    ),
                    CategoryCard(photo: "asset/images/airfilter.jpeg", title: "Air Filter Replacement", press: (){

                    }, price: '1000Rs',
                    ),
                    CategoryCard(photo: "asset/images/spark.jpeg", title: "Spark Plug Replacement", press: (){

                    }, price: '800Rs',
                    ),
                    CategoryCard(photo: "asset/images/wiper.jpeg", title: "Wiper Replacement", press: (){

                    }, price: '1800Rs',
                    ),

                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServicesPage(),
                    ),
                  );
                },
                child: Text(
                  'CUSTOMER RECORD',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Spacer()
            ],
          ),
      ),
    );
  }
}
class CategoryCard extends StatelessWidget {
  final String photo;
  final String title;
  final String price;
  final void Function()? press;

  const CategoryCard({
    Key? key,
    required this.photo,
    required this.title,
    required this.press, required this.price,
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
                  Spacer(),
                  Text(
                    price,
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
