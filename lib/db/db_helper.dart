import 'package:contact_app/models/contact_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DbHelper {
  final createTableContact = '''create table $tableContact(
  $tblContactColId integer primary key autoincrement,
  $tblContactColName text,
  $tblContactColMobile text,
  $tblContactColEmail text,
  $tblContactColAddress text,
  $tblContactColDob text,
  $tblContactColGender text,
  $tblContactColGroup text,
  $tblContactColImage text,
  $tblContactColFavorite text,
  $tblContactColWebsite integer)''';


  Future<Database> _open() async {
    final rootpath = await getDatabasesPath();
    final dbpath = path.join(rootpath, 'contact');
    return openDatabase(dbpath, version: 1, onCreate: (db, version){
      db.execute(createTableContact);
    },);
  }

  Future<int> insert(ContactModel contact) async {
    final db = await _open();
    return db.insert(tableContact, contact.toMap());
  }

}