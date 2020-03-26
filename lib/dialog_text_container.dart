import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String title;
  final Function onTapped;
  final TextStyle textStyle;
  final EdgeInsetsGeometry edgeInsetsGeometry;
  final BorderRadiusGeometry borderRadiusGeometry;

  TextContainer(
      {Key key, this.borderRadiusGeometry, this.edgeInsetsGeometry, this.title, this.onTapped, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadiusGeometry ?? BorderRadius.all(Radius.circular(0.0)),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: onTapped,
        child: Padding(
          padding: edgeInsetsGeometry ?? EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Text(
                  title,
                  style: textStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
