import 'package:flutter/material.dart';

import '../app/app.dart';

void navigate(widget) => Navigator.push(
      App.context,
      MaterialPageRoute(builder: (context) => widget),
    );
