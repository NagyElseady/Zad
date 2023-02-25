import 'package:flutter/material.dart';
import 'package:zad/shared/localization/localizations.dart';

void main() => runApp(const BottomSheetApp());

class BottomSheetApp extends StatelessWidget {
  const BottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Bottom Sheet Sample')),
        body: const BottomSheetExample(),
      ),
    );
  }
}

class BottomSheetExample extends StatelessWidget {
  const BottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Icon(Icons.more_vert_outlined),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(120, 34),
                        ),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.share_outlined,
                          size: 20,
                        ),
                        label: Text(localizations.bottom_title1),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 34)),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.copy,
                          size: 18,
                        ),
                        label: Text(localizations.bottom_title2),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 34)),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.edit_calendar,
                          size: 18,
                        ),
                        label: Text(localizations.bottom_title3),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(120, 34)),
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.favorite_border,
                          size: 18,
                        ),
                        label: Text(localizations.bottom_title4),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
