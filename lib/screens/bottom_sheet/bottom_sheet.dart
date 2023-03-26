import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zad/shared/localization/localizations.dart';

import '../../shared/data/database/zad_database.dart';
import '../../shared/data/models/lecture.dart';

class LectureOptionsSheet extends StatelessWidget {
  final Lecture lecture;

  LectureOptionsSheet({super.key, required this.lecture});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Icon(Icons.more_vert_outlined),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 34),
                        ),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.share_outlined,
                          size: 20,
                        ),
                        label: Text(localizations.bottom_title1),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 34)),
                        onPressed: () => Clipboard.setData(
                                ClipboardData(text: lecture.details))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                              localizations.copy,
                              textAlign: TextAlign.center,
                            ),
                          ));
                          Navigator.pop(context);
                        }),
                        icon: const Icon(
                          Icons.copy,
                          size: 18,
                        ),
                        label: Text(localizations.bottom_title2),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 34)),
                        onPressed: () {
                          _updateLecture();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.edit_calendar,
                          size: 18,
                        ),
                        label: Text(
                          localizations.bottom_title3,
                        ),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 34)),
                        onPressed: () {
                          _addToFavorites();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 18,
                        ),
                        label: Text(localizations.bottom_title4),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _addToFavorites() async {
    lecture.isFavorite = !lecture.isFavorite;
    ZadDatabase().updateLecture(lecture);
  }

  void _updateLecture() async {
    lecture.details = 'NEW CONTENT HERE';
    ZadDatabase().updateLecture(lecture);
  }
}
