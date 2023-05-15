import 'package:flutter/cupertino.dart';

class App {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context {
    return navigatorKey.currentContext!;
  }
}
