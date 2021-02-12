import 'package:flutter/material.dart';
import 'package:newalbumtwice/core/const.dart';
import 'package:newalbumtwice/others/DataTokoh.dart';
import 'package:newalbumtwice/widgets/custom_button_widget.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';



class DetailPria extends StatefulWidget {
  final DataTokoh args;

  const DetailPria({
    Key key,
    this.args,
  }) : super(key: key);

  @override
  _DetailPriaState createState() => _DetailPriaState();
}


ThemeData _lightTheme = ThemeData(
    accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue);

ThemeData _darkTheme = ThemeData(
    accentColor: Colors.red,
    brightness: Brightness.dark,
    primaryColor: Colors.amber);

bool _light = true;

class _DetailPriaState extends State<DetailPria> with SingleTickerProviderStateMixin {

  //  List<DataTokoh> _list;


  //For Animation Rotate
  AnimationController _controller;

  int _playId;

  //we will need some variables
  bool playing = true; // at the begining we are not playing any song
  IconData playBtn = Icons.play_arrow; // the main state of the play button icon
  IconData pauseBtn =Icons.play_arrow; // the main state of the play button icon

  //Now let's start by creating our music player
  //first let's declare some object
  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

   //we will create a custom slider

  Widget slider() {
    return Container(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  //let's create the seek function that will allow us to go to a certain position of the music
  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    //Implement Applovin Ads
    //  AppLovin.init();

   // TODO: implement initState
    _playId = 1;
    // _list = MusicModel.list;

    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);


    super.initState();

    //now let's handle the audioplayer time

    //this function will allow you to get the music duration
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    //this function will allow us to move the cursor of the slider while we are playing the song
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };

    //For Animation Image
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..repeat();

    //  AppLovin.requestInterstitial(
    //               (AppLovinAdListener event) => listener(event, true),
    //               interstitial: true);
  }


  createAlertDialog(BuildContext context){
    return showDialog(context: context,builder:(context){
      return AlertDialog(
        title:Text('${widget.args.tracks[_playId-1].name}'),
        content: Text('${widget.args.tracks[_playId-1].lyrics}')
      );
    });
  }

  Future<bool> _onBackPressed(){
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   _player.pause();

  // }
  return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to Main Menu?'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                 _player.pause();

                },
              ),
            ],
          );
        });
}

  @override
  Widget build(BuildContext context) {

    // double width=MediaQuery.of(context).size.width;
    // double height=MediaQuery.of(context).size.height;
    var tracks=widget.args.tracks;

    return Scaffold(
  
      backgroundColor: const Color(0xFF212121),
      body: WillPopScope(
            onWillPop: _onBackPressed,
              child: Stack(children: <Widget>[
              Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CustomButtonWidget(
                          child:
                              Icon(Icons.favorite, color: AppColors.styleColor),
                          size: 50,
                          onTap: () {},
                        ),
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (_, child) {
                            return  playing?Transform.rotate(
                            angle: _controller.value *0*0,
                            child: child,
                          ):Transform.rotate(
                            angle: _controller.value * 2 * 3.14,
                            child: child,
                          );
                          },
                          child: CustomButtonWidget(
                            image: "assets/icons/bible1.png",
                            size: 150,
                            borderWidth: 5,
                            onTap: () {},
                          ),
                        ),
                //      Column(
                //   children: <Widget>[
                //     Center(
                //       child: Switch(
                //           value: _light,
                //           onChanged: (state) {
                //             setState(() {
                //               _light = state;
                //             });
                //           }),
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(bottom:12.0),
                //       child: Container(
                //         child:_light ?Text('Dark Mode'):Text('Light Mode')
                //       ),
                //     ),
                //   ],
                // ),
                   CustomButtonWidget(
                          child:
                              Icon(Icons.list, color: AppColors.styleColor),
                          size: 50,
                          onTap: () {
                            createAlertDialog(context);
                          },
                        ),

                      ]),
                ),
                slider(),
                
                //  RaisedButton(
                //             child: Text('Show interstitial ad'),
                //             onPressed: () async {
                //               await StartApp.showInterstitialAd();
                //             }),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: tracks.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: tracks[index] == _playId
                                ? AppColors.activeColor
                                : AppColors.mainColor,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        padding: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    tracks[index].name,
                                    style: TextStyle(
                                        color: AppColors.styleColor,
                                        fontSize: 16),
                                  ),
                                 
                                ]),
                            CustomButtonWidget(
                                child: Icon(
                                    tracks[index].id == _playId
                                        ? pauseBtn
                                        : playBtn,
                                    color: tracks[index].id == _playId
                                        ? Colors.white
                                        : AppColors.styleColor),
                                size: 50,
                                isActive: tracks[index].id == _playId,
                                onTap: () {
                                  if (playing) {
                                    //now let's play the song
                                    _player.play('${tracks[index].path}',isLocal: true);
                                    
                                    setState(() {
                                      _playId = tracks[index].id;
                                      playing = false;
                                      playBtn = Icons.play_arrow;
                                      pauseBtn = Icons.pause;
                                    });
                                  } else if (!playing) {
                                    if (tracks[index].id == _playId) {
                                      _player.pause();
                                      setState(() {
                                        playing = true;
                                        playBtn = Icons.play_arrow;
                                        pauseBtn = Icons.play_arrow;
                                      });
                                    } else {
                                      _player.play('${tracks[index].path}',isLocal: true);
                                      setState(() {
                                        _playId = tracks[index].id;
                                      });
                                    }
                                  }
                                })
                          ],
                        ),
                      );
                    },
                  ),
                )
              ]),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Container(
              //     height: 20,
              //     decoration: BoxDecoration(
              //         gradient: LinearGradient(colors: [
              //       AppColors.mainColor.withAlpha(0),
              //       AppColors.mainColor
              //     ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              //   ),
              // ),
            ]),
      ),

        // body: ListView.builder(
        //           physics: BouncingScrollPhysics(),
        //           itemCount: tracks.length,
        //           itemBuilder: (context, index) {
        //             return Container(
        //                 child:Column(
        //                   children:<Widget>[Text(
        //                           tracks[index].name,
        //                           style: TextStyle(
        //                               color: Colors.pink,
        //                               fontSize: 16),
        //                         ),
        //                   ])
        //                 );})
        
        
        // Center(child: Text("${widget.args.tracks[id].name}"))
      
    );
  }
}
