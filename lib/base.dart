import 'package:flutter/cupertino.dart';
import 'package:rdcloseoutsession/tablet_detector.dart';

mixin BasePage {
  bool isTabletDevice = false;

  void getParameter(BuildContext context) {
    isTabletDevice = TabletDetector.isTablet(MediaQuery.of(context));
  }
}
