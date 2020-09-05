import 'package:darktheme/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'darkThemeProvider.dart';
import 'darkThemeStyles.dart';

void main() {
  runApp(DarkThemeApp());
}

class DarkThemeApp extends StatefulWidget {
  @override
  _DarkThemeAppState createState() => _DarkThemeAppState();
}

class _DarkThemeAppState extends State<DarkThemeApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: HomeScreen(),
            // routes: <String, WidgetBuilder>{
            //   AGENDA: (BuildContext context) => AgendaScreen(),
            // },
          );
        },
      ),
    );
  }
}
