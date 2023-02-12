import 'package:flutter/material.dart';

import '../components.dart';

class AsceticismFlakesScreen extends StatelessWidget {
  AsceticismFlakesScreen({Key? key}) : super(key: key);
  var lecture = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('الزهد والرقائق'),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => buildZadScreen(),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20.0,
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: 15,
        ));
  }
}
