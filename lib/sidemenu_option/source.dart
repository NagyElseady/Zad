import 'package:flutter/material.dart';
import 'package:zad/shared/localization/localizations.dart';

class Source extends StatelessWidget {
  const Source({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(localizations.drawer_titleX),
      ),
    );
  }
}
