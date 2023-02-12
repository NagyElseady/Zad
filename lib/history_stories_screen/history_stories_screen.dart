import 'package:flutter/material.dart';

class HistoryStoriesScreen extends StatelessWidget {
  const HistoryStoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('التاريخ والقصص'),
      ),
    );
  }
}
