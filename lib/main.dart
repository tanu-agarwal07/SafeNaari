import 'dart:async';
// import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Provider/job_provider.dart';
import 'package:safenaari/Screens/Authentication/login_signup.dart';
import 'package:safenaari/Screens/dashboard.dart';
import 'package:safenaari/Screens/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Provider/sign_in_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SignInProvider()),
      ChangeNotifierProvider(create: (_) => JobProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Gilroy'
      ),
      home: SplashScreen(),
    ),
  ));
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  dynamic height,width;
  // Location location = Location();

  @override
  void initState(){
    super.initState();
    checkSms();
    autologin();
    // locationFunction();
    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   print("current location from listener"+currentLocation.longitude.toString());
    //   print("current location from listener"+currentLocation.latitude.toString());
    // });
    // locationFetch();
  }

  checkSms()async{
    var status = await Permission.sms.status;
    print(status);
    if(status == PermissionStatus.denied){
      await [Permission.sms].request();
    }
  }

 /* locationFetch()async{
  final Location location =  Location();
  location.changeSettings(accuracy: LocationAccuracy.low);

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData? _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        await  locationFetch();
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
     await  locationFetch();
      }
    }

  _locationData = await Future.any([
    location.getLocation(),
    Future.delayed(Duration(seconds: 5), () {}),
  ]);
  _locationData ??= await location.getLocation();


  print(_locationData.latitude);
  }

  locationFunction()async{
    try {
      bool ison = await location.serviceEnabled();
      PermissionStatus _permissionGranted;
      print(ison);
      if (!ison) {
        bool isturnedon = await location.requestService();
        if (isturnedon) {
          print("GPS device is turned ON");

          _permissionGranted = await location.hasPermission();
          location.getLocation().then((value) {
            print('value.latitude 67868 == ${value.latitude}');
            print(value.longitude);
          });
          print(_permissionGranted);
          if (_permissionGranted == PermissionStatus.denied) {
            _permissionGranted = await location.requestPermission();
            if (_permissionGranted == PermissionStatus.granted) {
              await location.getLocation().then((value) {
                print('value.latitude == ${value.latitude}');
                print(value.longitude);
              });
              return;
            }
          } else {
            print('qwertyuiop');
            await location.getLocation().then((value) {
              print('value.latitude == ${value.latitude}');
              print(value.longitude);
            });
          }
        } else {
          print("GPS Device is still OFF");
        }
      } else {
        _permissionGranted = await location.hasPermission();
        print(_permissionGranted);
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            location.getLocation().then((value) {
              print('value.latitude == ${value.latitude}');
              print(value.longitude);
            });
            return;
          }
        } else if (_permissionGranted == PermissionStatus.granted) {
          print('fghjkl');
          location.getLocation().then((value) {
            print('value');
            print(value);
            print('value.latitude == ${value.latitude}');
            print(value.longitude);
          });
        }
        // location.getLocation().then((value){
        //   print('value.latitude == ${value.latitude}');
        //   print(value.longitude);
        // });
      }
    }  catch(e){print(e.toString());
    }

  }*/

  autologin()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString('userId');
    if(id != null){
      return Timer(
          const Duration(seconds: 2),
              () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => DashboardScreen())));
    }else{
      return Timer(
          const Duration(seconds: 2),
              () =>
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => OnBoardingScreen())));
    }
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset('assets/safenari.png'),
            // child: FadeInImage(
            //   image: Image.asset('assets/safenari.png').image,
            //   placeholder: Image.asset('assets/safenari2.png',color: Colors.white,).image,
            //   fadeInDuration: Duration(seconds: 2),
            // ),
          ),
        ),
      ),
    );
  }
}
