import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const AdminFetch());
}

class AdminFetch extends StatelessWidget {
  const AdminFetch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RealTimeData(),
    );
  }
}

class RealTimeData extends StatelessWidget {
  RealTimeData({Key? key}) : super(key: key);
  final ref = FirebaseDatabase.instance.ref('Customers');
  DatabaseReference reference = FirebaseDatabase.instance.ref('Customers');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booked Data"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, DataSnapshot snapshot, Animation<double> animation, int index) {
                var customer = snapshot.value;
                return Card(
                  color: Color.fromARGB(61, 229, 206, 134),
                  child: Container(
                    height: 120,
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 16), // Adjust the vertical padding
                      title: Text(snapshot.child('Car Service').value.toString()),
                      subtitle: Text(snapshot.child("Email-ID").value.toString()),
                      trailing:Column(
                        children: [
                          Text(snapshot.child("Name").value.toString()),
                          InkWell(
                            onTap: ()
                            {
                              reference.child(snapshot.key!).remove();
                            },
                            child:Icon(Icons.delete,color: Colors.redAccent),
                          ),

                        ],
                      ),

                      leading:
                          Text(snapshot.child("Timings").value.toString()),
                    ),
                  ),
                );
                // your code here
              },
            ),
          ),
        ],
      ),
    );
  }
}
