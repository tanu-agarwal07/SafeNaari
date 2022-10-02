import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Common/common_methods.dart';
import 'package:safenaari/Provider/job_provider.dart';
import 'package:safenaari/Screens/BottomScreens/Ngo/ngo_detail.dart';

import '../../dashboard.dart';

class NgoScreen extends StatefulWidget {
  const NgoScreen({Key? key}) : super(key: key);

  @override
  State<NgoScreen> createState() => _NgoScreenState();
}

class _NgoScreenState extends State<NgoScreen> {

  dynamic height,width;

  @override
  void initState(){
    super.initState();
    var provider = Provider.of<JobProvider>(context,listen: false);
    provider.ngoListApi();
  }

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

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
        title: Text('NGOs'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Consumer<JobProvider>(
          builder: (context, value, child) {
            return value.fetchNgo ?
                ConstantMethods().loader(Color(0xff5c3393))
                : value.ngoListClass.isEmpty ?
                Center(
                  child: Text('No NGOs found',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                )
                : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(height: 20,),
                  ListView.builder(
                    itemCount: value.ngoListClass.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      double reciprocal(double d) => 1 / d;
                      return GestureDetector(
                        onTap: (){
                          print(value.ngoListClass[index].id);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NgoDetail(
                            image: value.ngoListClass[index].image!,
                            name: value.ngoListClass[index].name!,
                            desc: value.ngoListClass[index].description!,
                            rating: value.ngoListClass[index].ratting!,
                            id: value.ngoListClass[index].id!,
                          )));
                        },
                        child: Container(
                          // height: height*0.15,
                          width: width,
                          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    offset: Offset(-2,3),
                                    blurRadius: 2,spreadRadius: 2
                                )
                              ]
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height*0.13,
                                width: width*0.26,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(value.ngoListClass[index].image!,fit: BoxFit.fill,),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Container(
                                    width: width*0.5,
                                    child: Text(value.ngoListClass[index].name!,
                                      maxLines: 2,
                                      style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: width*0.5,
                                    child: Row(
                                      children: [
                                        const Text('Ratings : ',
                                          style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
                                        RatingBar.builder(
                                          initialRating: value.ngoListClass[index].ratting!.toDouble(),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 1),
                                          itemSize: 16.0,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,size: 16,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Container(
                                    // height: ,
                                    width: 70,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(color: Color(0xff5c3393))
                                    ),
                                    child: Center(
                                      child: Text('View',style: TextStyle(color: Color(0xff5c3393),)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
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
