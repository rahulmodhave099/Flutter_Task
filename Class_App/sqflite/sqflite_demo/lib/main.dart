import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'demo_model.dart';

dynamic database;

void insertData(Demo obj) async {
    Database localDB = await database;

    await localDB.insert("Information",
     obj.demoMap(),
     conflictAlgorithm : ConflictAlgorithm.replace,
     );
     print("Data Added Successfully");
}

Future<List<Map<String,dynamic>>> showData() async {
    Database localDB = await database;

   return await localDB.query("Information");

}

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
   join(await getDatabasesPath(),"demoDB.db"),
   version: 1,
   onCreate: (db,version)async {
    await db.execute(
      '''CREATE TABLE Information(
        fname TEXT,
        lname TEXT,
        age REAL,
        mobile INT PRIMARY KEY
        )'''
    );
   },
  );

  Demo obj1 = Demo(fname: "Rahul", lname: "Modhave", age: 25, mobile: 7262021202);
  Demo obj2 = Demo(fname: "Ankita", lname: "Chougule", age: 25, mobile: 9146338327);

  insertData(obj1);

  insertData(obj2);

  List<Map> data = await showData();

  print(data);


}