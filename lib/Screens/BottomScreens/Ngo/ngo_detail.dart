import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:safenaari/Screens/BottomScreens/Job/job_list.dart';

class NgoDetail extends StatefulWidget {
  final image,name,rating,desc,id;
  const NgoDetail({Key? key,this.image,this.desc,this.name,this.rating,this.id}) : super(key: key);

  @override
  State<NgoDetail> createState() => _NgoDetailState();
}

class _NgoDetailState extends State<NgoDetail> {

  dynamic height,width;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                  height: height*0.28,
                  width: width,
                  child: Image.network(widget.image,fit: BoxFit.fill,)
              ),
              Container(
                height: height*0.66,
                width: width,
                // color: Colors.red,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text('Ratings : ',
                              style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15),),
                            RatingBar.builder(
                              initialRating: widget.rating.toDouble(),
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
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> JobList(id: widget.id,)));
                              },
                              child: Container(
                                // height: ,
                                width: 70,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7),
                                    border: Border.all(color: Color(0xff5c3393))
                                ),
                                child: Center(
                                  child: Text('Jobs',style: TextStyle(color: Color(0xff5c3393),)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.desc,style: TextStyle(fontSize: 15),),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
