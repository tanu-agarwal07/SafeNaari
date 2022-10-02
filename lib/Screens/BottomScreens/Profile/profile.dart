import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Common/common_methods.dart';
import 'package:safenaari/Provider/sign_in_provider.dart';
import 'package:safenaari/Screens/BottomScreens/Job/add_job.dart';
import 'package:safenaari/Screens/BottomScreens/Profile/view_sos_members.dart';
import 'package:safenaari/Screens/dashboard.dart';

import '../../../Common/animated_dialog.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  dynamic height, width;
  TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff5c3393),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: const Color(0xffd291ff).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: const Center(child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
            ),
          ),
        ),
        title: Text('Your Profile'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height*0.15,
              width: width,
              color: Color(0xff5c3393),
              child: Column(
                children: [
                  const SizedBox(height: 25,),
                  Consumer<SignInProvider>(
                    builder: (context, value, child) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(value.userName,style: TextStyle(color: Colors.white70,fontSize: 17,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10,),
                                  Text(value.userMobile,style: TextStyle(color: Colors.white70,fontSize: 15,fontWeight: FontWeight.w600),),
                                  SizedBox(height: 10,),
                                  Text(value.userEmail,style: TextStyle(color: Colors.white70,fontSize: 15,fontWeight: FontWeight.w600),)
                                ]
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            const SizedBox(height: 35,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: height*0.077,
                width: width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SosMemberList()));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.people,size: 35,),
                          SizedBox(width: 15,),
                          Text('SOS Registered Members',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded,size: 15,)
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Divider(thickness: 2,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: height*0.077,
                width: width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context){
                            return WillPopScope(
                              onWillPop: () async => false,
                              child: StatefulBuilder(
                                builder: (context, setState) {
                                  return FunkyOverlay(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(height: 10,),
                                        InkWell(
                                          onTap: (){
                                            Navigator.pop(context);
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.only(right: 8.0),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: Icon(Icons.clear),
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text('Edit your SOS message',style: TextStyle(
                                              fontSize: 18,fontWeight: FontWeight.bold
                                          ),),
                                        ),
                                        SizedBox(height: 20,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                          child: TextFormField(
                                            controller: message,
                                            maxLines: null,
                                            keyboardType: TextInputType.multiline,
                                            decoration: InputDecoration(
                                              hintText: 'Message',
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20,),
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancel',
                                                  style: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold)),
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                              },
                                              child: const Text('Submit',
                                                  style: TextStyle(fontSize: 17,color: Color(0xff5c3393),fontWeight: FontWeight.bold)),
                                            ),
                                          ],),
                                        const SizedBox(height: 20,),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.edit,size: 35,),
                          SizedBox(width: 15,),
                          Text('Edit SOS Message',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded,size: 15,)
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Divider(thickness: 2,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25,),

          ],
        ),
      ),
    );
  }
}
