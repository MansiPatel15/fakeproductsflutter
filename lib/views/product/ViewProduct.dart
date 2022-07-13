import 'dart:math';

import 'package:fakeproducts/helpers/ApiHandler.dart';
import 'package:fakeproducts/helpers/error_handler.dart';
import 'package:fakeproducts/models/Products.dart';
import 'package:fakeproducts/resources/StyleResources.dart';
import 'package:fakeproducts/resources/UrlResources.dart';
import 'package:flutter/material.dart';

class ViewProduct extends StatefulWidget {

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  List <Products>alldata;

  getdata()async{
    try{
      await ApiHandler.get(UrlResource.VIEW).then((json) {
        print(json);
        setState(() {
          alldata = json
              .map<Products>((obj) => Products.fromJson(obj))
              .toList();
        });
      });
    }
    on ErrorHandler catch (ex) {
      if (ex.code.toString() == "500") {
        print(Text("no connection"));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  List colors = [
    Colors.greenAccent.shade100,
    Colors.purple.shade100,
    Colors.blue.shade100
  ];
  Random random = new Random();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ViewProduct"),
      ),
      body: SafeArea(
        child: (alldata != null)
            ? ListView.builder(
          itemCount: alldata.length,
          itemBuilder: (context, index) {
            var i = random.nextInt(3);
            return GestureDetector(
              onTap: () {
              },
              child:Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: colors[i]),
                  width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.all(5),
                          child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(alldata[index].image.toString(),width: 100,),
                          SizedBox(height: 10,),
                          Text("Title :  "+alldata[index].title.toString()),
                          Text("Price :  "+alldata[index].price.toString()),
                          Text("Category :  "+alldata[index].category.toString()),
                          Text("Description :  "+alldata[index].description.toString()),
                          Text("Rate  :  "+alldata[index].rating.rate.toString()),
                        ],
                      )
                      )
                    ),
                ),
              );
          },
        )
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
