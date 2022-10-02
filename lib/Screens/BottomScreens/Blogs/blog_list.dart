import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safenaari/Provider/sign_in_provider.dart';
import 'package:safenaari/Screens/BottomScreens/Blogs/blog_detail.dart';
import 'package:safenaari/Screens/BottomScreens/Safety/safety_detail.dart';

import '../../../Common/common_methods.dart';
import '../../dashboard.dart';

class BlogListScreen extends StatefulWidget {
  const BlogListScreen({Key? key}) : super(key: key);

  @override
  State<BlogListScreen> createState() => _BlogListScreenState();
}

class _BlogListScreenState extends State<BlogListScreen> {

  dynamic height,width;

  @override
  void initState(){
    super.initState();
    var provider = Provider.of<SignInProvider>(context,listen: false);
    provider.blogListApi();
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
        title: Text('Blogs'),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Consumer<SignInProvider>(
          builder: (context, value, child) {
            return value.blogListLoader ?
            ConstantMethods().loader(Color(0xff5c3393))
                : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  ListView.builder(
                    itemCount: value.blogList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      var data = value.blogList[index];
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => BlogDetail(
                            image: data.image!,
                            name: data.title!,
                            desc: data.description!,
                          )));
                        },
                        child: Container(
                          // height: height*0.26,
                          width: width,
                          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    offset: Offset(-2,3)
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                                child: Image.network(data.image!,height: height*0.2,width: width,fit: BoxFit.fill,)
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(data.title!,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(data.description!,
                                    maxLines: 2,
                                    style: TextStyle(fontSize: 12),),
                                ),
                              ),
                              SizedBox(height: 10,),
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
