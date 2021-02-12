import 'package:flutter/material.dart';
import 'package:newalbumtwice/JsonParse.dart';
import 'package:newalbumtwice/Screens/components/Pria.dart';
import 'package:newalbumtwice/Screens/components/Tokoh.dart';
import 'package:newalbumtwice/Screens/components/Wanita.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>  with SingleTickerProviderStateMixin {

  //This is a String for the sake of an example
  //You can use any type you want.

  // int _currentIndex=0;

  // we need this to switch between tabs
  TabController _tabController;
  // here we remember the current tab, by default is the first one (index 0)
  int _currentTabIndex = 0;
 
  @override
  void initState() {
    super.initState();
    // init the TabController
    _tabController = TabController(vsync: this, length: _Tab.values.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          width:MediaQuery.of(context).size.width,
          decoration:BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image:AssetImage('assets/icons/bgheader.PNG')
            )
          ),
        ),
        automaticallyImplyLeading: false,
        actions:<Widget> [
          ImageIcon(
            AssetImage('assets/icons/Alert.png'),
          ),
          Container(padding:const EdgeInsets.all(6.0)),
          ImageIcon(
            AssetImage('assets/icons/Options.png'),
          ),
           Container(padding:const EdgeInsets.all(3.0)),
        ],
        elevation:0,
        // title:
        // Transform(
        //   // you can forcefully translate values left side using Transform
        //   transform:  Matrix4.translationValues(0.0, 0.0, 0.0),
        //   child: Image.asset('assets/icons/logo2.png',height:100,width:100)
        // ),
         title:_currentTabIndex ==0?Transform(transform:  Matrix4.translationValues(0.0, 0.0, 0.0),child: Image.asset('assets/icons/logo2.png',height:100,width:100)):Text(_getTitleForCurrentTab(_Tab.values[_currentTabIndex])), // set the title in the AppBar
      ),
      backgroundColor: Color(int.parse('#F2F2F2'.replaceAll('#', '0xff'))),
      body:_getBody(_currentTabIndex),
      bottomNavigationBar:BottomNavigationBar(
        // currentIndex: _currentIndex,
        selectedItemColor:Colors.grey,
        type:BottomNavigationBarType.fixed,
        items: _Tab.values.map((_Tab tab)=>BottomNavigationBarItem(
            title:Text(_getTitleForCurrentTab(tab)),
            icon:Image.asset(
              _getAssetForTab(tab),
              width: 24.0,
              height: 24.0,
            )
          )
        ).toList(),
        onTap:(int index){
          setState(() {
            _currentTabIndex=index;
          });
        },
      ),
    );
  }

  /// Get the title for the current selected tab
  String _getTitleForCurrentTab(_Tab tab) {
    if (tab == _Tab.TAB1) {
      return 'Tokoh';
    } else if (tab == _Tab.TAB2) {
      return 'PL';
    }
     else if (tab == _Tab.TAB3) {
      return 'PB';
    }
    return 'Wallpaper';
 }

  /// Get the asset icon for the given tab
  String _getAssetForTab(_Tab tab) {
    // check if the given tab parameter is the current active tab
    final active = tab == _Tab.values[_currentTabIndex];

    // now given the tab param get its icon considering the fact that if it is active or not
    if (tab == _Tab.TAB1) {
      return active ? 'assets/icons/scheduleOn.png' : 'assets/icons/scheduleOff.png';
    } else if (tab == _Tab.TAB2) {
      return active ? 'assets/icons/menuOn.png' : 'assets/icons/menuOff.png';
    } else if (tab == _Tab.TAB3) {
     return active ? 'assets/icons/PromoOn.png' : 'assets/icons/PromoOff.png';
    }
    return active ? 'assets/icons/ProfileOn.png' : 'assets/icons/ProfileOff.png';
  }

}

Widget _getBody(int index){
 switch (index) {
      case 0:
        return Tokoh(); // Create this function, it should return your first page as a widget
      case 1:
        return Center(child: Text("There is no page builder for this index"),); // Create this function, it should return your second page as a widget
      case 2:
        return Center(child: Text("There is no page builder for this index"),);// Create this function, it should return your third page as a widget
      case 3:
         return JsonParse(); // Create this function, it should return your fourth page as a widget
    }
    return Center(child: Text("There is no page builder for this index"),);
}


 //Melakukan Enumerasi setiap Tab agar sesuai dengan klik
enum _Tab{
  TAB1,
  TAB2,
  TAB3,
  TAB4,
}


