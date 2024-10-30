import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'zomato_model.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();

  openDatabase(
    join(await getDatabasesPath(),"ZomatoDB.db"),
    version: 1,
    onCreate: (db,version){
      db.query(
        '''CREATE TABLE Zomato(
            orderId INT PRIMARY KEY,
            custName TEXT,
            hotelName TEXT,
            food TEXT,
            bill REAl
        )''');
    },
  );

}