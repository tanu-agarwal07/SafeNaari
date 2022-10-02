import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SafetyDetail extends StatefulWidget {
  final video,name,description;
  const SafetyDetail({Key? key,this.video,this.name,this.description}) : super(key: key);

  @override
  State<SafetyDetail> createState() => _SafetyDetailState();
}

class _SafetyDetailState extends State<SafetyDetail> {

  dynamic height,width;



  @override
  Widget build(BuildContext context) {

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: widget.video,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );

    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                height: height*0.28,
                width: width,
                child: Hero(
                    tag: 'video',
                    child: YoutubePlayer(
                      controller: controller,
                      showVideoProgressIndicator: true,
                      progressIndicatorColor: Colors.lightBlueAccent,
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(isExpanded: true),
                        // FullScreenButton(),
                      ],
                      onReady: (){
                        print('onReady for ');
                      },
                    ),
                ),
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
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(widget.description,style: TextStyle(fontSize: 15),),
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
