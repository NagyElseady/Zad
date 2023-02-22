import 'package:flutter/material.dart';
import 'package:zad/shared/localization/localizations.dart';

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
                    localizations.drawer_titleM,
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
              localizations.drawer_titleN,
              textAlign: TextAlign.right,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border_outlined),
            title: Text(
              localizations.drawer_titleO,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(
              style: const TextStyle(fontWeight: FontWeight.bold),
              localizations.drawer_titleQ,
              textAlign: TextAlign.right,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: Text(
              localizations.drawer_titleW,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long_sharp),
            title: Text(
              localizations.drawer_titleX,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
