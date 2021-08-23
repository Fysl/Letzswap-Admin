// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:letzswap_dashboard/constants.dart';
// import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
// import 'package:letzswap_dashboard/responsive.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StoreScreen extends StatefulWidget {
//   const StoreScreen({ Key? key }) : super(key: key);

//   @override
//   _StoreScreenState createState() => _StoreScreenState();
// }

// class _StoreScreenState extends State<StoreScreen> {
// SigninModel? token;

// @override
//   void initState() {
//      setState(() {
//      gettoken();
//     });
     
//     super.initState();
//   }

//   gettoken() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     String? newtoken = sharedPreferences.getString("token");
//     setState(() {
//       token = SigninModel.fromJsonModel(jsonDecode(newtoken!));
//   //  resulttoken=token!.result.accessToken;
      
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//       padding: EdgeInsets.all(defaultPadding),
//               decoration: BoxDecoration(
//                 color: secondaryColor,
//                 borderRadius: const BorderRadius.all(Radius.circular(10)),
//               ),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                 Row(
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 300,
//                       child: TextField(
//                         decoration: InputDecoration(
//                           hintText: "Search",
//                           fillColor: bgColor,
//                           hintStyle: TextStyle(color: Colors.black),
//                           filled: true,
//                           suffixIcon: InkWell(
//                             onTap: () {},
//                             child: Container(
//                               height: 20,
//                               width: 40,
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: defaultPadding / 2),
//                               decoration: BoxDecoration(
//                                 color: colormain,
//                                 borderRadius:
//                                     const BorderRadius.all(Radius.circular(15)),
//                               ),
//                               child: Icon(Icons.search),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 50,
//                     ),
//                     ElevatedButton.icon(
//                       style: TextButton.styleFrom(
//                         backgroundColor: bgColor,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: defaultPadding * 1.5,
//                           vertical:
//                               defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
//                         ),
//                       ),
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.sort,
//                         color: secondaryColor,
//                       ),
//                       label: Text(
//                         "Sorting",
//                         style: TextStyle(color: secondaryColor),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     ElevatedButton.icon(
//                       style: TextButton.styleFrom(
//                         backgroundColor: bgColor,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: defaultPadding * 1.5,
//                           vertical:
//                               defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
//                         ),
//                       ),
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.filter_list,
//                         color: secondaryColor,
//                       ),
//                       label: Text(
//                         "Filter",
//                         style: TextStyle(color: secondaryColor),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 50,
//                     ),
//                     ElevatedButton.icon(
//                       style: TextButton.styleFrom(
//                         backgroundColor: colorChartUserStatIndicator,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: defaultPadding * 1.5,
//                           vertical:
//                               defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
//                         ),
//                       ),
//                       onPressed: () {},
//                       icon: Icon(Icons.insights),
//                       label: Text("Insights"),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     ElevatedButton.icon(
//                       style: TextButton.styleFrom(
//                         backgroundColor: colormain,
//                         padding: EdgeInsets.symmetric(
//                           horizontal: defaultPadding * 1.5,
//                           vertical:
//                               defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
//                         ),
//                       ),
//                       onPressed: () {
//       //                    Navigator.push(
//       //   context,
//       //   MaterialPageRoute(builder: (context) => CreateMainCategory()),
//       // );
//                       },
//                       icon: Icon(Icons.add),
//                       label: Text("Any"),
//                     ),
//                   ],
//                 ),
//                 Text(
//                   "Product List",
//                   style: TextStyle(color: bgColor),
//                 ),
//                 SizedBox(height: 15,),
//                 Container(
//                   child: FutureBuilder<AllProducts>(
//                 future: ProductController().getAllproducts(token!.result.accessToken.toString()),
//                 builder: (context, snapShot) {                
//                   if (snapShot.hasData) {
//                     return SingleChildScrollView(
//                       scrollDirection: Axis.horizontal,
//                       child: DataTable(
//                         headingRowColor:
//         MaterialStateColor.resolveWith((states) => Colors.white.withOpacity(0.1)),
//                         columns: <DataColumn>[
//                           DataColumn(
//                             label: Text(
//                               'Product Name',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Description',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Category',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Product Visitors',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Tags',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                            DataColumn(
//                             label: Text(
//                               'Product Worth',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                           DataColumn(
//                             label: Text(
//                               'Product Attachment',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                            DataColumn(
//                             label: Text(
//                               'Product Open To',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                               DataColumn(
//                             label: Text(
//                               'Actions',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                         ],
//                         rows: snapShot.data!.result.map<DataRow>((e) {
                        
//                           return DataRow(
//                             cells: <DataCell>[
//                               DataCell(Text(e.productName.toString())),                            
//                               DataCell(Text('${e.description}')),
//                                DataCell(Text('${e.categoryId}')),
//                                 DataCell(Text('${e.productVisits}')),
//                                 DataCell(Text('${e.tags}')),
//                                    DataCell(Text('${e.productworth}')),
//                                     DataCell(Text('${e.productAttachments[0].attachUrl}')),
                                                           
//                                DataCell(Row(
//                                   children: [
//                                     TextButton.icon(
//                     icon: Icon(Icons.block),
//                     label: Text(''),
//                     onPressed: () {
                   
                  
//                     },
//                   ),
//                   TextButton.icon(
//                     icon: Icon(Icons.edit),
//                     label: Text(''),
//                     onPressed: () {
                                   
               
//                     }),
//                                   ],
//                                 )),
//                             ],
//                           );
//                         }).toList(),
//                       ),
//                     );
//                   }else{
//                     return CircularProgressIndicator();
//                   }
//                 },
//               )),
               
//               ]
              
//               )
      
//     );
//   }
// }