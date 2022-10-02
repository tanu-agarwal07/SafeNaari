import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Provider/job_provider.dart';

import '../../../Common/common_methods.dart';

class JobList extends StatefulWidget {
  final id;
  const JobList({Key? key,this.id}) : super(key: key);

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {

  dynamic height,width;

  @override
  void iniState(){
    super.initState();
    var provider = Provider.of<JobProvider>(context,listen: false);
    provider.jobListApi(widget.id);
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Consumer<JobProvider>(
          builder: (context, value, child) {
            return value.fetchJob ?
            ConstantMethods().loader(Color(0xff5c3393))
                : value.jobListClass.isEmpty ?
            Center(
              child: Text('No Jobs found',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            )
                : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  ListView.builder(
                    itemCount: value.jobListClass.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      var data = value.jobListClass[index];
                      return Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomRight,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: height*0.12,
                                width: width,
                                margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          blurRadius: 2,
                                          spreadRadius: 2,
                                          offset: Offset(-2,3)
                                      ),
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: width*0.6,
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(data.title!,
                                                maxLines: 2,
                                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: height*0.04,
                                          width: width*0.2,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              // color: Color(0xffd291ff).withOpacity(0.8),
                                              // color: Color(0xff5c3393).withOpacity(0.4),
                                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10))
                                          ),
                                          child: Center(
                                            child: Text('\u0024${data.hour}/hr',style: TextStyle(fontWeight: FontWeight.bold,
                                                fontSize: 15,color: Colors.black),),
                                          ),
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Container(
                                      width: width*0.8,
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(data.description!,
                                            maxLines: 2,
                                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10,)
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: height*0.04,
                              width: width*0.3,
                              margin: EdgeInsets.only(right: 25,bottom: 5),
                              decoration: BoxDecoration(
                                  color: Color(0xff5c3393),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(
                                child: Text(data.price!.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  )
                ],
              ),
            );
          },
        )
      ),
    );
  }
}
