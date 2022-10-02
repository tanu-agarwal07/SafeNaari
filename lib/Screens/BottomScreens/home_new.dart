import 'dart:async';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart' hide LocationAccuracy;
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Provider/sign_in_provider.dart';
import 'package:shake/shake.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';
import '../../Common/common_methods.dart';

class HomeNewScreen extends StatefulWidget {
  final data;
  const HomeNewScreen({Key? key,this.data}) : super(key: key);

  @override
  State<HomeNewScreen> createState() => _HomeNewScreenState();
}

class _HomeNewScreenState extends State<HomeNewScreen> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  dynamic height,width;
  int current = 0;
  List<String> recipents = [];
  final CarouselController _controller = CarouselController();

  List image = [
    'assets/ban1.jpeg',
    'assets/ban2.jpeg',
    'assets/ban3.jpeg',
  ];
  // Location location = Location();
  // LocationData? locationData;

  void _sendSMS(String message) async {

    String _result = await sendSMS(message: message, recipients: recipents,sendDirect: true)
        .catchError((onError) {
      print(onError);
    });
    print('_result ==$_result');
    if(_result == 'SMS Sent!'){
      ConstantMethods().showAlertDialog(context, 'Your SMS sent successfully');
    }
  }

  var location2;
  String message = '';
 Future getCurrent()async{
   location2 = await Geolocator.getCurrentPosition();

   print("location from home screen"+location2.latitude.toString());
   print("location from home screen"+location2.longitude.toString());
   List<Placemark> placemarks = await placemarkFromCoordinates(location2.latitude, location2.longitude);
   print(placemarks[0].street);
   print(placemarks[0].locality);
   print(placemarks[0].postalCode);
   print(placemarks[0].administrativeArea);
   print(placemarks[0].subAdministrativeArea);
   print(placemarks[0].country);
   print(placemarks[0].subLocality);
   print(placemarks[0].thoroughfare);
   print(placemarks[0].subThoroughfare);
   // print(placemarks[0].);
   // setState((){
     message = "I Need Help !! Emergency!!\nI am at the location ${placemarks[0].street}, ${placemarks[0].subLocality}, ${placemarks[0].subAdministrativeArea} ${placemarks[0].postalCode}";
     print(message);

}
  ShakeDetector? detector;
  // shake(){
  //   print('shakre 1 ==');
  //  detector =
  //  detector!.stopListening();
  // }

  @override
  void initState(){
    super.initState();
    // detector!.startListening();
    getCurrent().then((value) {

    });
    // shake();

    var provider = Provider.of<SignInProvider>(context,listen: false);
    provider.sosListApi().then((v){
      for(int i = 0; i<provider.sosList.length; i++){
        setState((){
          print(provider.sosList[i].mobile);
          recipents.add(provider.sosList[i].mobile.toString());
          print(recipents);
        });
      }
    });
    ShakeDetector.autoStart(
      onPhoneShake: () {
        print('shakre 2 ==');
        _sendSMS(message);
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
    // getPositionStream();
// checkPermission();
//     getPositionStream().listen((Position position) {
//       // Handle position changes
//       print("rtyuio");
//       setState((){
//         print(position.longitude);
//         print(position.latitude);
//       });
//     });

  }
  // checkPermission()async{
  //   var status = await Permission.location.status;
  //   print('status == $status');
  //   if(status.isGranted){
  //     getPositionStream().listen((Position position) {
  //       // Handle position changes
  //       print("rtyuio");
  //       setState((){
  //         print(position.longitude);
  //         print(position.latitude);
  //       });
  //     });
  //   }else{
  //     await [Permission.location].request();
  //   }
  // }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isDrawerOpen?ConstantMethods().menuButton((){
                      setState(() {
                        xOffset = 0;
                        yOffset = 0;
                        isDrawerOpen = false;
                      });
                    }, Icons.arrow_back_ios_new_rounded): ConstantMethods().menuButton((){
                      setState(() {
                        xOffset = 290;
                        yOffset = 80;
                        isDrawerOpen = true;
                      });
                    }, Icons.menu_rounded),
                    Image.asset('assets/safenari3.png',scale: 20,),

                  ],
                ),
              ),
              SizedBox(height: height*0.1,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: const Text('Save Our Souls',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),),
              ),
              SizedBox(height: height*0.01,),
              GestureDetector(
                onTap: ()async{
                  print('hello');

                  // _determinePosition();

                  _sendSMS(message);
                    /*final Location location =  Location();


                    bool _serviceEnabled;
                    PermissionStatus _permissionGranted;
                    LocationData? _locationData;

                    _serviceEnabled = await location.serviceEnabled();
                    if (!_serviceEnabled) {
                      _serviceEnabled = await location.requestService();
                      if (!_serviceEnabled) {
                       return ;
                      }
                    }

                    _permissionGranted = await location.hasPermission();
                    if (_permissionGranted == PermissionStatus.denied) {
                      _permissionGranted = await location.requestPermission();
                      if (_permissionGranted != PermissionStatus.granted) {
                      return;
                      }
                    }

                    _locationData = await Future.any([
                      location.getLocation(),
                      Future.delayed(Duration(seconds: 5), () {}),
                    ]);
                    _locationData ??= await location.getLocation();


                    print(_locationData.latitude);
                  final geoLocation= await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.medium,forceAndroidLocationManager: true,);
                  print(geoLocation.longitude);*/
                  // Geolocator.getPositionStream().listen((Position position) {
                  //   print('latitude == ${position.latitude}');
                  // });
                  // _sendSMS(message, recipents);
                  // _determinePosition();
                  // bool ison = await location.serviceEnabled();
                  // PermissionStatus _permissionGranted;
                  // print(ison);
                  // if (!ison) {
                  //   bool isturnedon = await location.requestService();
                  //   if (isturnedon) {
                  //     print("GPS device is turned ON");
                  //     _permissionGranted = awit location.hasPermission();
                  //     if (_permissionGranted == PermissionStatus.denied) {
                  //       _permissionGranted = await location.requestPermission();
                  //       if (_permissionGranted != PermissionStatus.granted) {
                  //         location.getLocation().then((value){
                  //           print('value.latitude == ${value.latitude}');
                  //           print(value.longitude);
                  //         });
                  //         return;
                  //       }
                  //     }else{
                  //       location.getLocation().then((value){
                  //         print('value.latitude == ${value.latitude}');
                  //         print(value.longitude);
                  //       });
                  //     }
                  //   }else{
                  //     print("GPS Device is still OFF");
                  //   }
                  // }else {
                  //   _permissionGranted = await location.hasPermission();
                  //   print(_permissionGranted);
                  //   if (_permissionGranted == PermissionStatus.denied) {
                  //     _permissionGranted = await location.requestPermission();
                  //     if (_permissionGranted != PermissionStatus.granted) {
                  //       location.getLocation().then((value){
                  //         print('value.latitude == ${value.latitude}');
                  //         print(value.longitude);
                  //       });
                  //       return;
                  //     }
                  //   }else if(_permissionGranted == PermissionStatus.granted){
                  //     print('fghjkl');
                  //     location.getLocation().then((value){
                  //       print('value');
                  //       print(value);
                  //       print('value.latitude == ${value.latitude}');
                  //       print(value.longitude);
                  //     });
                  //   }
                    // location.getLocation().then((value){
                    //   print('value.latitude == ${value.latitude}');
                    //   print(value.longitude);
                    // });
                  // }
                },
                child: Lottie.asset('assets/sos-icon.json'),
              ),
              SizedBox(height: height*0.01,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: const Text('Press in case of emergency',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // static  Stream<Position> getPositionStream({LocationSettings? locationSettings,}) =>
  //     GeolocatorPlatform.instance.getPositionStream(
  //       locationSettings: locationSettings,
  //     );

  Future<Position> _determinePosition() async {
    print('1');
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('2');
      permission = await Geolocator.requestPermission();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    print('3 == ${permission}');
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        return Future.error('Location permissions are denied');
      }else if(permission == LocationPermission.always){
        Position? position = await Geolocator.getLastKnownPosition();
        print('posotion == ${position!.longitude}');
        Geolocator.getPositionStream(locationSettings: LocationSettings(timeLimit: const Duration(seconds: 5))).listen((Position position) {
          // Handle position changes
          print("1234567890");
          setState((){
            print(position.longitude);
            print(position.latitude);
          });
        });
        await Geolocator.getCurrentPosition().then((value){
          setState((){
            print(value.longitude);
            print(value.latitude);
          });
        });
      }
    }
    else if(permission == LocationPermission.always){
      print("hjgj=====");
      LocationSettings locationSettings;
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 100,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          //(Optional) Set foreground notification config to keep the app alive
          //when going to the background
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
            "Example app will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          )
      );
      Position? position = await Geolocator.getLastKnownPosition();
      print('posotion == ${position?.longitude}');
      Geolocator.getPositionStream(locationSettings: LocationSettings(timeLimit: const Duration(seconds: 5))).listen((Position position) {
        // Handle position changes
        print("12345678909898");
        setState((){
          print(position.longitude);
          print(position.latitude);
        });
      });
      await Geolocator.getCurrentPosition().then((value){
        setState((){
          print(value.longitude);
          print(value.latitude);
        });
      });
    }

    if (permission == LocationPermission.deniedForever) {

      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

}
