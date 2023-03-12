import 'package:flutter/material.dart';
import 'package:zad/screens/bottom_sheet/bottom_sheet.dart';
import 'package:zad/shared/data/models/section.dart';

import '../../shared/data/models/lecture.dart';
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
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                    ),
                  ),
                  Text(
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    item.details,
                    maxLines: 5,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 30.0,
            ),
            const BottomSheetExample(),
          ],
        ),
      ),
    );
  }
}
