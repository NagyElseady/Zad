import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/section_detail/section_detail.dart';
import '../screens/sections_screen/section_cubit.dart';
import '../screens/zad_states.dart';
import '../shared/data/models/section.dart';
import '../shared/data/models/lecture.dart';
import '../shared/localization/localizations.dart';
import '../shared/ui/navigate_to.dart';

class SectionsScreen extends StatelessWidget {
  SectionsScreen({Key? key}) : super(key: key);

  List<Section> sections = [
    Section(
      localizations.screen_titleA,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.brightness_low_outlined,
      Colors.grey,
    ),
    Section(
      localizations.screen_titleB,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.mosque_outlined,
      Colors.deepPurpleAccent.shade100,
    ),
    Section(
      localizations.screen_titleC,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.houseboat_sharp,
      Colors.brown.shade300,
    ),
    Section(
      localizations.screen_titleD,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.balance,
      Colors.indigoAccent.shade100,
    ),
    Section(
      localizations.screen_titleF,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.interpreter_mode_rounded,
      Colors.lightGreen,
    ),
    Section(
      localizations.screen_titleG,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.family_restroom,
      Colors.teal,
    ),
    Section(
      localizations.screen_titleH,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.history_edu,
      Colors.redAccent,
    ),
    Section(
      localizations.screen_titleI,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.school_outlined,
      Colors.blueGrey,
    ),
    Section(
      localizations.screen_titleG,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.real_estate_agent_outlined,
      Colors.orange,
    ),
    Section(
      localizations.screen_titleK,
      [
        Lecture(
            id: 1,
            title: " خطبة ١",
            details:
                "محتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوىمحتوى ١",
            categoryId: 1,
            isFavorite: true),
      ],
      Icons.paragliding,
      Colors.indigo.shade300,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ZadCubit(),
        child: BlocConsumer<ZadCubit, ZadStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                body: screenView(context),
              );
            }));
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

  // TODO: Reuse this widget in all cells
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
                  navigateTo(
                    context,
                    SectionDetailScreen(
                      section,
                    ),
                  );
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
}
