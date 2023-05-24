import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zad/screens/edit_lecture/edit_lecture_screen.dart';
import 'package:zad/shared/localization/localizations.dart';
import 'package:zad/shared/presentation/navigate_to.dart';

import '../../shared/app/app.dart';
import '../../shared/data/models/lecture.dart';
import '../../shared/presentation/controller/lectures_bloc.dart';

class LectureOptionsSheet extends StatelessWidget {
  final Lecture lecture;

  const LectureOptionsSheet({super.key, required this.lecture});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Icon(
        Icons.more_vert_outlined,
      ),
      onPressed: () {
        _showSheet(context);
      },
    );
  }

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
                _editButton(context),
                _favoriteButton(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _favoriteButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(120, 34)),
      onPressed: () {
        _addToFavorites(context);
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.favorite_border,
        size: 18,
      ),
      label: Text(localizations.drawer_titleN),
    );
  }

  void _addToFavorites(BuildContext context) async {
    lecture.isFavorite = !lecture.isFavorite;
    await App.context
        .read<LecturesBloc>()
        .updateLecture(lecture);
  }

  Widget _editButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(120, 34)),
      onPressed: () {
        Navigator.pop(context);
        _updateLecture();
      },
      icon: const Icon(
        Icons.edit,
        size: 18,
      ),
      label: Text(
        localizations.bottom_title3,
      ),
    );
  }

  void _updateLecture() async {
    navigate(EditLectureScreen(lecture));
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
}
