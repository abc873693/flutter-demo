import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app_demo/models/contact.dart';
import 'package:dio/dio.dart';

class ContactsList extends StatefulWidget {
  final List<GeneratorModel> _contactModal;

  ContactsList(this._contactModal);

  @override
  State createState() => _ContactsListState(_contactModal);
}

class GeneratorItem extends StatelessWidget {
  final GeneratorModel _contactModal;

  GeneratorItem(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new ListTile(
          title: new Text(_contactModal.name),
          subtitle: new Text(_contactModal.value.toString())),
    );
  }
}

class _ContactsListState extends State<ContactsList> {
  List<GeneratorModel> contactModal;

  _ContactsListState(this.contactModal);

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return new GridView.count(
      primary: true,
      crossAxisCount: 3,
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<GeneratorItem> _buildContactsList() {
    return contactModal.map((contact) => new GeneratorItem(contact)).toList();
  }

  _getData() async {
    Dio dio = new Dio();
    Response response =
        await dio.get("http://test-tat.icp-si.com:62381/generators");
    print(response.data.length);
    contactModal.clear();
    for (var i in response.data) contactModal.add(GeneratorModel.fromJson(i));
    print(contactModal.length);
    setState(() {});
    startTimeout(5000);
  }

  static const timeout = const Duration(seconds: 3);
  static const ms = const Duration(milliseconds: 1);

  startTimeout([int milliseconds]) {
    var duration = milliseconds == null ? timeout : ms * milliseconds;
    return new Timer(duration, _getData);
  }
}
