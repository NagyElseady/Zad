import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zad/shared/localization/localizations.dart';
import 'package:zad/shared/presentation/navigate_to.dart';

import '../../screens/about/about_screen.dart';
import '../../screens/lectures/lectures_screen.dart';
import '../../screens/refrences/references_screen.dart';
import '../../screens/search_lectures/search_screen.dart';
import '../core/services/services_locator.dart';
import 'controller/lectures_bloc.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => locator<LecturesBloc>(),
        child: Builder(builder: (BuildContext context) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          localizations.title,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          localizations.drawer_titleL,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.search),
                  title: Text(
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    localizations.drawer_titleM,
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    navigate(SearchScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.favorite_border_outlined),
                  title: Text(
                    localizations.drawer_titleN,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    _showFavorites(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.feedback),
                  title: Text(
                    localizations.drawer_titleW,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    navigate(const AboutScreen());
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.receipt_long_sharp),
                  title: Text(
                    localizations.drawer_titleX,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                  onTap: () {
                    navigate(const ReferencesScreen());
                  },
                ),
              ],
            ),
          );
        }));
  }

  void _showFavorites(BuildContext context) async {
    final lectures = await context.read<LecturesBloc>().favoriteLectures();
    navigate(LecturesScreen(
      lectures: lectures,
      title: localizations.bottom_title4,
    ));
  }
}
