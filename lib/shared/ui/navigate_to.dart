import 'package:flutter/material.dart';

import '../app/app.dart';

void navigate(widget) => Navigator.push(
      App.navigatorKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
