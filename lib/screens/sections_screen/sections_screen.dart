import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/shared/data/models/Lecture.dart';

import '../../shared/data/models/Section.dart';
import '../asceticism_flakes_screen/section_detail_screen.dart';
import '../../shared/ui/navigate_to.dart';
import '../sections_screen/section_cubit.dart';
import '../zad_states.dart';

class SectionsScreen extends StatelessWidget {
  SectionsScreen({Key? key}) : super(key: key);

  List<Section> sections = [
    Section(
        "الزهد والرقائق",
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
        Icons.brightness_low_outlined,
        Colors.red)
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ZadCubit(),
        child: BlocConsumer<ZadCubit, ZadStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.teal,
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                        ),
                      ),
                    ],
                    title: const Text('الأقسام'),
                  ),
                  body: screenView(context));
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
        10.0,
      )),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 180.0,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
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
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
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
          )
        ],
      ),
    );
  }
}

// TODO: Remove after reusing cells
Widget oldView(BuildContext context) {
  return BlocProvider(
      create: (BuildContext context) => ZadCubit(),
      child: BlocConsumer<ZadCubit, ZadStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.teal,
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.menu,
                          ),
                        ),
                      ],
                      title: const Text('الأقسام'),
                    ),
                    body: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(
                                10.0,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.grey,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.brightness_low_outlined,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                context,
                                                const Text(''),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'الزهد والرقائق',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color:
                                              Colors.deepPurpleAccent.shade100,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.mosque_outlined,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                context,
                                                const Text(''),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'العقيدة الاسلاميه',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                10.0,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.brown.shade300,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.houseboat_sharp,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                  context, const Text(''));
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'الفقه',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.indigoAccent.shade100,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.balance,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                  context, const Text(''));
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'الاداب والأخلاق',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                10.0,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.lightGreen,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.interpreter_mode_rounded,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                  context, const Text(''));
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'قضايا اسلاميه'
                                            ' معاصرة',
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.teal,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.family_restroom,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                context,
                                                const Text(''),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'التربيه والاسرة '
                                            'المسلمة',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                10.0,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.redAccent,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.history_edu,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                  context, const Text(''));
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'التاريخ والقصص',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color:
                                              Colors.lightGreenAccent.shade400,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.school_outlined,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                  context, const Text(''));
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'موضوعات متنوعه',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(
                                10.0,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.orange,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.real_estate_agent_outlined,
                                              color: Colors.white,
                                              size: 100.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                  context, const Text(''));
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'مواسم الخير',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                      10.0,
                                    )),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    width: 180.0,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          color: Colors.indigo.shade300,
                                          width: 180.0,
                                          height: 180.0,
                                          child: IconButton(
                                            icon: const Icon(
                                              Icons.paragliding,
                                              color: Colors.white,
                                              size: 70.0,
                                            ),
                                            onPressed: () {
                                              navigateTo(
                                                context,
                                                const Text(''),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 25.0,
                                          ),
                                          width: double.infinity,
                                          color: Colors.black.withOpacity(.0),
                                          child: const Text(
                                            'مناسبات دوريه',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }));
}
