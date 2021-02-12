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

   List<DataTokoh> _list;

  @override
  Widget build(BuildContext context) {

    // double width=MediaQuery.of(context).size.width;
    // double height=MediaQuery.of(context).size.height;
    var id=widget.args.tracks;

    return Scaffold(
  
        body: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return Container(
                        child:Column(
                          
                        )
                    )})
        
        
        // Center(child: Text("${widget.args.tracks[id].name}"))
      
    );
  }
}
