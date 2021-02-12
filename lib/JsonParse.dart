import 'package:flutter/material.dart';
import 'package:newalbumtwice/others/DataTokoh.dart';
import 'package:newalbumtwice/others/Services.dart';

class JsonParse extends StatefulWidget {
  JsonParse() : super();

  @override
  _JsonParseState createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  List<DataTokoh> _tokoh = List();
  List<DataTokoh> tempList = List();

  bool _loading;

  @override
  void initState() {
    // DO: implement initState
    super.initState();
    _loading = true;
    Services.getDataTokoh().then((value) {
      setState(() {
        _tokoh = value;
        tempList = _tokoh;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        body: Container(
            child: Column(children: <Widget>[
      _searchBar(),
      Expanded(
          child: GridView.builder(
              itemCount: null == tempList ? 0 : tempList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (context, index) {
                DataTokoh tokoh = tempList[index];
                return Card(
                    margin: EdgeInsets.all(20.0),
                    child: GridTile(
                        // title:Text(tokoh.name),
                        // subtitle:Text(tokoh.category)
                        footer: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            tokoh.category,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        child: Column(children: <Widget>[
                          Image(image: AssetImage('assets/icons/profpic.png')),
                          Text(
                            tokoh.name,
                            textAlign: TextAlign.center,
                          ),
                        ])));
              }))
    ])));
  }

  Widget _searchBar() {
    return Container(
      padding: EdgeInsets.only(bottom: 16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Cari Tokoh Alkitab .......",
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (string) {
          // _filterTokohList(text);
          setState(() {
            tempList = _tokoh
                .where(
                    (t) => t.name.toLowerCase().contains(string.toLowerCase()))
                .toList();
          });
          //  print('counter value : $tempList');
        },
      ),
    );
  }

  // _filterTokohList(String text){

  // }

}
