import 'package:flutter/material.dart';

class ConstantMethods{

  backButton(Function onTap){
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color(0xff5c3393).withOpacity(0.6),
          // color: const Color(0xfff0f5f8),
          borderRadius: BorderRadius.circular(8)
        ),
        child: const Center(child: Icon(Icons.arrow_back_ios_new_rounded,color: Color(0xffB9D3D2),)),
      ),
    );
  }

  menuButton(Function onTap, icon){
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: const Color(0xff5c3393).withOpacity(0.8),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Center(child: Icon(icon,color: Colors.white,)),
      ),
    );
  }

   snakbar(String text, BuildContext context){
    final snackBar = SnackBar(
      content: Text(text,style: const TextStyle(color: Colors.white)),
      // content: Text(text,style: const TextStyle(color: Colors.white),),
      backgroundColor: (Colors.black),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  loader(color){
    return Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(color)),);
  }

  showAlertDialog(BuildContext context,String text) {
    // Create button
    Widget okButton = FlatButton(
      child: const Text("OK",style: TextStyle(color: Color(0xff21B6BF)),),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Text("Alert!!!"),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}