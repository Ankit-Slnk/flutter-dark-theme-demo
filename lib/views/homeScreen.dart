import 'package:darktheme/utilities/utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/darkThemeProvider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return homeBody(themeProvider);
  }

  Widget homeBody(DarkThemeProvider themeProvider) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Utility.githubAction(themeProvider),
              Utility.websiteAction(themeProvider)
            ],
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Stack(
            children: [
              Center(
                child: RaisedButton.icon(
                  color: Theme.of(context).buttonColor,
                  padding: EdgeInsets.all(16),
                  onPressed: () {
                    themeProvider.darkTheme = !themeProvider.darkTheme;
                  },
                  icon: Image.asset(
                    "assets/images/${themeProvider.darkTheme ? "night" : "day"}.png",
                    height: 30,
                    width: 30,
                  ),
                  label: Text(
                    "Switch Theme",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 8),
                alignment: Alignment.bottomCenter,
                child: Text("Made with ♥ in Flutter"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
