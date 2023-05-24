import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zad/shared/localization/localizations.dart';

import '../../shared/core/app_url.dart';
import '../../shared/core/package_info/app_package_info.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  var appVersion = '';

  @override
  void initState() {
    _loadAppVersion();
  }

  _loadAppVersion() async {
    final version = await AppPackageInfo.version();
    setState(() {
      appVersion = version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(localizations.drawer_titleW),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Text(localizations.title),
            Text(appVersion),
            const SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Row(
                  children: [
                    _shareButton(context),
                    const SizedBox(
                      width: 30,
                    ),
                    _rateButton(context),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    _myApps(context),
                    const SizedBox(
                      width: 30,
                    ),
                    _sendmail(context),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    _twitter(context),
                    const SizedBox(
                      width: 30,
                    ),
                    _faceBook(context),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<String> _appVersion() async {
    return await AppPackageInfo.version();
  }

  Widget _shareButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        _share();
      },
      icon: const Icon(
        Icons.share_outlined,
        size: 27,
        color: Colors.blue,
      ),
      label: Text(
        localizations.bottom_title1,
      ),
    );
  }

  void _share() {
    Share.share(localizations.share_description, subject: localizations.title);
  }

  Widget _myApps(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        AppUrl.launch(
            'https://play.google.com/store/apps/developer?id=IdeaS0ft&hl=en&gl=US');
      },
      icon: const Icon(
        Icons.app_registration,
        size: 27,
        color: Colors.blue,
      ),
      label: Text(
        localizations.my_app,
      ),
    );
  }

  Widget _twitter(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        AppUrl.launch('https://twitter.com/IdeaS0ft');
      },
      icon: const Icon(
        FontAwesomeIcons.twitter,
        size: 27,
        color: Colors.blue,
      ),
      label: Text(
        localizations.twitter,
      ),
    );
  }

  Widget _faceBook(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        AppUrl.launch('https://m.facebook.com/100083952761239/');
      },
      icon: const Icon(
        Icons.facebook,
        size: 27,
        color: Colors.blue,
      ),
      label: Text(
        localizations.face_book,
      ),
    );
  }

  Widget _rateButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        _rateApp(context);
      },
      icon: const Icon(
        Icons.star_border_purple500_outlined,
        size: 30,
        color: Colors.blue,
      ),
      label: Text(
        localizations.rating,
      ),
    );
  }

  void _rateApp(BuildContext context) {
    final InAppReview inAppReview = InAppReview.instance;

    inAppReview.openStoreListing(
      appStoreId: 'com.idea.zad',
      microsoftStoreId: 'com.idea.zad',
    );
  }

  Widget _sendmail(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        _sendEmail('');
      },
      icon: const Icon(
        Icons.email_outlined,
        size: 30,
        color: Colors.blue,
      ),
      label: Text(
        localizations.suggestion,
      ),
    );
  }

  void _sendEmail(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'najyelseady@gmail.com',
        queryParameters: {'subject': ''});

    AppUrl.launchUri(emailLaunchUri);
  }
}
