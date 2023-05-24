import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zad/shared/localization/localizations.dart';

class ReferencesScreen extends StatelessWidget {
  const ReferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(localizations.drawer_titleX),
      ),
      body: Column(
        children: [
          Column(
            children: const [
              Image(
                image: AssetImage('assets/images/zad_pic.jpg'),
                height: 100,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text(localizations.source_syntax1),
          Text(localizations.source_syntax2),
          ElevatedButton(
              onPressed: () {
                const url = 'http://www.islamsbudskap.com/ig/khutba/k/';
                _launchURL(url);
              },
              child: Text(
                localizations.url,
                style: const TextStyle(color: Colors.blue),
              ))
        ],
      ),
    );
  }

  _launchURL(String url) async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
