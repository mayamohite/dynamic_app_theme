import 'package:dynamic_app_theme/models/CardModel.dart';
import 'package:dynamic_app_theme/util/app_color.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class CardWidgetScreen extends StatefulWidget {
  int position;

  CardWidgetScreen({this.position});

  @override
  _CardWidgetScreenState createState() => _CardWidgetScreenState();
}

class _CardWidgetScreenState extends State<CardWidgetScreen> {
  var isDarkTheme;
  List<CardModel> _cardModel = CardModelList().getChatModelList();

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
                    _cardModel[widget.position].cardHeaderMessage,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: FlareActor('assets/swipeleft.flr',
                        alignment: Alignment.center,
                        animation: "Swipe_left_light"),
                  ),
                  Text(
                    _cardModel[widget.position].cardFooterMessage,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
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
