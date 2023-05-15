import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/shared/localization/localizations.dart';

import '../../shared/app/app.dart';
import '../../shared/presentation/controller/lectures_bloc.dart';
import '../../shared/presentation/navigate_to.dart';
import '../lectures/lectures_screen.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchText = TextEditingController(text: '');

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: TextFormField(
        controller: _searchText,
        onEditingComplete: () {
          _showSearchResults(_searchText.text);
        },
        decoration: InputDecoration(
          labelText: localizations.search,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  void _showSearchResults(String text) async {
    final lectures =
        await App.context.read<LecturesBloc>().searchResult(_searchText.text);
    navigate(LecturesScreen(
      lectures: lectures,
      title: localizations.drawer_titleM,
    ));
  }
}
