// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:safenaari/Common/animated_dialog.dart';
// import 'package:safenaari/Screens/BottomScreens/home.dart';
// import 'package:safenaari/Screens/BottomScreens/ngo.dart';
// import 'package:safenaari/Screens/BottomScreens/profile.dart';
// import 'package:safenaari/Screens/BottomScreens/safety.dart';
// class Dashboard extends StatefulWidget {
//   Dashboard ({Key? key}) : super(key: key);
//
//   @override
//   _DashboardState createState() => _DashboardState();
// }
//
// class _DashboardState extends State<Dashboard > {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     HomeScreen(),
//     NgoScreen(),
//     WomenSafety(),
//     ProfileScreen()
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//    dynamic height,width;
//
//   @override
//   Widget build(BuildContext context) {
//
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//
//     return WillPopScope(
//       onWillPop: (){
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (context){
//             return WillPopScope(
//               onWillPop: () async => false,
//               child: StatefulBuilder(
//                 builder: (context, setState) {
//                   return FunkyOverlay(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         SizedBox(height: 10,),
//                         InkWell(
//                           onTap: (){
//                             Navigator.pop(context);
//                           },
//                           child: const Padding(
//                             padding: EdgeInsets.only(right: 8.0),
//                             child: Align(
//                               alignment: Alignment.topRight,
//                               child: Icon(Icons.clear),
//                             ),
//                           ),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(vertical: 10),
//                           child: Text('Are you sure want to exit?',style: TextStyle(
//                               fontSize: 18,fontWeight: FontWeight.bold
//                           ),),
//                         ),
//                         SizedBox(height: 30,),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             TextButton(
//                               onPressed: () async {
//                                 Navigator.pop(context);
//                               },
//                               child: const Text('No',
//                                   style: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold)),
//                             ),
//                             TextButton(
//                               onPressed: () async {
//                                 SystemNavigator.pop();
//                               },
//                               child: const Text('Yes',
//                                   style: TextStyle(fontSize: 17,color: Color(0xfff38341),fontWeight: FontWeight.bold)),
//                             ),
//                           ],),
//                         const SizedBox(height: 20,),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         );
//         return Future.value(true);
//       },
//       child: Scaffold(
//         // extendBody: true,
//         body: Center(
//           child: _widgetOptions.elementAt(_selectedIndex),
//         ),
//         bottomNavigationBar: Container(
//           margin: EdgeInsets.all(20),
//           height: height * 0.08,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(.15),
//                 blurRadius: 30,
//                 offset: Offset(0, 10),
//               ),
//             ],
//             borderRadius: BorderRadius.circular(50),
//           ),
//           child: ListView.builder(
//             itemCount: 4,
//             scrollDirection: Axis.horizontal,
//             padding: EdgeInsets.symmetric(horizontal: width * .024),
//             itemBuilder: (context, index) => InkWell(
//               onTap: () {
//                 setState(() {
//                     _selectedIndex = index;
//                   },
//                 );
//               },
//               splashColor: Colors.transparent,
//               highlightColor: Colors.transparent,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   AnimatedContainer(
//                     duration: Duration(milliseconds: 1500),
//                     curve: Curves.fastLinearToSlowEaseIn,
//                     margin: EdgeInsets.only(
//                      /* bottom: index == _selectedIndex ? 0 : 1,*/ right: width * .0422, left: width * .0422,
//                     ),
//                     width: width * .128,
//                     height: index == _selectedIndex ? 5 : 0,
//                     decoration: BoxDecoration(
//                       color: Color(0xff5c3393),
//                       borderRadius: BorderRadius.vertical(
//                         bottom: Radius.circular(10),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 5),
//                   Image.asset(listOfIcons[index],scale: 19,color: index == _selectedIndex
//                       ? Color(0xff5c3393)
//                       : Color(0xff5c3393),),
//                   SizedBox(height: 5),
//                 ],
//               ),
//             ),
//           ),
//         ),
//
//         /*bottomNavigationBar: Container(
//           decoration: const BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20), // adjust to your liking
//               topRight: Radius.circular(20), // adjust to your liking
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey,
//                 spreadRadius: 2,blurRadius: 2,
//                 offset: Offset(2, 2)
//               )
//             ]
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20),
//               topRight: Radius.circular(20),
//             ),
//             child: BottomNavigationBar(
//                 items: <BottomNavigationBarItem>[
//                   BottomNavigationBarItem(
//                     icon: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Image.asset('assets/home.png',scale: 19,
//                             color:*//*_selectedIndex == 0 ? Colors.white :*//* Color(0xff5c3393)),
//                         SizedBox(height: 5,),
//                         _selectedIndex == 0 ? Container(
//                           height: 6,
//                           width: 6,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: _selectedIndex == 0 ? Color(0xff5c3393) : Colors.white
//                           ),
//                         ) : SizedBox()
//                       ],
//                     ),
//                     label: '',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Image.asset('assets/ngo.png',scale: 19,
//                         color: Color(0xff5c3393)),
//                     label: _selectedIndex == 1 ?'.' : '',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Image.asset('assets/safety.png',scale: 19,
//                         color: Color(0xff5c3393)),
//                     label: _selectedIndex == 2 ?'.' : '',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Image.asset('assets/profile.png',scale: 19,
//                         color: Color(0xff5c3393)),
//                     label: _selectedIndex == 3 ?'.' : '',
//                   ),
//                 ],
//                 backgroundColor: Colors.white,
//                 type: BottomNavigationBarType.fixed,
//                 currentIndex: _selectedIndex,
//                 selectedItemColor: Color(0xff5c3393),
//                 showSelectedLabels: true,
//                 showUnselectedLabels: false,
//                 unselectedItemColor: Colors.grey,
//                 onTap: _onItemTapped,
//                 elevation: 1
//             ),
//           ),
//         ),*/
//       ),
//     );
//   }
//
//   List listOfIcons = [
//     'assets/home.png',
//     'assets/ngo.png',
//     'assets/safety.png',
//     'assets/profile.png',
//   ];
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:safenaari/Screens/BottomScreens/home_new.dart';

import '../../Common/animated_dialog.dart';
import 'BottomScreens/home.dart';
import 'drawer_screen.dart';

class DashboardScreen extends StatefulWidget {
  final data;
  const DashboardScreen({Key? key,this.data}) : super(key: key);
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
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
                          child: Text('Are you sure want to exit?',style: TextStyle(
                              fontSize: 18,fontWeight: FontWeight.bold
                          ),),
                        ),
                        SizedBox(height: 30,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: const Text('No',
                                  style: TextStyle(fontSize: 17,color: Colors.grey,fontWeight: FontWeight.bold)),
                            ),
                            TextButton(
                              onPressed: () async {
                                SystemNavigator.pop();
                              },
                              child: const Text('Yes',
                                  style: TextStyle(fontSize: 17,color: Color(0xff21B6BF),fontWeight: FontWeight.bold)),
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
        return Future.value(true);
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              DrawerScreen(),
              HomeNewScreen(data: widget.data,)

            ],
          ),
        ),

      ),
    );
  }
}