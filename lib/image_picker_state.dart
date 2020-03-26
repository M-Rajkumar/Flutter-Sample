//this is the inherited widget
import 'package:flutter/material.dart';

class ImagePickerState extends InheritedWidget {
  ImagePickerState({Key key, this.imageStatus, Widget child}) : super(key: key, child: child);

  final bool imageStatus;

  @override
  bool updateShouldNotify(ImagePickerState oldWidget) {
    return imageStatus != oldWidget.imageStatus;
  }

  static of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ImagePickerState>();
  }
}
