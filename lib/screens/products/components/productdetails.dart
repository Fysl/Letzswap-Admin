import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/models/productmodels/productVm.dart';
import 'package:letzswap_dashboard/responsive.dart';

class ProductDetails extends StatefulWidget {
  final ProductVm model;
  final String? newtoken;
  const ProductDetails({
    Key? key,
    required this.model,
    required this.newtoken,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() =>
      _ProductDetailsState(model: model, newtoken: newtoken);
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductVm model;
  String? newtoken;
  dynamic flag;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  // final _formKey = GlobalKey<FormState>();

  _ProductDetailsState({required this.model, required this.newtoken});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        backgroundColor: bgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Product Details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // passing true
              child: Icon(Icons.close),
            ),
          ],
        ),
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [Text("Product ID"), Text(model.id.toString())],
                  ),
                  Row(
                    children: [Text("Posted On"), Text(model.productName)],
                  )
                ],
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: colormain,
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 1.5,
                    vertical:
                        defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Action",
                  style: TextStyle(color: secondaryColor),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Column(
                children: [
                  Text(""),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      autoPlay: false,
                    ),
                    items: imgList
                        .map(
                          (item) => Center(
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  Row(
                    children: [
                      Text("OpenTo"),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            child: Center(child: Text('Dummy Card Text')),
                          ),
                        ),
                      ),
                      Text("Tags"),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 15,
                          itemBuilder: (BuildContext context, int index) =>
                              Card(
                            child: Center(child: Text('Tags')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: secondaryColor,
                      ),
                      Text("User Name"),
                      Icon(Icons.person)
                    ],
                  ),
                  Row(
                    children: [
                      Text('Karachi,Sindh'),
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: bgColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        label: Text(
                          '4.9',
                          style: TextStyle(color: colorChartDownloadMain),
                        ),
                        icon: Icon(
                          Icons.star,
                          color: colorChartDownloadMain,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Container(
                    child: Card(
                      color: Color(0xFFF5F6FA),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('95%',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Text('Positive Rating',
                                    style: TextStyle(fontSize: 10))
                              ],
                            ),
                            Text('|'),
                            Column(
                              children: [
                                Text('43',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                                Text('Number Of Exchange',
                                    style: TextStyle(fontSize: 10))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text('Description'), 
            Text(model.productdescription)
            ],
          )
        ]);
  }
}
