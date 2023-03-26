import 'package:flutter/material.dart';
import 'package:zad/shared/localization/localizations.dart';

import '../lectures_screen/lectures_screen.dart';
import '../../shared/data/database/zad_database.dart';
import '../../shared/ui/navigate_to.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchText = TextEditingController(text: '');

  SearchScreen({Key? key}) : super(key: key);

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
            controller: _searchText,
            onEditingComplete: () {
              _showSearchResults();
            },
            decoration: InputDecoration(
              labelText: localizations.search,
              border: const OutlineInputBorder(),
            ),
          ),
        ));
  }

  void _showSearchResults() async {
    final lectures = await ZadDatabase().search(_searchText.text);
    navigate(LecturesScreen(
      lectures: lectures,
      title: localizations.drawer_titleM,
    ));
  }
}
