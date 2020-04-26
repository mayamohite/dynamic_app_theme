import 'package:dynamic_app_theme/util/app_constants.dart';

class CardModel {
  String cardHeaderMessage;
  String cardFooterMessage;

  CardModel(
    this.cardHeaderMessage,
    this.cardFooterMessage,
  );
}

class CardModelList {
  getChatModelList() {
    return [
      CardModel(Constants.lightThemeHeader, Constants.lightThemeFooter),
      CardModel(Constants.darkThemeHeader, Constants.darkThemeFooter),
      CardModel(Constants.systemThemeHeader, Constants.systeemThemeFooter),
    ];
  }
}
