import 'package:flutter/material.dart';

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
                children: const [
                  Text(
                    'زَاد الدُّعَاة ',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '(خُطْب ومُحَاضَرَات)',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text(
              style: TextStyle(fontWeight: FontWeight.bold),
              'البحث',
              textAlign: TextAlign.right,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border_outlined),
            title: const Text(
              'المفضلة',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              style: TextStyle(fontWeight: FontWeight.bold),
              'الضبط',
              textAlign: TextAlign.right,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.feedback),
            title: const Text(
              style: TextStyle(fontWeight: FontWeight.bold),
              'حول',
              textAlign: TextAlign.right,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.receipt_long_sharp),
            title: const Text(
              'المصادر',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
