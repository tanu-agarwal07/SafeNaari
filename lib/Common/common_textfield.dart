import 'package:flutter/material.dart';

class CommonTextField extends StatefulWidget {
  TextEditingController controller;
  String hint;
  bool obscure;
  TextInputType textInputType;
  Color? color;
  CommonTextField({Key? key,required this.controller,required this.hint,
    required this.obscure,required this.textInputType,this.color}) : super(key: key);

  @override
  _CommonTextFieldState createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {

  dynamic height, width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Container(
      height: height*0.07,
      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
        // color: Colors.black26,
        color: widget.color
      ),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscure,
        style: TextStyle(color: Colors.black),
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hint,hintStyle: TextStyle(
          color: Colors.grey.shade400,fontSize: 14
        )),
      ),
    );
  }
}
