import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Padding buildZadScreen() => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      width: 300,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'العنوان :-',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'المحتوى :-',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: const [Text('assets')],
          ),
        ],
      ),
    ));
