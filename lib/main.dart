import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zad/sections/sections_screen.dart';
import 'package:zad/shared/app/app.dart';
import 'package:zad/shared/data/database/zad_database.dart';
import 'package:zad/shared/ui/side_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await ZadDatabase().setup();

  runApp(
    const MyApp(),
  );
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
