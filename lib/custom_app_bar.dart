import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final bool isTablet;
  final double elevation;
  final IconData icon;
  final Color iconColor;
  final TextStyle textStyle;
  final List<Widget> actions;
  final Widget leading;
  final Color backgroundColor;
  final Color bottomDividerColor;
  final bool removeDividerLine;
  final Function onBackTap;
  final double iconSize;
  final isKeyBoardShow;

  @override
  final Size preferredSize;

  CustomAppBar(
      {Key key,
      this.title,
      this.centerTitle = true,
      this.elevation = 0.0,
      this.icon,
      this.isTablet = false,
      this.isKeyBoardShow = false,
      this.iconColor,
      this.iconSize,
      this.backgroundColor,
      this.bottomDividerColor,
      this.textStyle,
      this.removeDividerLine = false,
      this.onBackTap,
      this.actions,
      this.leading})
      : preferredSize =
            isTablet ? Size.fromHeight(56.0) : Size.fromHeight(56.0),
        super(key: key);

  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        key: key,
        backgroundColor: backgroundColor ?? Colors.white,
        centerTitle: centerTitle,
        bottom: !removeDividerLine
            ? PreferredSize(
                child: Container(
                  color: bottomDividerColor ?? Theme.of(context).buttonColor,
                  height: 1.0,
                ),
                preferredSize: null,
              )
            : null,
        elevation: elevation,
        leading: leading ??
            IconButton(
              highlightColor: backgroundColor ?? Colors.white,
              splashColor: backgroundColor ?? Colors.white,
              icon: Icon(
                icon ?? Icons.chevron_left,
                size: iconSize ?? 34,
                color: iconColor ?? Theme.of(context).buttonColor,
              ),
              onPressed: onBackTap ??
                  () => isKeyBoardShow
                      ? FocusScope.of(context).unfocus()
                      : Navigator.pop(context, false),
            ),
        actions: actions ?? <Widget>[],
        title: Text(
          title ?? '',
          textAlign: TextAlign.center,
          style: textStyle ??
              TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
        ),
      ),
    );
  }
}
