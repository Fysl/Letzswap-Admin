// import 'dart:convert';

// import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import 'package:letzswap_dashboard/constants.dart';
// import 'package:letzswap_dashboard/controllers/UserController.dart';
// import 'package:letzswap_dashboard/helpers/BaseUrl.dart';
 
// import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
// import 'package:letzswap_dashboard/models/usermodel/userlist.dart';
// import 'package:letzswap_dashboard/responsive.dart';

// // class RecentFiles extends StatelessWidget {
// //   const RecentFiles({
// //     Key? key,
// //   }) : super(key: key);
// class RecentFiles extends StatefulWidget {
//   const RecentFiles({Key? key}) : super(key: key);

//   @override
//   _RecentFilesState createState() => _RecentFilesState();
// }

// class _RecentFilesState extends State<RecentFiles> {
      
//       Future< List<Data>>? listData;
     
 

//   @override
//   void initState() {
//     super.initState();
//     _populatelist();
// //  listData=UserController.getUserList();
// //  print(listData);
       
//   }
  
//   void _populatelist() {
   
//    UserController.getUserList().then((data) => {
//       setState(() => {
//         listData = data as Future<List<Data>>
//         // print(listData)
//       })
//     });

//   }

//   @override
//   Widget build(BuildContext context) {
//     return CircularProgressIndicator();
    
     
// }

// }
// // DataRow recentFileDataRow(Data fileInfo) {
// //   return DataRow(
// //     cells: [
// //       DataCell(
// //         Row(
// //           children: [
// //             Image.asset(
// //               fileInfo.userName,
// //               height: 30,
// //               width: 30,
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
// //               child: Text(fileInfo.email),
// //             ),
// //           ],
// //         ),
// //       ),
// //       DataCell(Text(fileInfo.email)),
// //       DataCell(Text(fileInfo.userName)),
// //     ],
// //   );
// // }

// // class RecentFile {
// //   final String? icon, title, date, size;

// //   RecentFile({this.icon, this.title, this.date, this.size});
// // }

// // List demoRecentFiles = [];

// // FutureBuilder<List<Data>>(
// //               future: futureData,
// //               builder: (context, snapshot) {
// //                 if (snapshot.hasData) {
// //                   List<Data>? data = snapshot.data;
// //                   return ListView.builder(
// //                       itemCount: data!.length,
// //                       itemBuilder: (BuildContext context, int index) {
// //                         return Container(
// //                           height: 75,
// //                           color: Colors.white,
// //                           child: Center(
// //                             child: Text(data[index].userName),
// //                           ),
// //                         );
// //                       });
// //                 } else if (snapshot.hasError) {
// //                   return Text("${snapshot.error}");
// //                 }
// //                 // By default show a loading spinner.
// //                 return CircularProgressIndicator();
// //               },
// //             );
