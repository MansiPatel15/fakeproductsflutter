import 'package:fakeproducts/helpers/ApiHandler.dart';
import 'package:fakeproducts/helpers/error_handler.dart';
import 'package:fakeproducts/models/Products.dart';
import 'package:fakeproducts/resources/UrlResources.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductView extends StatefulWidget {
  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  List<Products> alldata;

  var c = "#f5f5f5";

  getdata() async {
    try {
      await ApiHandler.get(UrlResource.VIEW).then((json) {
        print(json);
        setState(() {
          alldata =
              json.map<Products>((obj) => Products.fromJson(obj)).toList();
        });
      });
    } on ErrorHandler catch (ex) {
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

//  Random random = new Random();
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

                    Color color = HexColor.fromHex('#c51162');
                    //  var i = random.nextInt(3);
                    return GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              alldata[index].image.toString(),
                              height: 500,
                              width: 400,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(DateFormat("EEEE dd MMMM,yyyy").format(DateTime.parse("2022-06-05")).toString(),
                            // Text(DateFormat("EEEE dd MMMM,yyyy").format(DateTime.parse(alldata[index].date.tostring()).toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: color,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Container(
                                    width: 150,
                                    margin: EdgeInsets.only(
                                        left: 10, top: 5, right: 0, bottom: 0),
                                    child: Column(
                                      children: [
                                        Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.0),
                                            ),
                                            color: Colors.red,
                                            child: Column(
                                          children: [
                                            Container(
                                              child: Image.network(
                                                  alldata[index]
                                                      .image
                                                      .toString()),
                                            ),
                                          ],
                                        )),
                                        Text("ABC")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    margin: EdgeInsets.only(
                                        left: 10, top: 5, right: 0, bottom: 0),
                                    child: Column(
                                      children: [
                                        Card(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Image.network(
                                                      alldata[index]
                                                          .image
                                                          .toString()),
                                                ),
                                              ],
                                            )),
                                        Text("ABC")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    margin: EdgeInsets.only(
                                        left: 10, top: 5, right: 0, bottom: 0),
                                    child: Column(
                                      children: [
                                        Card(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Image.network(
                                                      alldata[index]
                                                          .image
                                                          .toString()),
                                                ),
                                              ],
                                            )),
                                        Text("ABC")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    margin: EdgeInsets.only(
                                        left: 10, top: 5, right: 0, bottom: 0),
                                    child: Column(
                                      children: [
                                        Card(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Image.network(
                                                      alldata[index]
                                                          .image
                                                          .toString()),
                                                ),
                                              ],
                                            )),
                                        Text("ABC")
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    margin: EdgeInsets.only(
                                        left: 10, top: 5, right: 0, bottom: 0),
                                    child: Column(
                                      children: [
                                        Card(
                                            child: Column(
                                              children: [
                                                Container(
                                                  child: Image.network(
                                                      alldata[index]
                                                          .image
                                                          .toString()),
                                                ),
                                              ],
                                            )),
                                        Text("ABC")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                          ],
                        ),
                      ),
                    );
                  })
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}