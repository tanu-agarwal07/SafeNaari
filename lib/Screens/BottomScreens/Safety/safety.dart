import 'package:flutter/material.dart';
import 'package:safenaari/Screens/BottomScreens/Safety/safety_detail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../dashboard.dart';

class WomenSafety extends StatefulWidget {
  const WomenSafety({Key? key}) : super(key: key);

  @override
  State<WomenSafety> createState() => _WomenSafetyState();
}

class _WomenSafetyState extends State<WomenSafety> {

  dynamic height,width;

  final List _videoUrlList = [
    {
      'video' : 'https://www.youtube.com/watch?v=kKDHdsVN0b8',
      'name' : 'Boxing',
      'description' : 'Mental health benefits\n\nBoxing, as with all exercise, increases the level of endorphins, the natural feel-good chemicals that can help improve mood. But there are other substantial mental health benefits too. Boxing can help reduce symptoms of anxiety and depression by focusing on the mind and body in the present moment. Encouraging, friendly classes support better mental health by being with supportive people, and the achievement that comes with learning to box can be a really powerful way to boost self-confidence and self-esteem.\n\nImproves functional strength\n\nBoxing is a fantastic way to improve functional strength for women. The different techniques used in training help to build muscular endurance and longevity, and these increase strength and physical ability that carries through to everyday life outside of the gym.',
    },
    {
      'video' : 'https://www.youtube.com/watch?v=G_U77arlUX0',
      'name' : 'Kicks',
      'description' : 'In order to counterattack effectively, a person must know how to use striking techniques effectively. In the Krav Maga Worldwide® self-defense system, striking techniques are known as “combatives”. Students learn to fight and defend themselves by using punches, elbows, knees and kicks. In Krav Maga Worldwide self-defense Level 1 there are three kicks that students have to learn, and demonstrate effectiveness with, in order to progress into higher krav maga levels.\n\nThese three kicks are important in terms of progression through the Krav Maga belt system and  because they are, really, “must know” kicking techniques for effective self-defense. A huge number of assaults, or fights, or self-defense situations do end up at close range or on the ground. However being able to establish distance from an attacker or opponent, maintain that distance and do damage, is an incredibly valuable skill that can keep you out of that close range or off of the ground. Many people don’t know how to effectively use kicks, they underestimate the value of powerful kicking and quite simply don’t expect to get kicked. In this blog we’ll take a look at three kicks you absolutely must know for effective self-defense.',
    },
    {
      'video' : 'https://www.youtube.com/watch?v=Ot-rBhiIUKs',
      'name' : 'Taekwondo',
      'description' : 'Taekwondo is as much a mental art as much as it is physical. Learning Taekwondo and practicing various kinds of moves requires goal setting; and during any match situation you need quick decision making skills in order to come up trumps. Practicing Taekwondo helps you develop just that. This ability of goal setting and quick decision making would also help you in real life scenarios. Self Defence Taekwondo, just like any other martial art would help you in self defence. One of the main objectives of Taekwondo is to teach people to defend themselves from any threats. In any unwanted situation, this martial art form will help you to defend yourself and come out unhurt.',
    },
    {
      'video' : 'https://www.youtube.com/watch?v=e64AtWekQVo',
      'name' : 'Martial Arts',
      'description' : 'Martial arts evolved for combat training and self-defence, and a strong, calm mind is a prerequisite to face an adverse situation. Kalsi says, “Martial artists are known for the control they exercise over their mind and for training themselves to keep calm during difficult situations. If we have a positive mindset, it will not only help in quicker recovery from disease, but given the times we are living in, it is also necessary to combat various mental health challenges that people are dealing with in their own way.”\n\nEveryday training in martial arts is a test of the human spirit where you learn to challenge yourself and push yourself when the body and mind are ready to give up. “In today’s times, when mental health is taking a beating, these training sessions equip practitioners to forget their daily struggles and get stronger day by day. Regular training helps one develop a never-give-up attitude,” says Kalsi.',
    },
    {
      'video' : 'https://www.youtube.com/watch?v=KVpxP3ZZtAc',
      'name' : 'Self-Defense Moves',
      'description' : "According to Victims of Sexual Violence: Statistics on Rainn, about 80 percent of juvenile victims were female and 90 percent of rape victims were adult women. In addition, women from ages 18 to 34 are highly at risk to experience sexual assault. According to historian Wendy Rouse in Her Own Hero: The Origins of Women's Self-Defense Movement, women's self-defense training emerged in the early twentieth century in the United States and the United Kingdom paralleling the women's rights and suffrage movement. These early feminists sought to raise awareness about the sexual harassment and violence that women faced on the street, at work, and in the home.",
    },
  ];

  List <YoutubePlayerController> lYTC = [];

  Map<String, dynamic> cStates = {};

  @override
  void initState() {
    super.initState();
    fillYTlists();
  }

  fillYTlists(){
    for (var element in _videoUrlList) {
      String id = YoutubePlayer.convertUrlToId(element['video'])!;
      YoutubePlayerController ytController = YoutubePlayerController(
        initialVideoId: id,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          enableCaption: true,
          captionLanguage: 'en',
        ),
      );

      ytController.addListener(() {
        print('for $id got isPlaying state ${ytController.value.isPlaying}');
        if (cStates[id] != ytController.value.isPlaying) {
          if (mounted) {
            setState(() {
              cStates[id] = ytController.value.isPlaying;
            });
          }
        }
      });

      lYTC.add(ytController);
    }
  }

  @override
  void dispose() {
    for (var element in lYTC) {
      element.dispose();
    }
    super.dispose();
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
        title: Text('Safety Tutorials'),
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
                itemCount: _videoUrlList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context,index){
                  YoutubePlayerController _ytController = lYTC[index];
                  String _id = YoutubePlayer.convertUrlToId(_videoUrlList[index]['video'])!;
                  String curState = 'undefined';
                  if (cStates[_id] != null) {
                    curState = cStates[_id]? 'playing':'paused';
                  }
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SafetyDetail(
                        video: _videoUrlList[index]['video'],
                        name: _videoUrlList[index]['name'],
                        description: _videoUrlList[index]['description'],
                      )));
                    },
                    child: Container(
                      height: height*0.26,
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
                          Container(
                            height: height*0.2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(topLeft: const Radius.circular(15),topRight: Radius.circular(15)),
                              child: Hero(
                                  tag: 'video',
                                  child: YoutubePlayer(
                                    controller: _ytController,
                                    showVideoProgressIndicator: true,
                                    progressIndicatorColor: Colors.lightBlueAccent,
                                    bottomActions: [
                                      CurrentPosition(),
                                      ProgressBar(isExpanded: true),
                                      // FullScreenButton(),
                                    ],
                                    onReady: (){
                                      print('onReady for $index');
                                    },
                                    onEnded: (YoutubeMetaData _md) {
                                      _ytController.seekTo(const Duration(seconds: 0));
                                    },
                                  ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(_videoUrlList[index]['name'],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
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
        ),
      ),
    );
  }
}
