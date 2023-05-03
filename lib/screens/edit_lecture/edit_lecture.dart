import 'package:flutter/material.dart';
import 'package:zad/shared/localization/localizations.dart';
import 'package:zad/shared/presentation/toast.dart';

import '../../shared/data/models/lecture.dart';
import '../../shared/presentation/controller/lectures_bloc.dart';

class EditLectureScreen extends StatelessWidget {
  Lecture lecture;

  EditLectureScreen(this.lecture, {Key? key}) : super(key: key);

  final TextEditingController _content = TextEditingController(text: '');

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
              _submitButton(),
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
      resizeToAvoidBottomInset: false,
    );
  }

  Widget _submitButton() {
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
          _updateLecture(_content);
          showToast(text: (localizations.save_toast));
        },
      ),
    );
  }

  void _updateLecture(context) async {
    final lectures =
        await context.read<LecturesBloc>().updateLecture(lecture.details);
    lectures.dataOrElse([]).details;
  }
}
