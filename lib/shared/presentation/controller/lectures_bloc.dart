import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/shared/data/repository/lectures_repo/lectures_repo.dart';

import '../../core/result/result.dart';
import '../../data/models/lecture.dart';
import 'lecure_state.dart';

class LectureState extends Equatable {
  const LectureState();

  @override
  List<Object?> get props => [];
}

class LecturesBloc extends Bloc<LecturesEvent, LectureState> {
  final LecturesRepo lecturesRepo;

  LecturesBloc(
    this.lecturesRepo,
  ) : super(const LectureState());

  Future<Result<List<Lecture>>> lecturesBySectionId(int id) async {
    return lecturesRepo.lecturesBySectionId(id);
  }

  Future<void> updateLecture(Lecture item) async {
    return lecturesRepo.updateLecture(item);
  }
}
