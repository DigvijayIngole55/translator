import 'package:flutter/material.dart';

import 'package:motion_tab_bar/MotionTabController.dart';

import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:translatron/Pages/ChatPage.dart';
import 'TTTPage.dart';
import 'VTTPage.dart';
import 'ChatPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  MotionTabController _tabController;
  int pageIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = new MotionTabController(initialIndex: 1, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          child: Container(
            color: Colors.black87,
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.orangeAccent),
          backgroundColor: Colors.black,
          title: Text(
            'TRANSLATRON',
            style: TextStyle(
                fontSize: 28.0,
                fontFamily: "Norwester",
                color: Colors.orangeAccent),
          ),
        ),
        body: Container(
          color: Colors.black87,
          padding: EdgeInsets.only(top:10.0,right:10.0,left:10.0,bottom: 25.0),
          child: pageIndex == 0
              ? TTTPage()
              : (pageIndex == 1
                  ? VTTPage()
                  : ChatPage()
          ),
        ),
        bottomNavigationBar: MotionTabBar(
          labels: ["Text To Text", "Voice to Text", "Chat"],
          initialSelectedTab: "Text To Text",
          tabIconColor: Colors.white,
          tabSelectedColor: Colors.orangeAccent,
          onTabItemSelected: (int value) {
            pageIndex = value;
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.text_fields_sharp, Icons.keyboard_voice, Icons.chat],
          textStyle: TextStyle(
              color: Colors.orangeAccent,
              fontFamily: "Norwester",
              fontSize: 15),
        ),
      ),
    );
  }
}
