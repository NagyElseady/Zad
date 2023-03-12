import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zad/sections/sections_screen.dart';
import 'package:zad/shared/app/app.dart';
import 'package:zad/shared/data/models/lecture.dart';
import 'package:zad/shared/data/database/zad_database.dart';
import 'package:zad/shared/ui/side_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MyApp(),
  );

  await ZadDatabase().setup();
  List<Lecture> lectures = await ZadDatabase().getAllZadLectures();
  List<Lecture> lecturesByCategoryId1 = await ZadDatabase().lecturesByCategoryId(1);
  List<Lecture> lecturesByCategoryId2 = await ZadDatabase().lecturesByCategoryId(2);
  List<Lecture> lecturesByCategoryId3 = await ZadDatabase().lecturesByCategoryId(3);
  if (kDebugMode) {
    print(lectures.length);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            shadowColor: Colors.transparent,
          ),
        ),
        fontFamily: 'Cairo',
      ),
      navigatorKey: App.navigatorKey,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context).title),
        backgroundColor: Colors.teal,
      ),
      drawer: const SideDrawer(),
      body: SectionsScreen(),
    );
  }
}
