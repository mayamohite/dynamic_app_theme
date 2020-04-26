import 'package:dynamic_app_theme/util/app_color.dart';
import 'package:dynamic_app_theme/util/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardWidgetScreen extends StatefulWidget {
  @override
  _CardWidgetScreenState createState() => _CardWidgetScreenState();
}

class _CardWidgetScreenState extends State<CardWidgetScreen> {
  var isDarkTheme;
  SharedPreferences prefs;
  String selectedTheme = "";

  @override
  void initState() {
    super.initState();
    _getSavedTheme();
  }

  _getSavedTheme() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedTheme =
          prefs.getString(Constants.APP_THEME) ?? Constants.SYSTEM_DEFAULT;
    });
  }

  @override
  Widget build(BuildContext context) {
    isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      child: Card(
        color: isDarkTheme ? AppColors.dark_card_bg : AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDarkTheme
                    ? [AppColors.dark_card_forground, AppColors.purple]
                    : [AppColors.yellow, AppColors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: isDarkTheme
                      ? AppColors.darkThemeShadowColor.withOpacity(0.6)
                      : AppColors.lightThemeShadowColor.withOpacity(0.15),
                  blurRadius: 8.0,
                  offset: Offset(6.0, 8.0),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    Constants.selectedThemeHeader + selectedTheme,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    child: Image.asset("assets/banner-img.png"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
