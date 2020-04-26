import 'package:dynamic_app_theme/util/app_constants.dart';
import 'package:flutter/material.dart';

class PagerIndicatorAnimController with ChangeNotifier {
  String _pagerAnimState;
  bool isOpen = true;

  setAnimState(int previousPage, int selectedState) {
    if (previousPage == 0 && selectedState == 1) {
      _pagerAnimState = Constants.pager_anim_1_2;
    } else if (previousPage == 1 && selectedState == 2) {
      _pagerAnimState = Constants.pager_anim_2_3;
    } else if (previousPage == 2 && selectedState == 1) {
      _pagerAnimState = Constants.pager_anim_3_2;
    } else if (previousPage == 1 && selectedState == 0) {
      _pagerAnimState = Constants.pager_anim_2_1;
    } else {
      _pagerAnimState = Constants.pager_anim_idle;
    }
    isOpen = !isOpen;
    notifyListeners();
  }

  get animationState => _pagerAnimState;
}
