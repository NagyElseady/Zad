import 'package:flutter/material.dart';

import '../../shared/data/models/lecture.dart';
import '../bottom_sheet/bottom_sheet.dart';

class LectureScreen extends StatelessWidget {
  final Lecture lecture;

  const LectureScreen(this.lecture, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: BottomSheetExample(),
            ),
          ],
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text(
            lecture.title,
          ),
        ),
        body: screenView(context));
  }

  Widget screenView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Text(
          lecture.details,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
