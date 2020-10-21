import 'package:darktheme/provider/darkThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  static Widget websiteAction(DarkThemeProvider themeProvider) {
    return InkWell(
      customBorder: CircleBorder(),
      child: Container(
        padding: EdgeInsets.all(13),
        child: Image.asset(
          "assets/images/website_${themeProvider.darkTheme ? "white" : "black"}.png",
        ),
      ),
      onTap: () {
        launchURL("https://ankitsolanki.netlify.app/");
      },
    );
  }

  static Widget githubAction(DarkThemeProvider themeProvider) {
    return InkWell(
      customBorder: CircleBorder(),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Image.asset(
          "assets/images/github_${themeProvider.darkTheme ? "white" : "black"}.png",
        ),
      ),
      onTap: () {
        launchURL("https://github.com/Ankit-Slnk");
      },
    );
  }

  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
