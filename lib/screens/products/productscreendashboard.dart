import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/controllers/ProductController.dart';
import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
import 'package:letzswap_dashboard/models/productmodels/productVm.dart';
import 'package:letzswap_dashboard/models/productmodels/productmodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/responsive.dart';
import 'package:letzswap_dashboard/screens/products/components/productdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/productupdate.dart';

class ProductScreenDashboard extends StatefulWidget {
  const ProductScreenDashboard({Key? key}) : super(key: key);

  @override
  _ProductScreenDashboardState createState() => _ProductScreenDashboardState();
}

class _ProductScreenDashboardState extends State<ProductScreenDashboard> {
  SigninModel? token;
  List<dynamic>? productImages = [];
  Future? _bookmarkfuture;
  int? bookmarkcount;

  @override
  void initState() {
    // setState(() {
    gettoken();

    // });

    super.initState();
  }

  gettoken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? newtoken = sharedPreferences.getString("token");
    setState(() {
      token = SigninModel.fromJsonModel(jsonDecode(newtoken!));
      // _bookmarkfuture=ProductController().getproductbookmarks(token!.result.accessToken).then((value) =>
      // bookmarkcount=value.result.length
      // );
      //  resulttoken=token!.result.accessToken;
    });
  }

  Future<AllProducts> getAllproducts() async {
    var newUrl = Uri.http(BASEURL.baseurl, "/api/product/ProductList");

    final response = await get(newUrl, headers: {
      //  HttpHeaders.authorizationHeader: 'Bearer $token',
      'Authorization': 'Bearer ${token!.result.accessToken}',
    });

    if (response.statusCode == 200) {
      var res = json.decode(response.body);

      var model = AllProducts.fromJson(res);

      return model;
    } else {
      return json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    fillColor: bgColor,
                    hintStyle: TextStyle(color: Colors.black),
                    filled: true,
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 20,
                        width: 40,
                        margin: EdgeInsets.symmetric(
                            horizontal: defaultPadding / 2),
                        decoration: BoxDecoration(
                          color: colormain,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                        ),
                        child: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: bgColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.sort,
                  color: secondaryColor,
                ),
                label: Text(
                  "Sorting",
                  style: TextStyle(color: secondaryColor),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: bgColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(
                  Icons.filter_list,
                  color: secondaryColor,
                ),
                label: Text(
                  "Filter",
                  style: TextStyle(color: secondaryColor),
                ),
              ),
              SizedBox(
                width: 50,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: colorChartUserStatIndicator,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                icon: Icon(Icons.insights),
                label: Text("Insights"),
              ),
              SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: colormain,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {
                  //                    Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CreateMainCategory()),
                  // );
                },
                icon: Icon(Icons.add),
                label: Text("Any"),
              ),
            ],
          ),
          Text(
            "Product List",
            style: TextStyle(color: bgColor),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
              child: FutureBuilder<AllProducts>(
            future: getAllproducts(),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.grey.withOpacity(0.5)),
                        columns: <DataColumn>[
                          DataColumn(
                            label: Text(
                              'Product Name',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Description',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Category',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Product Visitors',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Tags',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Product Worth',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Product Attachment',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Product Open To',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Bookmark',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              'Actions',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                        rows: snapShot.data!.result.map<DataRow>((e) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(Text(e.productName.toString())),
                              DataCell(Text('${e.description}')),
                              DataCell(Text('${e.categoryId}')),
                              DataCell(Text('${e.productVisits}')),
                              DataCell(Text('${e.tags}')),
                              DataCell(Text('${e.productworth}')),
                              DataCell(Text('${e.productAttachments.length}')),
                              DataCell(Text(e.productOpenTo.length.toString())),
                              DataCell(Text(bookmarkcount.toString())),
                              DataCell(Row(
                                children: [
                                  TextButton.icon(
                                    icon: Icon(Icons.details),
                                    label: Text(''),
                                    onPressed: () {
                                      var model = new ProductVm(
                                        id: e.id,
                                        categoryId: e.categoryId,
                                        productName: e.productName,
                                        productdescription: e.description,
                                        producttags: e.tags,
                                        productWorth: e.productworth,
                                        productOpenTo: e.productOpenTo,
                                        attachments: e.productAttachments,
                                        // deletedattachments: null,
                                        // deletedopento: null
                                      );
                                      showDialog(
                                      context: context,
                                      builder: (_) {
                                        return ProductDetails(model: model, newtoken: token!
                                                    .result.accessToken
                                                    .toString());
                                      
                                        
                                      });
                                    },
                                  ),
                                  TextButton.icon(
                                    icon: Icon(Icons.delete),
                                    label: Text(''),
                                    onPressed: () {
                                      ProductController()
                                          .deleteProduct(
                                              token!.result.accessToken, e.id)
                                          .whenComplete(() => setState(() {}));
                                    },
                                  ),
                                  TextButton.icon(
                                      icon: Icon(Icons.edit),
                                      label: Text(''),
                                      onPressed: () {
                                        var model = new ProductVm(
                                          id: e.id,
                                          categoryId: e.categoryId,
                                          productName: e.productName,
                                          productdescription: e.description,
                                          producttags: e.tags,
                                          productWorth: e.productworth,
                                          productOpenTo: e.productOpenTo,
                                          attachments: e.productAttachments,
                                          // deletedattachments: null,
                                          // deletedopento: null
                                        );
                                        showDialog(
                                            context: context,
                                            builder: (context) => ProductUpdate(
                                                model: model,
                                                newtoken: token!
                                                    .result.accessToken
                                                    .toString()));
                                        //   Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //           builder: (context) => ProductUpdate(
                                        //               model: model,
                                        //               newtoken: token!
                                        //                   .result.accessToken
                                        //                   .toString())));
                                      }),
                                   
                                ],
                              )),
                            ],
                          );
                        }).toList(),
                      ),
                    ));
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
        ]));
  }
}
