import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Common/animated_dialog.dart';
import 'dashboard.dart';

class TechnicalSupport extends StatefulWidget {
  const TechnicalSupport({Key? key}) : super(key: key);

  @override
  State<TechnicalSupport> createState() => _TechnicalSupportState();
}

class _TechnicalSupportState extends State<TechnicalSupport> {

  dynamic height,width;

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
        title: Text('Technical Support'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            const SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                // height: height*0.08,
                width: width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        launchUrl(Uri.parse("tel://011-23237166"));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.call,size: 18,),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('National Commission for Women',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                              SizedBox(height: 5,),
                              Text('011-23237166',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                            ],
                          ),
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
                color: Colors.white,
                // height: height*0.077,
                width: width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        launchUrl(Uri.parse("tel://1091"));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.call,size: 18,),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Women Helpline',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                              SizedBox(height: 5,),
                              Text('1091',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                            ],
                          ),
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
                color: Colors.white,
                // height: height*0.077,
                width: width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        launchUrl(Uri.parse("tel://100"));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.call,size: 18,),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Police',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                              SizedBox(height: 5,),
                              Text('100',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                            ],
                          ),
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
                color: Colors.white,
                // height: height*0.077,
                width: width,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        launchUrl(Uri.parse("tel://1031"));
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.call,size: 18,),
                          SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ambulance',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                              SizedBox(height: 5,),
                              Text('1031',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
                            ],
                          ),
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
          ],
        ),
      ),
    );
  }
}
