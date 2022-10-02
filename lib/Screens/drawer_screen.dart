
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Screens/Authentication/login_signup.dart';
import 'package:safenaari/Screens/BottomScreens/Blogs/blog_detail.dart';
import 'package:safenaari/Screens/BottomScreens/Blogs/blog_list.dart';
import 'package:safenaari/Screens/BottomScreens/Job/add_job.dart';
import 'package:safenaari/Screens/BottomScreens/Ngo/ngo.dart';
import 'package:safenaari/Screens/BottomScreens/Profile/profile.dart';
import 'package:safenaari/Screens/BottomScreens/Safety/safety.dart';
import 'package:safenaari/Screens/dashboard.dart';
import 'package:safenaari/Screens/technical_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  dynamic height, width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      color: Color(0xff5c3393),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: height*0.025,),
          Container(
            width: width,
            padding: EdgeInsets.only(left: 10,right: 10,bottom: 20),
            child: Row(
              children: [
                Icon(Icons.location_on,color: Colors.white,size: 25,),
                SizedBox(width: 7,),
                Container(
                  width: width*0.5,
                  child: Text('Location Address',
                    maxLines: 2,textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white54,fontSize: 15),),
                ),
                Spacer(),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                )
              ],
            ),
          ),
          SizedBox(height: height*0.05,),
          block('Home','assets/home.png',onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
          }),
          block('Your Profile','assets/profile.png',onTap: ()async{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
          }),
          block('Technical Support','assets/tech-support.png',onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TechnicalSupport()));
          }),
          block('Safety Tutorials','assets/safety.png',onTap: ()async{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WomenSafety()));
          }),
          block('Blogs','assets/blog.png',onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BlogListScreen()));
          }),
          block('NGOs','assets/ngo.png',onTap: ()async{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NgoScreen()));
          }),
          block('Jobs','assets/job.png',onTap: ()async{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddJob()));
          }),
          block('Logout','assets/log.png',onTap: ()async{
            SharedPreferences pref = await SharedPreferences.getInstance();
            pref.remove('userId');
            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginSignupScreen()));
          }),
        ],
      ),

    );
  }

  block(text,image,{Function? onTap}){
    return InkWell(
      onTap: (){
        onTap!();
      },
      child: Container(
        padding: EdgeInsets.only(left: 20,right: 100,bottom: 20),
        child: Container(
          width: width*0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: const Color(0xffd291ff).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Center(child: Image.asset(image,height: 25,width: 25,color: Colors.white70,)),
              ),
              const SizedBox(width: 15,),
               Text(text,style: const TextStyle(color: Color(0xffffffff),fontSize: 16),),
            ],
          ),
        ),
      ),
    );
  }

}