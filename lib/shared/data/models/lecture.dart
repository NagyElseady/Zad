import 'database_column.dart';

class Lecture {
  late int id;
  late String title;
  late String details;
  late int categoryId;
  late bool isFavorite;

  Lecture({
    required this.id,
    required this.title,
    required this.details,
    required this.categoryId,
    required this.isFavorite,
  });

  factory Lecture.from(Map<String, dynamic> json) => Lecture(
        id: json[DatabaseColumn.id.value],
        title: json[DatabaseColumn.title.value],
        details: json[DatabaseColumn.details.value],
        categoryId: json[DatabaseColumn.categoryId.value],
        isFavorite: json[DatabaseColumn.isFavorite.value] == 1,
      );
}
