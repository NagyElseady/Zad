import 'package:flutter/material.dart';
import 'package:zad/shared/localization/localizations.dart';

import '../../shared/data/database/zad_database.dart';
import '../../shared/data/models/lecture.dart';

class EditLectureScreen extends StatefulWidget {
  Lecture lecture;

  EditLectureScreen(this.lecture, {Key? key}) : super(key: key);

  @override
  _EditLectureScreenState createState() => _EditLectureScreenState();
}

class _EditLectureScreenState extends State<EditLectureScreen> {
  final TextEditingController _content = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    _content.text = widget.lecture.details;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(localizations.drawer_titleM),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _submitButton(),
              TextFormField(
                controller: _content,
                decoration: const InputDecoration(
                ),
                maxLines: null,
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _submitButton() {
    return ElevatedButton(
      // TODO: localize
      child: const Text('حفظ'),
      onPressed: () {
        _updateLecture();
      },
    );
  }

  void _updateLecture() async {
    widget.lecture.details = _content.text;
    ZadDatabase().updateLecture(widget.lecture);
  }
}
