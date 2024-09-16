import 'package:contact_app/db/db_helper.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/foundation.dart';

class ContactProvider with ChangeNotifier{
  final _db = DbHelper();
  Future<int> insertContact(ContactModel contact) {
    return _db.insert(contact);
  }

}