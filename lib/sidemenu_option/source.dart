import 'package:flutter/material.dart';
import 'package:zad/shared/localization/localizations.dart';

class Source extends StatelessWidget {
  const Source({Key? key}) : super(key: key);

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
          const Text('تم نسخ هذا المحتوى كاملا من موقع زاد الداعى'),
          const Text(
            ' جزى اللة القائمين عليه خير الجزاء ',
          ),
        ],
      ),
    );
  }
}
