import 'package:flutter/material.dart';

class PeriodicEventScreen extends StatelessWidget {
  const PeriodicEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('مناسبات دورية'),
      ),
    );
  }
}
