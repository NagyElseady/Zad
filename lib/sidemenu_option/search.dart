import 'package:flutter/material.dart';
import 'package:zad/shared/localization/localizations.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

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
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'كلمة البحث',
              border: OutlineInputBorder(),
            ),
          ),
        ));
  }
}
