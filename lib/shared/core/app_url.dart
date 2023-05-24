import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUrl {
  static launch(String url) async {
    final uri = Uri.parse(url);
    try {
      await launchUrl(uri);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
