import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'zomato_model.dart';

dynamic database;

void insertData(Zomato zObj)async {
  Database localDB = await database;

  await localDB.insert("Zomato", zObj.zomatoMap(),conflictAlgorithm : ConflictAlgorithm.replace);
}

Future<List<Map<String,dynamic>>> showData()async {
  Database localDB = await database;

  List<Map<String,dynamic>> data = await localDB.query("Zomato");

  return data;
}

void updateData(Zomato zObj)async {
  Database localDB = await database;

  await localDB.update("Zomato", zObj.zomatoMap(),where: "orderId=?",whereArgs: [zObj.orderId]);
}

void deleteData(Zomato zObj)async{
  Database localDB = await database;

  await localDB.delete("Zomato",where: "orderId=?",whereArgs: [zObj.orderId]);
}

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
    join(await getDatabasesPath(),"ZomatoDB.db"),
    version: 1,
    onCreate: (db,version)async{
      await db.execute(
        '''CREATE TABLE Zomato(
            orderId INT PRIMARY KEY,
            custName TEXT,
            hotelName TEXT,
            food TEXT,
            bill REAL
        )''');
    },
  );

  Zomato order1 = Zomato(orderId: 201, custName: "Sanket", hotelName: "McDonalds", food: "Maharaja Veg Burger,Peri Peri Cheesy Fries,Coke", bill: 469);

  Zomato order2 = Zomato(orderId: 202, custName: "Rahul", hotelName: "McDonalds", food: "Maharaja Nonveg Burger,Fries,Coke,Nudgets", bill: 569);

  insertData(order1);
  insertData(order2);

  print(await showData());

  order2 = Zomato(orderId: order2.orderId, custName: order2.custName, hotelName: order2.hotelName, food: "Maharaja Nonveg Burger,Coke,Nudgets", bill: 387);

  updateData(order2);

  print(await showData());

  deleteData(order1);

  print(await showData());

}