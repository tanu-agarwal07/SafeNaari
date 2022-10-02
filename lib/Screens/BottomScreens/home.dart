import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Common/common_methods.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  dynamic height,width;
  int current = 0;
  final CarouselController _controller = CarouselController();

  List image = [
    'assets/ban1.jpeg',
    'assets/ban2.jpeg',
    'assets/ban3.jpeg',
  ];

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
        // color: Colors.yellow,
          borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)
      ),
      child: GestureDetector(
        onTap: (){
          if(isDrawerOpen){
            setState(() {
              xOffset = 0;
              yOffset = 0;
              isDrawerOpen = false;
            });
          }else{
            setState(() {
              xOffset = 290;
              yOffset = 80;
              isDrawerOpen = true;
            });
          }
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            // color: Colors.yellow,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    blurRadius: 1,spreadRadius: 3,
                    offset: Offset(2,-3)
                )
              ],
              borderRadius: BorderRadius.circular(isDrawerOpen?40:0.0)
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 50,),
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
                      Image.asset('assets/safenari3.png',scale: 13,color: const Color(0xff119DA4),),

                    ],
                  ),
                ),
                SizedBox(height: height*0.03,),
                Container(
                  height: height*0.25,
                  child: Column(
                    children: [
                      const SizedBox(height: 10,),
                      Expanded(
                        child: CarouselSlider(
                          options: CarouselOptions(
                              aspectRatio: 2, height: 350,
                              autoPlay: true,
                              viewportFraction: 1,onPageChanged: (index, reason) {
                            setState(() {
                              current = index;
                            });
                          }),
                          items: image.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return InkWell(
                                  onTap: (){
                                    // Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoryProduct(name: "Category Name",)));
                                  },
                                  child: Container(
                                    width: width,
                                    margin: const EdgeInsets.symmetric(horizontal: 15),
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(5),
                                    // ),
                                    child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(i, fit: BoxFit.fill,)),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: image.asMap().entries.map((entry) {
                          return InkWell(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                              width: current == entry.key ? 10 : 6,
                              height: current == entry.key ?10 : 6,
                              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (Theme.of(context).brightness == Brightness.dark
                                      ?  Colors.white
                                      : const Color(0xff5c3393)).withOpacity(current == entry.key ? 0.9 : 0.4)),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Container(
                            height: 50,
                            width: 50,
                            child: Lottie.asset('assets/news.json')),
                        Text('Latest News',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                        Spacer(),
                        Text('See More  ',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: width,
                    height: height*0.29,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          width: width*0.4,
                          margin: const EdgeInsets.only(right: 10,bottom: 10,left: 10),
                          padding: const EdgeInsets.all(10),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height*0.15,
                                width: width*0.35,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset('assets/bg4.jpeg',fit: BoxFit.fill,),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text('Title of news jahk khajsh dkahd kajskdjak',
                                maxLines: 2,overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),
                              ),
                              SizedBox(height: 10,),
                              Text('1 Aug,2022',
                                style: TextStyle(fontSize: 13,color: Colors.grey),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Container(
                            height: 30,
                            width: 30,
                            child: Image.asset('assets/briefcase.gif')),
                        Text('  Jobs',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
                        Spacer(),
                        Text('See More',style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: width*0.6,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: const [
                                        Text('Sr. Flutter Developer jkah kzhsdkad',
                                          maxLines: 2,
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                        ),
                                        Spacer(),
                                        Text('1 Aug, 2022',
                                          style: TextStyle(fontSize: 12,color: Colors.grey),
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
                                      child: Text('\u002445/hr',style: TextStyle(fontWeight: FontWeight.bold,
                                          fontSize: 15,color: Colors.black),),
                                    ),
                                  )
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
                              child: Text('Apply',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
