import 'package:dynamic_app_theme/anim_controller.dart';
import 'package:dynamic_app_theme/provider/theme_provider.dart';
import 'package:dynamic_app_theme/screens/card_screen.dart';
import 'package:dynamic_app_theme/util/app_constants.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController controller;
  int _selectedPage = 0;
  int _previousPage = 0;
  PagerIndicatorAnimController _provider;
  ThemeNotifier _themeNotifier;
  var _isDarkMode;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _provider = Provider.of<PagerIndicatorAnimController>(context);
    _isDarkMode = Theme.of(context).brightness == Brightness.dark;
    _themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _backgroundAnimWidget(),
          _pagerWidget(),
        ],
      ),
    );
  }

  _backgroundAnimWidget() {
    return Center(
      child: FlareActor(Constants.background_anim,
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: _isDarkMode
              ? Constants.night_animation
              : Constants.day_animation),
    );
  }

  _pagerWidget() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 200,
            child: PageView.builder(
              itemBuilder: (context, position) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: 30,
                    right: 30,
                  ),
                  child: CardWidgetScreen(
                    position: position,
                  ),
                );
              },
              onPageChanged: (position) {
                setState(() {
                  _previousPage = _selectedPage;
                  _selectedPage = position;
                });
                _provider.setAnimState(_previousPage, _selectedPage);
                _setTheme(position);
              },
              itemCount: 3,
            ),
          ),
        ),
        Container(
          width: 80,
          height: 50,
          child: FlareActor(
            Constants.pager_indicator_anim,
            alignment: Alignment.center,
            animation: _provider.animationState,
          ),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }

  _setTheme(int position) {
    if (position == 0) {
      _themeNotifier.setThemeMode(ThemeMode.light);
    } else if (position == 1) {
      _themeNotifier.setThemeMode(ThemeMode.dark);
    } else {
      _themeNotifier.setThemeMode(ThemeMode.system);
    }
  }
}
