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
  @override
  Widget build(BuildContext context) {

    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child:Container(
        
      )
    );
  }
}
