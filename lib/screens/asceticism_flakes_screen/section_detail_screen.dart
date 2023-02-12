import 'package:flutter/material.dart';
import 'package:zad/shared/data/models/Lecture.dart';
import 'package:zad/shared/data/models/Section.dart';

class SectionDetailScreen extends StatelessWidget {
  final Section section;

  SectionDetailScreen(this.section, {super.key});

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
                title: itemView(section.lectures[index]),
              );
            }));
  }

  Widget itemView(Lecture item) {
    return Text(item.title);
  }
}
