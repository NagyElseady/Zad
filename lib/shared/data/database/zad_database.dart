import 'dart:core';
import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:zad/shared/data/models/lecture.dart';

import '../models/database_column.dart';

class ZadDatabase {
  Database? db;
  String tableName = "zad";

  static final ZadDatabase _shared = ZadDatabase._internal();

  factory ZadDatabase() {
    return _shared;
  }

  ZadDatabase._internal();

  Future<void> setup() async {
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();

    String dbPathZad = path.join(applicationDirectory.path, "zad.db");

    bool dbExistsZad = await io.File(dbPathZad).exists();

    if (!dbExistsZad) {
      ByteData data = await rootBundle.load(path.join("assets/db", "zad.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await io.File(dbPathZad).writeAsBytes(bytes, flush: true);
    }

    db = await openDatabase(dbPathZad);
  }

  Future<List<Lecture>> getAllZadLectures() async {
    late List<Map<String, dynamic>> list;
    await db?.transaction((txn) async {
      list = await txn.query(
        tableName,
        columns: DatabaseColumn.allValues,
      );
    });

    return list.map((e) => Lecture.from(e)).toList();
  }

  Future<List<Lecture>> lecturesByCategoryId(int id) async {
    if (db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }

    late List<Map<String, dynamic>> title;

    String where = '${DatabaseColumn.categoryId.value} = ?';
    List<dynamic> whereArgs = [id];

    await db?.transaction((txn) async {
      title = await txn.query(
        tableName,
        columns: DatabaseColumn.allValues,
        where: where,
        whereArgs: whereArgs,
      );
    });

    return title.map((e) => Lecture.from(e)).toList();
  }

  Future<List<Lecture>> favoriteLectures() async {
    if (db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }

    late List<Map<String, dynamic>> title;

    String where = '${DatabaseColumn.isFavorite.value} = ?';
    List<dynamic> whereArgs = [1];

    await db?.transaction((txn) async {
      title = await txn.query(
        tableName,
        columns: DatabaseColumn.allValues,
        where: where,
        whereArgs: whereArgs,
      );
    });

    return title.map((e) => Lecture.from(e)).toList();
  }
}
