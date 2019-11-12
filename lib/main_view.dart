import 'package:flutter/material.dart';
import 'home_view.dart';
import 'message_view.dart';
import 'profile_view.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();

}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Flutter Tabs"),
        leading: new Icon(Icons.bubble_chart),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.orangeAccent
              ],
            ),
          ),
        ),
        bottom: _buildTabBar(),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomePage(),
          ProfilPage(),
          MessagePage(),
        ],
      ),
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Colors.white,
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.home),
          text: "Home",
        ),
        Tab (
          icon: Icon(Icons.person),
          text: "Profile",
        ),
        Tab (
          icon: Icon(Icons.message),
          text: "Message",
        )
      ],
    );
  }

}


