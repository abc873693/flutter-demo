import 'package:flutter/material.dart';
import 'package:flutter_app_demo/pages/dashboard_page.dart';
import 'package:flutter_app_demo/pages/setting_page.dart';

void main() => runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        body: new HomePage(),
      ),
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

// SingleTickerProviderStateMixin is used for animation
class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;
  int _currentIndex = 0;
  final List<Widget> _children = [new DashboardPage(), new SettingPage()];

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("塔山電廠資訊版"),
        // Set the background color of the App Bar
        backgroundColor: Colors.blue,
      ),
      // Set the TabBar view as the body of the Scaffold
      body: _children[_currentIndex],
      // Set the bottom navigation bar
      bottomNavigationBar: new BottomNavigationBar(
        // set the color of the bottom navigation bar
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        // set the tab bar as the child of bottom navigation bar
        items: [
          BottomNavigationBarItem(
            // set icon to the tab
            icon: Icon(Icons.dashboard),
            title: Text("主控版"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text("設定"),
          ),
        ],
        //,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
