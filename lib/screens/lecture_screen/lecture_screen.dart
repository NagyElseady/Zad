import 'package:flutter/material.dart';
import 'package:zad/shared/data/models/Lecture.dart';

class LectureScreen extends StatelessWidget {
  final Lecture lecture;

  const LectureScreen(this.lecture, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Row(
            children: [
              Text(lecture.title),
            ],
          ),
        ),
        body: screenView(context));
  }

  Widget screenView(BuildContext context) {
    return Text(lecture.content);
  }
}
