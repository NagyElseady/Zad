import 'package:get_it/get_it.dart';
import 'package:zad/shared/data/repository/lectures_repo/lectures_repo.dart';
import 'package:zad/shared/presentation/controller/lectures_bloc.dart';

import '../../data/data_source/lectures_local_data_src/lectures_local_data_src.dart';
import '../../data/database/zad_database.dart';

final locator = GetIt.instance;

class ServicesLocator {
  void setup() {
    setupDatabase();
    setupBloc();
    setupDataSrc();
    setupRepository();
  }

  void setupDatabase() {
    locator.registerLazySingleton<ZadDatabase>(() => ZadDatabase());
  }

  void setupBloc() {
    locator.registerFactory<LecturesBloc>(() => LecturesBloc(locator()));
  }

  void setupDataSrc() {
    locator.registerLazySingleton<LecturesLocalDartSrc>(() => LecturesLocalDartSrc(locator()));
  }

  void setupRepository() {
    locator.registerLazySingleton<LecturesRepo>(() => LecturesRepo(locator()));
  }

}
