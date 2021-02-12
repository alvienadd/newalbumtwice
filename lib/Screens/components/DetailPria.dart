import 'package:flutter/material.dart';
import 'package:newalbumtwice/others/DataTokoh.dart';

class DetailPria extends StatefulWidget {
  final DataTokoh args;

  const DetailPria({
    Key key,
    this.args,
  }) : super(key: key);

  @override
  _DetailPriaState createState() => _DetailPriaState();
}

class _DetailPriaState extends State<DetailPria> {

  //  List<DataTokoh> _list;

  @override
  Widget build(BuildContext context) {

    // double width=MediaQuery.of(context).size.width;
    // double height=MediaQuery.of(context).size.height;
    var tracks=widget.args.tracks;

    return Scaffold(
  
        body: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: tracks.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child:Column(
                          children:<Widget>[Text(
                                  tracks[index].name,
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 16),
                                ),
                          ])
                        );})
        
        
        // Center(child: Text("${widget.args.tracks[id].name}"))
      
    );
  }
}
