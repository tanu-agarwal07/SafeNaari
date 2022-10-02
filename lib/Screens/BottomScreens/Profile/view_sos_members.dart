import 'package:flutter/material.dart';

import '../../../Common/animated_dialog.dart';

class SosMemberList extends StatefulWidget {
  const SosMemberList({Key? key}) : super(key: key);

  @override
  State<SosMemberList> createState() => _SosMemberListState();
}

class _SosMemberListState extends State<SosMemberList> {

  dynamic height,width;
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff5c3393),
        leading: Padding(
          padding: const EdgeInsets.all(13),
          child: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: const Color(0xffd291ff).withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: const Center(child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 15,)),
            ),
          ),
        ),
        title: Text('Registered Members'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20,),
              ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return Container(
                    width: width,
                    margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(15),
                      border: Border(
                        left: BorderSide(color: Color(0xff5c3393), width: 3),
                        right: BorderSide(color: Colors.white),
                        top: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          offset: Offset(-2,3),
                          blurRadius: 2,
                          spreadRadius: 2
                        )
                      ]
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name',style: TextStyle(fontWeight: FontWeight.w500,),),
                            SizedBox(height: 5,),
                            Text('12345678990',style: TextStyle(fontWeight: FontWeight.w500,),),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                editDialog();
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey)
                                ),
                                child: Center(
                                  child: Icon(Icons.edit,size: 17,),
                                ),
                              ),
                            ),
                            SizedBox(height: 5,),
                            GestureDetector(
                              onTap:(){
                                deleteDialog();
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: Center(
                                  child: Icon(Icons.delete,size: 17,),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  editDialog(){
    return showDialog(
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
                      child: Text('Edit your member',style: TextStyle(
                          fontSize: 18,fontWeight: FontWeight.bold
                      ),),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                          hintText: 'Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: TextFormField(
                        controller: mobile,
                        decoration: InputDecoration(
                          hintText: 'Mobile',
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
  }

  deleteDialog(){
    return showDialog(
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
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: Text('Are you sure want to delete your member?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
                          },
                          child: const Text('Yes',
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
  }

}
