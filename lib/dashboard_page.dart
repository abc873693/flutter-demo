import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app_demo/models/contact.dart';
import 'package:flutter_app_demo/contact_list.dart';

class DashboardPage extends StatelessWidget {
  _buildContactList()  {
    return <GeneratorModel>[
      const GeneratorModel(name: 'Romain Hoogmoed', value: 2.5),
      const GeneratorModel(name: 'Romain Hoogmoed', value: 2.5),
    ];
  }

  _getData() async{
    Dio dio = new Dio();
    Response response = await dio.get("http://test-tat.icp-si.com:62381/generators");
    print(response.data.toString());
  }

  @override
  Widget build(BuildContext context) {
    _getData();
    return new Scaffold(body: new ContactsList(_buildContactList()));
  }
}
