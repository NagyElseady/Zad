import 'package:flutter/material.dart';
import 'package:zad/shared/data/models/Lecture.dart';
import 'package:zad/shared/data/models/Section.dart';

import '../../shared/ui/navigate_to.dart';
import '../lecture_screen/lecture_screen.dart';

class SectionDetailScreen extends StatelessWidget {
  final Section section;

  const SectionDetailScreen(this.section, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(section.title),
        ),
        body: ListView.builder(
            itemCount: section.lectures.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: itemView(context, section.lectures[index]),
              );
            }));
  }

  Widget itemView(BuildContext context, Lecture item) {
    return TextButton(
        onPressed: () {
          navigateTo(
            context,
            LectureScreen(item),
          );
        },
        child: Text(item.title));
  }
}
