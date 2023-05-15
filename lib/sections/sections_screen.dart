import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/shared/presentation/controller/lectures_bloc.dart';

import '../screens/lectures/lectures_screen.dart';
import '../shared/app/app.dart';
import '../shared/data/models/section.dart';
import '../shared/localization/localizations.dart';
import '../shared/presentation/navigate_to.dart';

class SectionsScreen extends StatelessWidget {
  SectionsScreen({Key? key}) : super(key: key);

  List<Section> sections = [
    Section(
      1,
      localizations.screen_titleA,
      Icons.brightness_low_outlined,
      Colors.grey,
    ),
    Section(
      2,
      localizations.screen_titleB,
      Icons.mosque_outlined,
      Colors.deepPurpleAccent.shade100,
    ),
    Section(
      3,
      localizations.screen_titleC,
      Icons.houseboat_sharp,
      Colors.brown.shade300,
    ),
    Section(
      4,
      localizations.screen_titleD,
      Icons.balance,
      Colors.indigoAccent.shade100,
    ),
    Section(
      5,
      localizations.screen_titleF,
      Icons.interpreter_mode_rounded,
      Colors.lightGreen,
    ),
    Section(
      6,
      localizations.screen_titleG,
      Icons.family_restroom,
      Colors.teal,
    ),
    Section(
      7,
      localizations.screen_titleH,
      Icons.history_edu,
      Colors.redAccent,
    ),
    Section(
      8,
      localizations.screen_titleI,
      Icons.school_outlined,
      Colors.blueGrey,
    ),
    Section(
      9,
      localizations.screen_titleG,
      Icons.real_estate_agent_outlined,
      Colors.orange,
    ),
    Section(
      10,
      localizations.screen_titleK,
      Icons.paragliding,
      Colors.indigo.shade300,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenView(context),
    );
  }

  Widget screenView(BuildContext context) {
    return sectionsView(context);
  }

  Widget sectionsView(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: sections.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: cellView(context, sections[index]),
            );
          }),
    );
  }

  Widget cellView(BuildContext context, Section section) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
        30.0,
      )),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 180.0,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(5),
              color: section.color,
              width: 180.0,
              height: 180.0,
              child: IconButton(
                icon: Icon(
                  section.icon,
                  color: Colors.white,
                  size: 100.0,
                ),
                onPressed: () {
                  _onSectionItemTapped(context, section);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
              ),
              width: double.infinity,
              color: Colors.black.withOpacity(.0),
              child: Text(
                section.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSectionItemTapped(BuildContext context, Section section) async {
    final lectures =
        await App.context.read<LecturesBloc>().lecturesBySectionId(section.id);
    lectures.dataOrElse([]);
    navigate(LecturesScreen(
      lectures: lectures.dataOrElse([]),
      title: section.title,
    ));
  }
}
