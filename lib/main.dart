import 'package:flutter/material.dart';
import 'package:flutter_app_demo/dashboard_page.dart';

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: new Scaffold(
    appBar: new AppBar(
      title: new Text("塔山電廠資訊版"),
    ),
    body: new DashboardPage(),
  ),
));