import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

class LecturesDatabase {
  late Database database;

  void create() {
    openDatabase('zad.db', version: 1, onCreate: (database, version) async {
      if (kDebugMode) {
        print('database create');
      }
      await database
          .execute(
              'CREATE TABLE zad (id INTEGER PRIMARY KEY, title TEXT , content TEXT )')
          .then((value) {
        if (kDebugMode) {
          print('table created');
        }
      }).catchError((error) {
        if (kDebugMode) {
          print('Error When Creating Table ${error.toString()}');
        }
      });
    }, onOpen: (database) {
      if (kDebugMode) {
        print('database opened');
      }
    }).then((value) {
      database = value;
    });
  }

  insert(String title, String content) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO zad (title , content  ) VALUES ("$title", "$content ")')
          .then((value) {})
          .catchError((error) {
        if (kDebugMode) {
          print('Error When Inserting New Record ${error.toString()}');
        }
        return null;
      });
    });
  }

  // TODO: define the response
  void loadLectures() {
    database.rawQuery('SELECT * FROM zad');
  }

  void updateLecture(String lecture, int id) {
    database.rawUpdate('UPDATE zad SET lecture = ? WHERE name = ?',
        [lecture, id]).then((value) {});
  }

  void deleteLecture(int id) {
    database
        .rawDelete('DELETE FROM  zad  WHERE id = ?', ['id']).then((value) {});
  }
}
