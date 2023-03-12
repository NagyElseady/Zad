import 'package:flutter/cupertino.dart';

import 'lecture.dart';

class Section {
  String title;
  List<Lecture> lectures;
  IconData icon;
  Color color;

  Section(
    this.title,
    this.lectures,
    this.icon,
    this.color,
  );
}
