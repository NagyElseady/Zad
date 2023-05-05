import 'package:zad/shared/data/database/zad_database.dart';

import '../../../core/result/result.dart';
import '../../models/lecture.dart';

class LecturesLocalDartSrc {
  final ZadDatabase db;

  LecturesLocalDartSrc(this.db);

  Future<Result<List<Lecture>>> lecturesBySectionId(int id) async {
    return db.lecturesBySectionId(id);
  }

  void updateLecture(Lecture item) async {
    return db.updateLecture(item);
  }

  Future<List<Lecture>> searchResult(String text) async {
    return db.search(text);
  }

  Future<List<Lecture>> favoriteLectures() {
    return db.favoriteLectures();
  }
}
