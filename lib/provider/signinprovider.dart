import 'package:flutter/cupertino.dart';

class SignInProvider with ChangeNotifier {
  late String email, password;
  // late String cat_id;
  late String cat_des;
  late String cat_name;
  late String cat_path;




  String get getEmail {
    return email;
  }
  // String get getcatid{
  //   return cat_id;
  // }
    String get getcatname{
    return cat_name;
  }
    String get getcatdesc{
    return cat_des;
  }
    String get getcatpath{   return cat_path;
  }

  String get getPassword {
    return password;
  }

  void setEmail(var value) {
    this.email = value;
    ChangeNotifier();
  }

  void setcatname(var value) {
    this.cat_name = value;
    ChangeNotifier();
  }
  void setcatdesc(var value) {
    this.cat_des = value;
    ChangeNotifier();
  }
  void setcatImage(var value) {
    this.cat_path = value;
    ChangeNotifier();
  }
 
}
