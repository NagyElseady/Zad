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

  factory Lecture.from(Map<String, dynamic> map) => Lecture(
        id: map[DatabaseColumn.id.value],
        title: map[DatabaseColumn.title.value],
        details: map[DatabaseColumn.details.value],
        categoryId: map[DatabaseColumn.categoryId.value],
        isFavorite: map[DatabaseColumn.isFavorite.value] == 1,
      );

  Map<String, Object?> toMap() {
    return {
      DatabaseColumn.id.value: id,
      DatabaseColumn.title.value: title,
      DatabaseColumn.details.value: details,
      DatabaseColumn.categoryId.value: categoryId,
      DatabaseColumn.isFavorite.value: isFavorite,
    };
  }

  String contentWithoutLines() {
    return details.replaceAll("\n", " ");
  }
}
