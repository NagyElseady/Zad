import 'package:flutter/material.dart';
import 'package:zad/screens/bottom_sheet/bottom_sheet.dart';
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
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          section.title,
        ),
      ),
      body: ListView.builder(
          itemCount: section.lectures.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: itemView(
                context,
                section.lectures[index],
              ),
            );
          }),
    );
  }

  Widget itemView(BuildContext context, Lecture item) {
    return TextButton(
      onPressed: () {
        navigateTo(
          context,
          LectureScreen(item),
        );
      },
      child: Container(
        alignment: Alignment.bottomRight,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                  ),
                  Text(
                    item.content,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
            const Spacer(),
            const BottomSheetExample(),
          ],
        ),
      ),
    );
  }
}
