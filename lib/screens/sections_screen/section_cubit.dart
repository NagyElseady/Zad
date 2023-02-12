import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../asceticism_flakes_screen/section_detail_screen.dart';
import '../contemporary%20_islamic_%20issues/contemporary%20_islamic_%20issues.dart';
import '../education_%20muslim%20family_screen/education_muslim_screen.dart';
import '../history_stories_screen/history_stories_screen.dart';
import '../islamic_faith_screen/islamic_faith_screen.dart';
import '../jurisprudence_screen/juispudence_screen.dart';
import '../literature%20_ethics_screen/literature_ethics_screen.dart';
import '../periodic%20_events_screen/periodic_event_screen.dart';
import '../seasons%20_%20goodness_screen/seasons_goodness_screen.dart';
import '../sections_screen/zad_states.dart';
import '../various_subjects_screen/various_subject_screen.dart';

class ZadCubit extends Cubit<ZadStates> {
  ZadCubit() : super(ZadInitialState());

  static ZadCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  //late Database database;

  /*List<Map> asceticismFlakes = [];
  List<Map> contemporaryIslamicIssues = [];
  List<Map> educationMuslimFamily = [];
  List<Map> historyStories = [];
  List<Map> islamicFaith = [];
  List<Map> jurisprudence = [];
  List<Map> literatureEthicsFamily = [];
  List<Map> periodicEvent = [];
  List<Map> seasonsGoodness = [];
  List<Map> variousSubjects = [];*/

  List<Widget> screens = [
    const ContemporaryIslamicIssuesScreen(),
    const EducationMuslimFamilyScreen(),
    const HistoryStoriesScreen(),
    const IslamicFaithScreen(),
    const jurisprudenceScreen(),
    const LiteratureEthicsScreen(),
    const PeriodicEventScreen(),
    const SeasonsGoodnessScreen(),
    const VariousSubjectsScreen(),
  ];

  /* List<String> titels = [
    'AsceticismFlakes',
    'ContemporaryIslamicIssues',
    'EducationMuslimFamily',
    'HistoryStories',
    'IslamicFaith',
    'jurisprudence',
    'LiteratureEthics',
    'PeriodicEvent',
    'SeasonsGoodness',
    'SeasonsGoodness',
    'VariousSubjects',
  ];

  void navigateTo(context, widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) async {
      if (kDebugMode) {
        print('database create');
      }
      await database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT ,status TEXT)')
          .then((value) {
        {
          print('table created');
        }
      }).catchError((error) {
        {
          print('Error When Creating Table ${error.toString()}');
        }
      });
    }, onOpen: (database) {
      getDataFromDatabase(database);
      print('database opened');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseStates());
    });
  }

  insertToDatabase({
    required String title,
    required String status,
  }) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO tasks(title , status ) VALUES ("$title", "$status )')
          .then((value) {
        if (kDebugMode) {
          print('$value inserted successfully');
          emit(AppInsertDatabaseState());

          getDataFromDatabase(database);
        }
      }).catchError((error) {
        if (kDebugMode) {
          print('Error When Inserting New Record ${error.toString()}');
        }
        return null;
      });
    });
  }

  void getDataFromDatabase(database) {
    asceticismFlakes = [];
    contemporaryIslamicIssues = [];
    educationMuslimFamily = [];
    historyStories = [];
    islamicFaith = [];
    jurisprudence = [];
    literatureEthicsFamily = [];
    periodicEvent = [];
    seasonsGoodness = [];
    variousSubjects = [];

    emit(AppGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['screens'] == 'asceticismFlakes') {
          asceticismFlakes.add(element);
        } else if (element['screens'] == 'contemporaryIslamicIssues') {
          contemporaryIslamicIssues.add(element);
        } else {
          if (element['screens'] == 'educationMuslimFamily') {
            educationMuslimFamily.add(element);
          } else {
            if (element['screens'] == 'historyStories') {
              historyStories.add(element);
            } else {
              if (element['screens'] == 'islamicFaith') {
                islamicFaith.add(element);
              } else {
                if (element['screens'] == 'jurisprudence') {
                  jurisprudence.add(element);
                } else {
                  if (element['screens'] == 'literatureEthicsFamily') {
                    literatureEthicsFamily.add(element);
                  } else {
                    if (element['screens'] == 'periodicEvent') {
                      periodicEvent.add(element);
                    } else {
                      if (element['screens'] == 'seasonsGoodness') {
                        seasonsGoodness.add(element);
                      } else {
                        if (element['screens'] == 'variousSubjects') {
                          variousSubjects.add(element);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      });

      emit(AppGetDatabaseState());
    });
  }

  void updateData({
    required String title,
    required String status,
  }) {
    database.rawUpdate('UPDATE screens SET status = ? WHERE name = ?',
        [status, title]).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteData({
    required String title,
    required String status,
  }) {
    database.rawDelete(
        'DELETE FROM  screens  WHERE title = ?', ['status']).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }*/

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/file.txt');
  }
}
