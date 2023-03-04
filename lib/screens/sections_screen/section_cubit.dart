import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../zad_states.dart';

class ZadCubit extends Cubit<ZadStates> {
  ZadCubit() : super(ZadInitialState());

  static ZadCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/file.txt');
  }

  late Database database;

  void createDatabase() {
    openDatabase('zad.db', version: 1, onCreate: (database, version) async {
      if (kDebugMode) {
        print('database create');
      }
      await database
          .execute(
              'CREATE TABLE zad (id INTEGER PRIMARY KEY, title TEXT , content TEXT )')
          .then((value) {
        {
          if (kDebugMode) {
            print('table created');
          }
        }
      }).catchError((error) {
        {
          if (kDebugMode) {
            print('Error When Creating Table ${error.toString()}');
          }
        }
      });
    }, onOpen: (database) {
      getDataFromDatabase(database);
      if (kDebugMode) {
        print('database opened');
      }
    }).then((value) {
      database = value;
      emit(ZadCreateDatabaseStates());
    });
  }

  void getDataFromDatabase(database) {
    database.rawQuery('SELECT * FROM zad');

    emit(ZadGetDatabaseState());
  }

  void updateData({
    required String lecture,
    required int id,
  }) {
    database.rawUpdate('UPDATE zad SET lecture = ? WHERE name = ?',
        [lecture, id]).then((value) {
      getDataFromDatabase(database);
      emit(ZadUpdateDatabaseState());
    });
  }

  void deleteData({
    required int id,
  }) {
    database.rawDelete('DELETE FROM  zad  WHERE id = ?', ['id']).then((value) {
      getDataFromDatabase(database);

      emit(ZadDeleteDatabaseState());
    });
  }
}
