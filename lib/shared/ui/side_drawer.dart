import 'package:flutter/material.dart';
import 'package:zad/shared/localization/localizations.dart';
import 'package:zad/shared/ui/navigate_to.dart';

import '../../screens/lectures_screen/lectures_screen.dart';
import '../../sidemenu_option/about_screen.dart';
import '../../sidemenu_option/references_screen.dart';
import '../../screens/search_lectures/search_screen.dart';
import '../data/database/zad_database.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    localizations.drawer_titleL,
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
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
              _showFavorites();
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
  }

  void _showFavorites() async {
    final lectures = await ZadDatabase().favoriteLectures();
    navigate(LecturesScreen(
      lectures: lectures,
      title: localizations.bottom_title4,
    ));
  }
}
