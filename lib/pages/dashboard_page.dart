import 'package:flutter/material.dart';
import 'package:flutter_app_demo/models/generator.dart';
import 'package:flutter_app_demo/weights/generator_list.dart';

class DashboardPage extends StatelessWidget {
  _buildContactList() {
    return <GeneratorModel>[];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new GeneratorList(_buildContactList()));
  }
}
