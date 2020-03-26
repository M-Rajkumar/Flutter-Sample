import 'package:flutter/material.dart';
import 'package:rdcloseoutsession/user_list.dart';

import 'custom_app_theme.dart';
import 'fallback_avatar.dart';

class UserListItemCloseOut extends StatelessWidget {
  const UserListItemCloseOut({
    Key key,
//    this.title,
    this.isTablet = false,
//    this.subTitle,
    @required this.userList,
//    this.status,
    this.isAvatarVisible = true,
    this.isPrescriber = true,
//    this.imageUrl,
//    this.colorStatus,
    this.colorAvatarBg,
    this.onTapped,
    this.height = 45,
    this.containerColor,
    this.contentPadding,
//    this.initialName = '',
  }) : super(key: key);

//  final String title;
//  final String subTitle;
//  final String status;
  final bool isAvatarVisible;
  final bool isPrescriber;
  final bool isTablet;
//  final String imageUrl;
//  final String initialName;
//  final Color colorStatus;
  final Color colorAvatarBg;
  final Color containerColor;
  final double height;
  final Function onTapped;
  final UserList userList;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: contentPadding ??
          EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
      title: Row(
        children: <Widget>[
          Visibility(
            visible: isAvatarVisible,
            child: Row(
              children: <Widget>[
                FallBackAvatar(
                  image: userList.photo ?? '',
                  initials: userList.shortName ?? '',
                  heightWeight: height ?? 45,
                  textStyle: CustomAppTheme.title.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0),
                  circleBackground: colorAvatarBg ?? Colors.transparent,
                  radius: height / 2 ?? 27.5,
                ),
                SizedBox(
                  width: 10.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        userList.displayName ?? '',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Visibility(
                      visible:
                          isPrescriber && userList.prescriber ?? false ?? false,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Container(
                          height: isTablet ? 20 : 18,
                          width: isTablet ? 20 : 18,
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.lightBlue,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                              child: Text(
                            'P',
                            style: TextStyle(
                                fontSize: isTablet ? 14 : 12.0,
                                color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
                Visibility(
                  visible:
                      userList.shortInfo != null && userList.shortInfo != '',
                  child: Text(
                    userList.shortInfo ?? '',
//                      style: TextStyle(
//                        color: CustomAppTheme.textTheme.caption.color,
//                      ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
