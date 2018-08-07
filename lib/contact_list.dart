import 'package:flutter/material.dart';
import 'package:flutter_app_demo/models/contact.dart';

class ContactsList extends StatelessWidget {
  final List<GeneratorModel> _contactModal;

  ContactsList(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<ContactListItem> _buildContactsList() {
    return _contactModal
        .map((contact) => new ContactListItem(contact))
        .toList();
  }
}

class ContactListItem extends StatelessWidget {
  final GeneratorModel _contactModal;

  ContactListItem(this._contactModal);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        title: new Text(_contactModal.name),
        subtitle: new Text(_contactModal.value.toString()));
  }
}