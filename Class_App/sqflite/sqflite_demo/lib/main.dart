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

void updateData(Demo obj)async {
  Database localDB = await database;

  localDB.update("Information",
   obj.demoMap(),
   where: "mobile = ?",
   whereArgs: [obj.mobile],
   );
}

void deleteData(Demo obj)async {

  Database localDB = await database;

  localDB.delete("Information",
  where : "mobile = ?",
  whereArgs: [obj.mobile],
  );

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

  print(await showData());

  obj2 = Demo(fname: obj2.fname, lname: obj2.lname, age:25.1 , mobile: obj2.mobile);

  updateData(obj2);

  print(await showData());

  deleteData(obj2);

  print(await showData());

}