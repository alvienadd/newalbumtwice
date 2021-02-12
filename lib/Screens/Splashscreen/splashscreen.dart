import 'dart:async';

import 'package:flutter/material.dart';
import 'package:newalbumtwice/Screens/Dashboard/dashboard.dart';

class Splashscreen extends StatefulWidget{
  @override
  _SplashscreenState createState()=>_SplashscreenState();
}


class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:5),()=>{
      Navigator.push(
        context,
        MaterialPageRoute(builder:(context)=>Dashboard())
      )
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(decoration: BoxDecoration(color: Colors.pink)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:<Widget>[
            Expanded(
              flex:2,
              child:Container(
                child:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                    children:<Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius:100.0,
                        child: Image(image: AssetImage('assets/icons/logo.png'))
                      ),
                      Padding(
                        padding:EdgeInsets.only(top:14.0),
                      ),
                      Text('New Album Twice',style: TextStyle(color:Colors.white,fontSize:24.0,fontWeight: FontWeight.bold),),
                              Padding(
                    padding:EdgeInsets.only(top:6.0)
                  ),
                         Text('Album Twice Via Apps',style:TextStyle(color:Colors.black,fontSize:18.0,fontWeight:FontWeight.bold)),
                    ]
                )
              )
            ),
            Expanded(
              flex:1,
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  CircularProgressIndicator(),
                ]
              )
            )
          ]
        )
      ],
    ));
  }
}
