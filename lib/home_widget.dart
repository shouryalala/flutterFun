import 'package:flutter/material.dart';
import 'package:flutter_app/placeholder_widget.dart';
import 'package:flutter_app/profile/profile_options.dart';
//import 'package:morpheus/morpheus.dart';
import 'nested-tab-navigator.dart';
enum TabItem { Home, Subscribe, Profile }

class Home extends StatefulWidget{
  @override
  State createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  //TabItem currentItem = TabItem.Home;
  final navigatorKey = GlobalKey<NavigatorState>();
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0 : GlobalKey<NavigatorState>(),
    1 : GlobalKey<NavigatorState>(),
    2 : GlobalKey<NavigatorState>(),
  };
  final List<Widget> _children = [
    PlaceholderWidget(Colors.white),
    PlaceholderWidget(Colors.deepOrange),
    ProfileOptions()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async =>
        !await navigatorKeys[_currentIndex].currentState.maybePop(),
    child:
    Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body://_buildOffstageNavigator(_currentIndex),
      Stack(children: <Widget>[
        _buildOffstageNavigator(0),
        _buildOffstageNavigator(1),
        _buildOffstageNavigator(2),
      ]),
      //MorpheusTabView(child: TabNavigator(navigatorKey: navigatorKey,),)
      bottomNavigationBar: BottomNavigationBar(
       //currentIndex: 0, // this will be set when a new tab is tapped
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            title: new Text('Subscribe'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      //currentTab = TabItem[index];
    });
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _currentIndex != index,
      child: TabNavigator(
        navigatorKey: navigatorKeys[index],
        item: index,
      ),
    );
  }
}

