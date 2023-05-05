import 'package:zad/shared/data/models/lecture.dart';

import '../../../core/result/result.dart';

abstract class BaseLecturesRepository {
  Future<Result<List<Lecture>>> lecturesBySectionId(int id) async {
    throw UnimplementedError("");
  }

  void updateLecture(Lecture item);

  Future<List<Lecture>> searchResult(String text);

  Future<List<Lecture>> favoriteLectures();
}
