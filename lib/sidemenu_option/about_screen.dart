import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zad/shared/localization/localizations.dart';

class AboutScreen extends StatelessWidget {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  const AboutScreen({Key? key}) : super(key: key);

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
            Text(localizations.issue),
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

  Widget _shareButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        _share(context);
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

  void _share(BuildContext context) {
    Share.share('check out my website https://example.com',
        subject: 'Look what I made!');
  }

  Widget _myApps(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        appUrl(context);
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

  void appUrl(BuildContext context) {
    const url = '';
    launchURL(url);
  }

  Widget _twitter(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        twitterUrl(context);
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

  void twitterUrl(BuildContext context) {
    const url = 'https://twitter.com/IdeaS0ft';
    launchURL(url);
  }

  Widget _faceBook(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(fixedSize: const Size(125, 34)),
      onPressed: () {
        faceUrl(context);
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

  void faceUrl(BuildContext context) {
    const url = 'https://m.facebook.com/100083952761239/';
    launchURL(url);
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
      appStoreId: 'com.idea.zad.zad',
      microsoftStoreId: 'com.idea.zad.zad',
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

    launch(emailLaunchUri.toString());
  }
}
