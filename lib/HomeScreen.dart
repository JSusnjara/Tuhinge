import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuhinge/database.dart';
import 'package:tuhinge/models/seller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState() {
    return _HomeScreen();
  }

}

class _HomeScreen extends State<HomeScreen>{

  List<Seller> sellers = [];
  late Database database;

  @override
  void initState() {
    database = Database();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            ElevatedButton(onPressed: () async {
              sellers = await database.getAllSellers();
              setState(() {

              });
            },
                child: Text("Get Sellers")
            ),
            ElevatedButton(onPressed: () async {
              Seller seller = Seller(email: "hueduhedhudj@mail.com",
                  first_name: "John", last_name: "Cena",
                  address: "HSUJSJ 52552", latitude: 120, longitude: 36,
                  delivery_radius: 30);
              await database.addSeller(seller);
            },
                child: Text("Add seller")
            ),
            ElevatedButton(onPressed: () async {
              Seller seller = sellers[0];
              seller.last_name = seller.last_name + "_updated";
              await database.updateSeller(seller);
            },
                child: Text("Update seller")
            ),
            Expanded(
              flex: 3,
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: sellers.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      height: 50,
                      color: Colors.amber,
                      child: Center(
                        child: Text(sellers[index].last_name),
                      ),
                    );
              }),
            )
          ],
        ),
      ),
    );
  }

}