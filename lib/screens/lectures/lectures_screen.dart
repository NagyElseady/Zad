import 'package:flutter/material.dart';
import 'package:zad/screens/bottom_sheet/bottom_sheet.dart';

import '../../shared/data/models/lecture.dart';
import '../../shared/presentation/navigate_to.dart';
import '../lecture/lecture_screen.dart';

class LecturesScreen extends StatelessWidget {
  final List<Lecture> lectures;
  final String title;

  const LecturesScreen({
    super.key,
    required this.lectures,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(title),
      ),
      body: ListView.separated(
        itemCount: lectures.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: itemView(
              context,
              lectures[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
              end: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }

  Widget itemView(BuildContext context, Lecture item) {
    return TextButton(
      onPressed: () {
        navigate(
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
            LectureOptionsSheet(lecture: item),
          ],
        ),
      ),
    );
  }
}
