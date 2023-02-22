import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/shared/data/models/Lecture.dart';

import '../screens/section_detail/section_detail.dart';
import '../screens/sections_screen/section_cubit.dart';
import '../screens/zad_states.dart';
import '../shared/data/models/Section.dart';
import '../shared/ui/navigate_to.dart';

class SectionsScreen extends StatelessWidget {
  SectionsScreen({Key? key}) : super(key: key);

  List<Section> sections = [
    Section(
        AppL,
        [
          Lecture(" خطبة ١", "محتوى ١"),
          Lecture("خطبة ٢", "محتوى ٢"),
          Lecture("خطبة ٣", "محتوى ٣"),
          Lecture("خطبة ٤", "محتوى ٤"),
          Lecture("خطبة ٥", "محتوى ٥"),
        ],
        Icons.brightness_low_outlined,
        Colors.grey),
    Section(
      "العقيدة الإسلامية",
      [
        Lecture("خطبة ٦", "محتوى ٦"),
        Lecture("خطبة ٧", "محتوى ٧"),
        Lecture("خطبة ٨", "محتوى ٨"),
        Lecture("خطبة ٩", "محتوى ٩"),
        Lecture("خطبة ١٠", "محتوى ١٠"),
      ],
      Icons.mosque_outlined,
      Colors.deepPurpleAccent.shade100,
    ),
    Section(
      "الفقة",
      [
        Lecture("خطبة ٦", "محتوى ٦"),
        Lecture("خطبة ٧", "محتوى ٧"),
        Lecture("خطبة ٨", "محتوى ٨"),
        Lecture("خطبة ٩", "محتوى ٩"),
        Lecture("خطبة ١٠", "محتوى ١٠"),
      ],
      Icons.houseboat_sharp,
      Colors.brown.shade300,
    ),
    Section(
      "الادب والأخلاق",
      [
        Lecture("خطبة ٦", "محتوى ٦"),
        Lecture("خطبة ٧", "محتوى ٧"),
        Lecture("خطبة ٨", "محتوى ٨"),
        Lecture("خطبة ٩", "محتوى ٩"),
        Lecture("خطبة ١٠", "محتوى ١٠"),
      ],
      Icons.balance,
      Colors.indigoAccent.shade100,
    ),
    Section(
      "قضايا اسلاميه معاصرة",
      [
        Lecture("خطبة ٦", "محتوى ٦"),
        Lecture("خطبة ٧", "محتوى ٧"),
        Lecture("خطبة ٨", "محتوى ٨"),
        Lecture("خطبة ٩", "محتوى ٩"),
        Lecture("خطبة ١٠", "محتوى ١٠"),
      ],
      Icons.interpreter_mode_rounded,
      Colors.lightGreen,
    ),
    Section(
      "التربيه والاسرة المسلمة",
      [
        Lecture("خطبة ٦", "محتوى ٦"),
        Lecture("خطبة ٧", "محتوى ٧"),
        Lecture("خطبة ٨", "محتوى ٨"),
        Lecture("خطبة ٩", "محتوى ٩"),
        Lecture("خطبة ١٠", "محتوى ١٠"),
      ],
      Icons.family_restroom,
      Colors.teal,
    ),
    Section(
      "التاريخ والقصص",
      [
        Lecture("خطبة ٦", "محتوى ٦"),
        Lecture("خطبة ٧", "محتوى ٧"),
        Lecture("خطبة ٨", "محتوى ٨"),
        Lecture("خطبة ٩", "محتوى ٩"),
        Lecture("خطبة ١٠", "محتوى ١٠"),
      ],
      Icons.history_edu,
      Colors.redAccent,
    ),
    Section(
      "موضوعات متنوعه",
      [
        Lecture("خطبة ٦", "محتوى ٦"),
        Lecture("خطبة ٧", "محتوى ٧"),
        Lecture("خطبة ٨", "محتوى ٨"),
        Lecture("خطبة ٩", "محتوى ٩"),
        Lecture("خطبة ١٠", "محتوى ١٠"),
      ],
      Icons.school_outlined,
      Colors.blueGrey,
    ),
    Section(
      "مواسم الخير",
      [
        Lecture("خطبة ٦", "محتوى ٦"),
        Lecture("خطبة ٧", "محتوى ٧"),
        Lecture("خطبة ٨", "محتوى ٨"),
        Lecture("خطبة ٩", "محتوى ٩"),
        Lecture("خطبة ١٠", "محتوى ١٠"),
      ],
      Icons.real_estate_agent_outlined,
      Colors.orange,
    ),
    Section(
      "مناسبات دوريه",
      [
        Lecture("خطبة ٦", "محتوى ٦"),
        Lecture("خطبة ٧", "محتوى ٧"),
        Lecture("خطبة ٨", "محتوى ٨"),
        Lecture("خطبة ٩", "محتوى ٩"),
        Lecture("خطبة ١٠", "محتوى ١٠"),
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
                    SectionDetailScreen(section),
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
                  fontSize: 20.0,
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
