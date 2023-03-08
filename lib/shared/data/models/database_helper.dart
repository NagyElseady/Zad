import 'dart:core';
import 'dart:io' as io;

import 'package:flutter/services.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:zad/shared/data/models/database.dart';

class ZadDataBaseHelper {
  Database? db;

  Future<void> init() async {
    io.Directory applicationDirectory =
        await getApplicationDocumentsDirectory();

    String dbPathZad = path.join(applicationDirectory.path, "zaddb.db");

    bool dbExistsZad = await io.File(dbPathZad).exists();

    if (!dbExistsZad) {
      ByteData data = await rootBundle.load(path.join("assets ", "zaddb.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await io.File(dbPathZad).writeAsBytes(bytes, flush: true);
    }
    db = await openDatabase(dbPathZad);
  }

  Future<List<ZadLectures>> getAllZadLectures() async {
    if (db == null) {
      throw "bd is not initiated, initiate using [init(db)] function";
    }

    late List<Map<String, dynamic>> title;

    await db?.transaction((txn) async {
      title = await txn.query(
        "title",
        columns: ["title", "details"],
      );
    });

    return title.map((e) => ZadLectures.fromJson(e)).toList();
  }
}
