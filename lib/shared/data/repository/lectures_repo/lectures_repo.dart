import 'package:zad/shared/core/result/result.dart';
import 'package:zad/shared/data/data_source/lectures_local_data_src/lectures_local_data_src.dart';
import 'package:zad/shared/data/models/lecture.dart';

import '../../../domain/respository/lectures_repository/lectures_repo.dart';

class LecturesRepo extends BaseLecturesRepository {
  final LecturesLocalDartSrc localSrc;

  LecturesRepo(this.localSrc);

  @override
  Future<Result<List<Lecture>>> lecturesBySectionId(int id) async {
    return localSrc.lecturesBySectionId(id);
  }

  @override
  void updateLecture(Lecture item) async {}
}
