import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zad/shared/localization/localizations.dart';

import '../../shared/data/database/zad_database.dart';
import '../../shared/data/models/lecture.dart';
import 'package:share_plus/share_plus.dart';

class LectureOptionsSheet extends StatelessWidget {
  final Lecture lecture;

  const LectureOptionsSheet({super.key, required this.lecture});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Icon(Icons.more_vert_outlined),
        onPressed: () {
          _showSheet(context);
        },
      ),
    );
  }

  // TODO: separate every button to a function
  void _showSheet(BuildContext context) {
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
                _shareButton(context),
                _copyButton(context),
                ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(120, 34)),
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
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(120, 34)),
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
  }

  Widget _shareButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(120, 34),
      ),
      onPressed: () {
        _share(context);
      },
      icon: const Icon(
        Icons.share_outlined,
        size: 20,
      ),
      label: Text(localizations.bottom_title1),
    );
  }

  void _share(BuildContext context) {
    Share.share(lecture.details, subject: lecture.title);
  }

  Widget _copyButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(120, 34)),
      onPressed: () {
        _copy(context);
      },
      icon: const Icon(
        Icons.copy,
        size: 18,
      ),
      label: Text(localizations.bottom_title2),
    );
  }

  void _copy(BuildContext context) {
    Clipboard.setData(ClipboardData(text: lecture.details)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          localizations.copy,
          textAlign: TextAlign.center,
        ),
      ));
      Navigator.pop(context);
    });
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
