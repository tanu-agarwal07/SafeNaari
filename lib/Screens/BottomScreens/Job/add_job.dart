import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Common/common_textfield.dart';
import 'package:safenaari/Provider/job_provider.dart';
import 'package:safenaari/Provider/sign_in_provider.dart';

import '../../../Common/common_methods.dart';
import '../../dashboard.dart';

class AddJob extends StatefulWidget {
  const AddJob({Key? key}) : super(key: key);

  @override
  State<AddJob> createState() => _AddJobState();
}

class _AddJobState extends State<AddJob> {

  dynamic height,width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    JobProvider provider = Provider.of(context,listen: false);

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
        title: const Text('Add Job'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 20,),
              CommonTextField(
                controller: provider.title,
                textInputType: TextInputType.text,
                obscure: false,
                hint: 'Title',
                color: Colors.white,
              ),
              Container(
                height: height*0.07,
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: provider.ngoId,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    hint: const Text('Select NGO',style: TextStyle(color: Colors.grey,fontSize: 14),),
                    items: provider.ngoListClass.map((items) {
                      return DropdownMenuItem(
                        value: items.id.toString(),
                        child: Text(items.name!),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        provider.ngoId = newValue!;
                      });
                    },
                  ),
                ),
              ),
              CommonTextField(
                controller: provider.price,
                textInputType: TextInputType.text,
                obscure: false,
                hint: 'Price',
                color: Colors.white,
              ),
              CommonTextField(
                controller: provider.hour,
                textInputType: TextInputType.text,
                obscure: false,
                hint: 'Hours',
                color: Colors.white,
              ),
              Container(
                // height: height*0.07,
                margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.grey),
                    // color: Colors.black26,
                    color: Colors.white
                ),
                child: TextFormField(
                  controller: provider.description,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Description',hintStyle: TextStyle(
                      color: Colors.grey.shade400,fontSize: 14
                  )),
                ),
              ),
              Consumer<JobProvider>(
                builder: (context, value, child) {
                  return GestureDetector(
                    onTap: (){
                      FocusManager.instance.primaryFocus?.unfocus();
                      if(value.title.text.isEmpty || value.price.text.isEmpty || value.hour.text.isEmpty
                          || value.description.text.isEmpty || value.ngoId == null){
                        ConstantMethods().snakbar('All fields are mandatory', context);
                      }else{
                        value.addJobApi().then((v){
                          print(v);
                          if(v['status'] == '200'){
                            value.title.text = '';
                            value.price.text = '';
                            value.hour.text = '';
                            value.description.text = '';
                            value.ngoId = null;
                          }
                        });
                      }
                    },
                    child: Container(
                      height: height*0.07,
                      margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffbf66ff),
                      ),
                      child: value.addLoader ? SizedBox(
                        height: 30,
                        width: 30,
                        child: ConstantMethods().loader(Colors.white),
                      ) : const Center(
                        child: Text('Add Job',style: TextStyle(
                            color: Colors.white,fontSize: 17
                        ),),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
