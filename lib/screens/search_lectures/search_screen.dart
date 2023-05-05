import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/shared/core/services/services_locator.dart';
import 'package:zad/shared/localization/localizations.dart';

import '../../shared/presentation/controller/lectures_bloc.dart';
import '../../shared/presentation/navigate_to.dart';
import '../lectures/lectures_screen.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController _searchText = TextEditingController(text: '');

  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => locator<LecturesBloc>(),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              centerTitle: true,
              title: Text(localizations.drawer_titleM),
            ),
            body: Builder(builder: (BuildContext context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: TextFormField(
                  controller: _searchText,
                  onEditingComplete: () {
                    _showSearchResults(context, _searchText.text);
                  },
                  decoration: InputDecoration(
                    labelText: localizations.search,
                    border: const OutlineInputBorder(),
                  ),
                ),
              );
            })));
  }

  void _showSearchResults(BuildContext context, String text) async {
    final lectures =
        await context.read<LecturesBloc>().searchResult(_searchText.text);
    navigate(LecturesScreen(
      lectures: lectures,
      title: localizations.drawer_titleM,
    ));
  }
}
