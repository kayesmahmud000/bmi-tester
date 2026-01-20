import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  //singleton
  DbHelper._();

 static final DbHelper getInstance=DbHelper._();

 static final TABLE_NOTE ='note';
 static final COLUMN_NOTE_SL_NO ='sl_no';
 static final COLUMN_NOTE_TITLE  ='title';
 static final COLUMN_NOTE_DESC  ='desc';


 //db open (path => if exits then open else create db)
 Database? myDB;

 Future<Database> getDB() async{

  myDB ??= await openDB();
  return myDB!;

  // if(myDB!=null){
  //   return myDB!;
  // }else{
  //   myDB =await openDB();
  //   return myDB!;
  // }
 }

 Future<Database> openDB() async{
  Directory directory = await getApplicationDocumentsDirectory();

  print('app directory');

  String dbPath = join(directory.path, 'noteDB.db');
  print('db path');

 return await openDatabase(dbPath, onCreate: (db, version) =>db.execute('create table $TABLE_NOTE ($COLUMN_NOTE_SL_NO integer primary key autoincrement, $COLUMN_NOTE_TITLE text, $COLUMN_NOTE_DESC text )') , version: 1);
 ///
 /// create multiple table hare;
 ///
 }


 //all queries

 //insertion
 Future<bool> addNote({ required String mTitle , required String mDesc})async{
  var db = await getDB();

 int rowEffected = await db.insert(TABLE_NOTE, {
    COLUMN_NOTE_TITLE: mTitle,
    COLUMN_NOTE_DESC:mDesc
  });

  return rowEffected>0;
 }

//  get all notes
Future<List<Map<String, dynamic>>> getNotes() async{

  var db = await getDB();

//select * from
 List<Map<String, dynamic>> myData= await db.query(TABLE_NOTE);

 return myData;

}

// update note
Future<bool> updateNote({required String title, required String desc, required int sl}) async{

var db = await getDB();

int rowEffected = await db.update(TABLE_NOTE, {
  COLUMN_NOTE_TITLE:title,
  COLUMN_NOTE_DESC:desc
}, where: "$COLUMN_NOTE_SL_NO = $sl");

return rowEffected>0;
}


//delete note

Future<bool> deleteNote({required int sl}) async{
  var db =await getDB();

 int rowEffected= await db.delete(TABLE_NOTE, where: "$COLUMN_NOTE_SL_NO = ?", whereArgs:['$sl'] );

 return rowEffected>0;
}
}