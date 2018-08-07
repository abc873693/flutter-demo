import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_demo/models/contact.dart';
import 'package:flutter_app_demo/contact_list.dart';

class DashboardPage extends StatelessWidget {
  _buildContactList() {

    return <GeneratorModel>[

    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new ContactsList(_buildContactList()));
  }
}