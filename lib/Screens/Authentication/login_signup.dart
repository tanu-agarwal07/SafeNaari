import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Common/common_methods.dart';
import 'package:safenaari/Provider/sign_in_provider.dart';
import 'package:safenaari/Screens/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../add_sos.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: const Radius.circular(100),bottomRight: const Radius.circular(100)),
                  image: DecorationImage(
                      image: AssetImage("assets/bg4.jpeg"),
                      fit: BoxFit.fill)),
              child: Container(
                padding: const EdgeInsets.only(top: 90, left: 20),
                // color: Color(0xFFd291ff).withOpacity(0.8),
                // child: Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     RichText(
                //       text: TextSpan(
                //           text: "Welcome to",
                //           style: TextStyle(
                //             fontSize: 25,
                //             letterSpacing: 2,
                //             color: Colors.yellow[700],
                //           ),
                //           children: [
                //             TextSpan(
                //               text: isSignupScreen ? " Rizona," : " Back,",
                //               style: TextStyle(
                //                 fontSize: 25,
                //                 fontWeight: FontWeight.bold,
                //                 color: Colors.yellow[700],
                //               ),
                //             )
                //           ]),
                //     ),
                //     SizedBox(
                //       height: 5,
                //     ),
                //     Text(
                //       isSignupScreen
                //           ? "Signup to Continue"
                //           : "Signin to Continue",
                //       style: TextStyle(
                //         letterSpacing: 1,
                //         color: Colors.white,
                //       ),
                //     )
                //   ],
                // ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 200 : 230,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 380 : 250,
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: const Color(0xffd291ff),
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: const Color(0xffd291ff),
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection()
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          isSignupScreen ? buildBottomHalfContainer(false,isLogin: false) :
          buildBottomHalfContainer(false, isLogin: true),
        ],
      ),
    );
  }

  Widget buildSigninSection() {
    SignInProvider provider = Provider.of(context,listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          buildTextField(provider.signInEmail,Icons.mail_outline, "info@demouri.com", false, true),
          SizedBox(height: 10,),
          buildTextField(provider.signInPassword,Icons.lock, "**********", true, false),
        ],
      ),
    );
  }

  Container buildSignupSection() {
    SignInProvider provider = Provider.of(context,listen: false);
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          buildTextField(provider.name,Icons.person, "Name", false, false),
          SizedBox(height: 10,),
          buildTextField(provider.signUpEmail,Icons.mail_outline, "Email", false, true),
          SizedBox(height: 10,),
          buildTextField(provider.mobile,Icons.call, "Mobile Number", false, false),
          SizedBox(height: 10,),
          buildTextField(provider.signUpPassword,Icons.lock, "Password", true, false),
        ],
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: const BorderSide(width: 1, color: Colors.grey),
          minimumSize: const Size(145, 40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white, backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow, {bool? isLogin}) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 535 : 430,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow ?
          isSignupScreen ? Consumer<SignInProvider>(
            builder: (context, value, child) {
              return GestureDetector(
                onTap: (){
                  FocusManager.instance.primaryFocus?.unfocus();
                  if(value.name.text.isEmpty || value.signUpEmail.text.isEmpty || value.mobile.text.isEmpty
                      || value.signUpPassword.text.isEmpty){
                    ConstantMethods().snakbar('All fields are mandatory', context);
                  }else{
                    value.registerApi().then((v){
                      if(v['status'] == '200'){
                        // value.setUserData(v['name'], v['mobile'], v['email']);
                        setState((){
                          isSignupScreen = false;
                        });
                      }else{

                      }
                    });
                  }

                },
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0xffd291ff), Color(0xffbf66ff)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 1))
                      ]),
                  child: value.registerLoader ? SizedBox(
                    height: 30,
                    width: 30,
                    child: ConstantMethods().loader(Colors.white),
                  ) : const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ) :
               Consumer<SignInProvider>(
                 builder: (context, value, child) {
                   return GestureDetector(
                     onTap: ()async{
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
                       SharedPreferences pref = await SharedPreferences.getInstance();
                       FocusManager.instance.primaryFocus?.unfocus();
    if(value.signInEmail.text.isEmpty || value.signInPassword.text.isEmpty){
    ConstantMethods().snakbar('All fields are mandatory', context);
    }else {
      value.loginApi().then((v) {
        print(v);

          pref.setString('userId', v['results'][0]['id'].toString());
          value.setUserData(v['results'][0]['name'], v['results'][0]['mobile'].toString(),
              v['results'][0]['email']);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddSos()));

      });
    }
                     },
                     child: Container(
                       decoration: BoxDecoration(
                           gradient: const LinearGradient(
                               colors: [const Color(0xffd291ff), const Color(0xffbf66ff)],
                               begin: Alignment.topLeft,
                               end: Alignment.bottomRight),
                           borderRadius: BorderRadius.circular(30),
                           boxShadow: [
                             BoxShadow(
                                 color: Colors.black.withOpacity(.3),
                                 spreadRadius: 1,
                                 blurRadius: 2,
                                 offset: const Offset(0, 1))
                           ]),
                       child: /*value.loginLoader ? SizedBox(
                         height: 30,
                         width: 30,
                         child: ConstantMethods().loader(Colors.white),
                       ) :*/ const Icon(
                         Icons.arrow_forward,
                         color: Colors.white,
                       ),
                     ),
                   );
                 },
               )
              : const Center(),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller,
      IconData icon, String hintText, bool isPassword, bool isEmail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Palette.iconColor,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.textColor1),
            borderRadius: const BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.textColor1),
            borderRadius: BorderRadius.all(const Radius.circular(35.0)),
          ),
          contentPadding: const EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14, color: Palette.textColor1),
        ),
      ),
    );
  }
}

class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}