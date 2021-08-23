import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:letzswap_dashboard/components/btn.dart';
import 'package:letzswap_dashboard/constants.dart';
import 'package:letzswap_dashboard/controllers/signInAuthentication.dart';
import 'package:letzswap_dashboard/models/signinmodels/signingetmodel.dart';
import 'package:letzswap_dashboard/models/signinmodels/signinmodel.dart';
import 'package:page_transition/page_transition.dart';
import 'package:styled_text/styled_text.dart';
import 'package:the_validator/the_validator.dart';

import '../../responsive.dart';

class SigninDashboard extends StatefulWidget {
  SigninDashboard({Key? key}) : super(key: key);

  @override
  _SigninDashboardState createState() => _SigninDashboardState();
}

class _SigninDashboardState extends State<SigninDashboard> {
  late bool _passwordVisible;
  final _formKey = GlobalKey<FormState>();
  
  bool? variable = false;
  SigninModel? tokenmodel;
  bool remember = false;
  final focustext = FocusNode();
  TextEditingController temail = new TextEditingController();
  TextEditingController tpassword = new TextEditingController();

  // String? email;
  // String? password;
  final List<String> errors = [];
  @override
  void initState() {
    // TODO: implement initState
    _passwordVisible = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          child: LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
            if (MediaQuery.of(context).size.width * 0.5 > 25) {
              return Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(30),
                          child: SizedBox(
                            height: 650,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Image(
                              image: AssetImage('assets/images/splash.png'),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width * 0.03,
                  //   child: Container(
                  //     color: Colors.red,
                  //   ),
                  // ),
                  Expanded(
                    // child: Card(
                    //   color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                            height: 80,
                            width: 150,
                            child: Image.asset('assets/images/logo_blue.png')),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ////EMAIL FIELD

                        Text(
                          "Email Address",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                          SizedBox(height: 8,),
                        SizedBox(
                              width: 400,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: temail,
                                  focusNode: focustext,

                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13.0, color: Colors.grey[800]),
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    //labelText: 'Email Address',
                                    labelStyle: TextStyle(
                                        fontSize: 55, color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700]!,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]!,
                                        width: 2.0,
                                      ),
                                    ),
                                    //filled: true,
                                  ),
                                  // validator: (value) {
                                  //   if (value.isNotEmpty &&
                                  //       value.contains("@")||value.) {
                                  //     return null;
                                  //   } else {
                                  //     return 'Please enter valid email which contain @';
                                  //   }
                                  // },
                                  validator: (value) {
                                    if (value!.isNotEmpty &&
                                                    //     value.contains("@") &&
                                                    //     value.contains('.com') ||
                                                    // value.contains('.pk') ||
                                                    // value.contains('.edu') ||
                                                    // value.contains('.org') ||
                                                    // value.contains('.net') ||
                                                    // value.contains('.co') ||
                                                    // value.contains('.cc') ||
                                                    // value.contains('.com') ||
                                                    // value.contains('.gov') ||
                                                    // value.contains('.info') &&
                                                    //     !value.contains('admin') &&
                                                    //     !value.startsWith('admin') &&
                                                    //     !value.startsWith('Admin') &&
                                                    //     !value.endsWith('Admin') &&
                                                    //     !value.contains('Admin') &&
                                            !value.contains(' ')
                                        //&&
                                        //             !value.startsWith("0") &&
                                        //             !value.startsWith("1") &&
                                        //             !value.startsWith("2") &&
                                        //             !value.startsWith("3") &&
                                        //             !value.startsWith("4") &&
                                        //             !value.startsWith("5") &&
                                        //             !value.startsWith("6") &&
                                        //             !value.startsWith("7") &&
                                        //             !value.startsWith("8") &&
                                        //             !value.startsWith("9") &&
                                        //             !value.startsWith("10") &&
                                        //             !value.endsWith("1") &&
                                        //             !value.endsWith("2") &&
                                        //             !value.endsWith("3") &&
                                        //             !value.endsWith("4") &&
                                        //             !value.endsWith("5") &&
                                        //             !value.endsWith("6") &&
                                        //             !value.endsWith("7") &&
                                        //             !value.endsWith("8") &&
                                        //             !value.endsWith("9") &&
                                        //             !value.endsWith("10") &&
                                        //             !value.endsWith("11") &&
                                        //             !value.endsWith("0")

                                        //value.contains('.com') ||
                                        // Validator.isNumber(
                                        //     r'(^0?3[0-6]\d{8}$')

                                        ) {
                                      // addError(error: kInvalidEmailError);
                                      return null;
                                    }

                                    return "Enter Valid Email Address, Phone Number or Username ";
                                  },
                                  //onSaved: (value) => _email = value!,
                                ),
                              ),
                        //   ],
                        // ),
                        SizedBox(height: 19),

                        ///PASSWORD FIELD
                        Text(
                          "Password",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(height: 8,),
                        SizedBox(
                               width: 400,
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: tpassword,
                                  obscureText: !_passwordVisible,
                                  onFieldSubmitted: (val) {
                                    // FocusScope.of(context)
                                    //     .requestFocus(focustext);
                                  },
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey[700]),
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        iconSize: 18,
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          _passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey[500],
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            _passwordVisible =
                                                !_passwordVisible;
                                          });
                                        }),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    //labelText: 'Phone No',
                                    labelStyle: TextStyle(
                                        fontSize: 55, color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[700]!,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      //borderRadius: BorderRadius.circular(25.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey[300]!,
                                        width: 2.0,
                                      ),
                                    ),
                                    //filled: true,
                                  ),
                                  validator: FieldValidator.password(
                                      minLength: 8,
                                      shouldContainNumber: true,
                                      shouldContainCapitalLetter: true,
                                      shouldContainSmallLetter: true,
                                      shouldContainSpecialChars: true,
                                      errorMessage: "Enter Valid Password",
                                      onNumberNotPresent: () {
                                        return "Password must contain number";
                                      },
                                      onSpecialCharsNotPresent: () {
                                        return "Password must contain special characters";
                                      },
                                      onCapitalLetterNotPresent: () {
                                        return "Password must contain capital letters";
                                      }),
                                ),
                              ),
                        Container(
                          height: 40,
                          width: 400,
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                    value: remember,
                                    activeColor: Colors.red,
                                    onChanged: (value) {
                                      setState(() {
                                        remember = value!;
                                      });
                                    },
                                  ),
                              Text(
                                "Remember me",
                                style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                    decoration: TextDecoration.none),
                              ),
                              Spacer(),
                              GestureDetector(
                                // onTap: () => Navigator.pushNamed(
                                //     // context, ForgotPasswordScreen.routeName
                                //     ),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: colormain,
                                      fontSize: 12,
                                      decoration: TextDecoration.none),
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 10),
                        ////Button Continue
                        SizedBox(
                          height: 40,
                          width: 400,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                temail.text.trim();
                                tpassword.text.trim();
                                SigninAuthenticate().signIp(
                                    context,
                                    temail.text.trim(),
                                    tpassword.text.trim()
                                   );
                                   //Fluttertoast.showToast(msg: "Enter Valid Details",textColor: Colors.white,backgroundColor: Colors.blueGrey,webPosition: "bottom");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                primary: colormain, onPrimary: Colors.white),
                            child: Text("Continue"),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 18.0),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     PageTransition(
                                  //         child: ForgotPassword(),
                                  //         type: PageTransitionType
                                  //             .rightToLeftWithFade)
                                  //             );
                                },
                                child: StyledText(
                                  text:
                                      '<red>Having trouble?</red> <bold>Get Help</bold>',
                                  tags: {
                                    'bold': StyledTextTag(
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontFamily: 'Poppins',
                                            fontSize: 12)),
                                    'red': StyledTextTag(
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontFamily: 'Poppins',
                                            fontSize: 11.4)),
                                  },
                                ),
                              ),
                              // RichText(
                              //   text: TextSpan(
                              //     text: 'Don\'t have a Account?',
                              //     style: TextStyle(
                              //       color: Colors.grey[600],
                              //       //fontWeight: FontWeight.normal
                              //     ),
                              //     children: <TextSpan>[
                              //       // TextSpan(text: 'bold', style: TextStyle(fontWeight: FontWeght.bold)),
                              //       TextSpan(
                              //         text: ' Sign Up',
                              //         style: TextStyle(
                              //             color: Color(0xFFFD7C74),
                              //             fontSize: 11.sp),
                              //         recognizer:
                              //             new TapGestureRecognizer()
                              //               ..onTap = () =>
                              //                   print('Tap Here onTap'),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        // GestureDetector(
                        //   // onTap: () => Navigator.pushNamed(
                        //   //     // context, ForgotPasswordScreen.routeName
                        //   //     ),
                        //   child: Text(
                        //     "Get Help",
                        //     style: TextStyle(
                        //         color: colormain,
                        //         fontSize: 12,
                        //         decoration: TextDecoration.none),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  // ),
                  // Expanded(child: Container())
                ],
              );
            } else {
              return Container(
                child: Text('Mobile'),
              );
            }
          }),
        ),
      ),
    );
  }
}
