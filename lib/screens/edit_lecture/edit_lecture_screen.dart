import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/shared/localization/localizations.dart';
import 'package:zad/shared/presentation/toast.dart';

import '../../shared/app/app.dart';
import '../../shared/data/models/lecture.dart';
import '../../shared/presentation/controller/lectures_bloc.dart';

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
        title: const Text(""),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _submitButton(context),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: _content,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    return Container(
      width: 150,
      color: Colors.teal,
      child: ElevatedButton(
        child: Text(
          localizations.save,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          _updateLecture(context);
          showToast(text: (localizations.save_toast));
        },
      ),
    );
  }

  void _updateLecture(BuildContext context) async {
    widget.lecture.details = _content.text;
    await App.navigatorKey.currentContext!
        .read<LecturesBloc>()
        .updateLecture(widget.lecture);
  }
}
