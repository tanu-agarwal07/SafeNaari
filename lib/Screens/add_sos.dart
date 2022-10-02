import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Provider/sign_in_provider.dart';
import 'package:safenaari/Screens/dashboard.dart';

class AddSos extends StatefulWidget {
  const AddSos({Key? key}) : super(key: key);

  @override
  State<AddSos> createState() => _AddSosState();
}

class _AddSosState extends State<AddSos> {

  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  Icon floatingIcon =  Icon(Icons.add);

  addDynamic() {
    if (data.length != 0) {
      floatingIcon =  Icon(Icons.add);

      data = [];
      listDynamic = [];
      print('if');
    }
    setState(() {});
    if (listDynamic.length >= 5) {
      return;
    }
    listDynamic.add( DynamicWidget());
  }

  submitData() {
    floatingIcon =  Icon(Icons.arrow_back);
    data = [];
    listDynamic.forEach((widget) {
      data.add(widget.name.text);
      data.add(widget.mobile.text);
    });
    setState(() {});
    print(data);
    print(data.length);
    Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(data: data,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget result =  Flexible(
        flex: 1,
        child:  Card(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, index) {
              return  Padding(
                padding:  EdgeInsets.all(10.0),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                     Container(
                      margin:  EdgeInsets.only(left: 10.0),
                      child:  Text("${index + 1} : ${data[index]}"),
                    ),
                     Divider()
                  ],
                ),
              );
            },
          ),
        ));

    Widget dynamicTextField =  Flexible(
      flex: 2,
      child:  ListView.builder(
        itemCount: listDynamic.length,
        itemBuilder: (_, index) => listDynamic[index],
      ),
    );

    Widget submitButton =  GestureDetector(
      onTap: submitData,
      child: Container(
        width: 200,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffbf66ff),
        ),
        child: const Center(
          child: Text('Submit',style: TextStyle(
              color: Colors.white,fontSize: 20
          ),),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff5c3393),
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
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
        title: const Text('Add SOS'),
      ),
      body:  Container(
        margin:  EdgeInsets.all(10.0),
        child:  Column(
          children: <Widget>[
            data.isEmpty ? dynamicTextField : result,
            data.length == 0 ? submitButton :  Container(),
          ],
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: addDynamic,
        child: floatingIcon,
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController mobile =  TextEditingController();
  TextEditingController name =  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: height*0.07,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey),
              // color: Colors.black26,
              color: Colors.white
          ),
          child: TextFormField(
            controller: name,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Name',hintStyle: TextStyle(
                color: Colors.grey.shade400,fontSize: 14
            )),
          ),
        ),
        Container(
          // height: height*0.07,
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey),
              // color: Colors.black26,
              color: Colors.white
          ),
          child: TextFormField(
            controller: mobile,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Mobile Numbers',hintStyle: TextStyle(
                color: Colors.grey.shade400,fontSize: 14
            )),
          ),
        ),
        Consumer<SignInProvider>(
          builder: (context, value, child) {
            return GestureDetector(
              onTap: (){
                value.addSosApi(name.text, mobile.text).then((v){
                  print(v);
                });
              },
              child: Container(
                width: 200,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffbf66ff),
                ),
                child: const Center(
                  child: Text('Add',style: TextStyle(
                      color: Colors.white,fontSize: 20
                  ),),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
