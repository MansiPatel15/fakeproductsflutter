import 'package:fakeproducts/views/employee/ViewEmployee.dart';
import 'package:fakeproducts/views/product/AddProduct.dart';
import 'package:fakeproducts/views/product/ViewProduct.dart';
import 'package:flutter/material.dart';

import '../employee/AddEmployee.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      drawer : Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  child: Text("M",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                ),
                accountName: Text("Mansi Patel"),
                accountEmail: Text("mansippatel.0105@gmail.com")
            ),
            ListTile(
              title: Text("AddEmployee"),
              leading: Icon(Icons.person_add),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddEmployee())
                );
              },
            ),
            ListTile(
              title: Text("ViewEmployee"),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewEmployee())
                );
              },
            ),
            ListTile(
              title: Text("AddProduct"),
              leading: Icon(Icons.production_quantity_limits_outlined),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>AddProduct())
                );
              },
            ),
            ListTile(
              title: Text("ViewProduct"),
              leading: Icon(Icons.production_quantity_limits_rounded),
              trailing: Icon(Icons.arrow_right_alt),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ViewProduct())
                );
              },
            )

          ],
        ),
      ),

    );
  }
}
