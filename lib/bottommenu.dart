import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:rdcloseoutsession/NavigationItem.dart';
import 'package:rdcloseoutsession/custom_dimen.dart';
import 'package:rdcloseoutsession/date_time_utils.dart';
import 'package:rdcloseoutsession/speaker_closeout.dart';

import 'base.dart';

// ignore: must_be_immutable
class CustomNavigationBar extends StatefulWidget {
  int selectedIndex;
  List<NavigationItem> navigationItem;
  ValueChanged<int> onItemSelected;
  bool isSelectedEnable;
  bool shadow;
  CustomNavigationBar({
    this.selectedIndex = 0,
    @required this.isSelectedEnable = true,
    @required this.navigationItem,
    @required this.onItemSelected,
    this.shadow = true,
  }) {
    assert(navigationItem != null);
    assert(onItemSelected != null);
    assert(navigationItem.length >= 1 && navigationItem.length <= 5);
  }

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with BasePage {
  Color backgroundColor = Colors.white;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//0
  }

  @override
  Widget build(BuildContext context) {
    getParameter(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: isTabletDevice
          ? CustomDimension.bottomBarHeightTablet
          : CustomDimension.bottomBarHeight,
      padding: EdgeInsets.only(left: 0.0, top: 4.0, bottom: 4.0, right: 0.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          widget.shadow
              ? BoxShadow(color: Colors.black12, blurRadius: 5)
              : BoxShadow(color: Colors.black12, blurRadius: 0),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widget.navigationItem.map((item) {
          var itemIndex = widget.navigationItem.indexOf(item);
          return InkWell(
            onTap: () {
              if (item.clAction == 'cl_create') {
                createEngagement(context, widget.navigationItem, item);
                return;
              }
              widget.onItemSelected(itemIndex);
            },
            child: _buildItem(widget.isSelectedEnable, isTabletDevice, item,
                widget.selectedIndex == itemIndex),
          );
        }).toList(),
      ),
    );
  }

  Future<Null> createEngagement(BuildContext context,
      List<NavigationItem> navigationItem, NavigationItem item) async {
    switch (await (Navigator.push(
        context, MaterialPageRoute(builder: (context) => EOCloseOutPage())))) {
      case 0:
        widget.onItemSelected(0);
//        Navigator.of(context).popUntil((route) => route.isFirst);
        break;
    }
  }

  Widget _buildItem(bool isSelectedEnable, bool isTablet,
      NavigationItem navigationItem, bool isSelected) {
    bool isCustomIcon = false;
    bool isCustomizedIcon = false;
    bool isCustomizingIcon = false;
    bool isCustomisedIcon = false;
    bool isCustomizeIcon = false;
    bool isCustomizedIconEO = false;
    bool isCustomizedIconSpeaker = false;
    bool isCustomizedIconAttendees = false;
    bool isCustomizedIconSurvey = false;
    bool isCustomizedIconF_B = false;
    if (navigationItem?.clAction == 'cl_create') {
      isCustomIcon = true;
    } else if (navigationItem?.clAction == 'cl_invitee') {
      isCustomizedIcon = true;
    } else if (navigationItem?.clAction == 'cl_collaborators') {
      isCustomisedIcon = true;
    } else if (navigationItem?.clAction == 'cl_closeout') {
      isCustomizeIcon = true;
    } else if (navigationItem?.clAction == 'cl_file') {
      isCustomizingIcon = true;
    } else if (navigationItem?.clAction == 'cl_EO') {
      isCustomizedIconEO = true;
    } else if (navigationItem?.clAction == 'cl_Speaker') {
      isCustomizedIconSpeaker = true;
    } else if (navigationItem?.clAction == 'cl_Attendees') {
      isCustomizedIconAttendees = true;
    } else if (navigationItem?.clAction == 'cl_Food_Beverage') {
      isCustomizedIconF_B = true;
    } else if (navigationItem?.clAction == 'cl_Survey') {
      isCustomizedIconSurvey = true;
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 270),
      padding: EdgeInsets.only(left: 8.0, right: 8.0),
      height: double.maxFinite,
      child: isTablet
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: isTablet
                      ? CustomDimension.bottomIconSizeTablet
                      : CustomDimension.bottomIconSize,
                  width: isTablet
                      ? CustomDimension.bottomIconSizeTablet
                      : CustomDimension.bottomIconSize,
                  child: Stack(
                    children: <Widget>[
                      isCustomIcon
                          ? Image.asset(
                              isSelected
                                  ? 'assets/images/createselected.png'
                                  : 'assets/images/createdefault.png',
                              height: isTablet
                                  ? CustomDimension.bottomIconSizeTablet
                                  : CustomDimension.bottomIconSize,
                              width: isTablet
                                  ? CustomDimension.bottomIconSizeTablet
                                  : CustomDimension.bottomIconSize,
                            )
                          : isCustomizedIcon
                              ? new Image.asset(
                                  isSelected
                                      ? 'assets/images/myattendeesicon.png'
                                      : 'assets/images/myattendeesicon.png',
                                  height: isTablet
                                      ? CustomDimension.bottomIconSizeTablet
                                      : CustomDimension.bottomIconSize,
                                  width: isTablet
                                      ? CustomDimension.bottomIconSizeTablet
                                      : CustomDimension.bottomIconSize,
                                )
                              : isCustomisedIcon
                                  ? new Image.asset(
                                      isSelected
                                          ? 'assets/images/contributorsicon.png'
                                          : 'assets/images/contributorsicon.png',
                                      height: isTablet
                                          ? CustomDimension.bottomIconSizeTablet
                                          : CustomDimension.bottomIconSize,
                                      width: isTablet
                                          ? CustomDimension.bottomIconSizeTablet
                                          : CustomDimension.bottomIconSize,
                                    )
                                  : isCustomizeIcon
                                      ? Image.asset(
                                          isSelected
                                              ? 'assets/images/closeouticon.png'
                                              : 'assets/images/closeouticon.png',
                                          height: isTablet
                                              ? CustomDimension
                                                  .bottomIconSizeTablet
                                              : CustomDimension.bottomIconSize,
                                          width: isTablet
                                              ? CustomDimension
                                                  .bottomIconSizeTablet
                                              : CustomDimension.bottomIconSize,
                                        )
                                      : isCustomizingIcon
                                          ? Image.asset(
                                              isSelected
                                                  ? 'assets/images/filesicon.png'
                                                  : 'assets/images/filesicon.png',
                                              height: isTablet
                                                  ? CustomDimension
                                                      .bottomIconSizeTablet
                                                  : CustomDimension
                                                      .bottomIconSize,
                                              width: isTablet
                                                  ? CustomDimension
                                                      .bottomIconSizeTablet
                                                  : CustomDimension
                                                      .bottomIconSize,
                                            )
                                          : isCustomizedIconEO
                                              ? new Image.asset(
                                                  isSelected
                                                      ? 'assets/images/eoselected.png'
                                                      : 'assets/images/eounselected.png',
                                                  height: isTablet
                                                      ? CustomDimension
                                                          .bottomIconSizeTablet
                                                      : CustomDimension
                                                          .bottomIconSize,
                                                  width: isTablet
                                                      ? CustomDimension
                                                          .bottomIconSizeTablet
                                                      : CustomDimension
                                                          .bottomIconSize,
                                                )
                                              : isCustomizedIconSpeaker
                                                  ? new Image.asset(
                                                      isSelected
                                                          ? 'assets/images/speakerselected.png'
                                                          : 'assets/images/speakerunselected.png',
                                                      height: isTablet
                                                          ? CustomDimension
                                                              .bottomIconSizeTablet
                                                          : CustomDimension
                                                              .bottomIconSize,
                                                      width: isTablet
                                                          ? CustomDimension
                                                              .bottomIconSizeTablet
                                                          : CustomDimension
                                                              .bottomIconSize,
                                                    )
                                                  : isCustomizedIconAttendees
                                                      ? new Image.asset(
                                                          isSelected
                                                              ? 'assets/images/attendeeselected.png'
                                                              : 'assets/images/attendeeunselected.png',
                                                          height: isTablet
                                                              ? CustomDimension
                                                                  .bottomIconSizeTablet
                                                              : CustomDimension
                                                                  .bottomIconSize,
                                                          width: isTablet
                                                              ? CustomDimension
                                                                  .bottomIconSizeTablet
                                                              : CustomDimension
                                                                  .bottomIconSize,
                                                        )
                                                      : isCustomizedIconF_B
                                                          ? new Image.asset(
                                                              isSelected
                                                                  ? 'assets/images/closefbselected.png'
                                                                  : 'assets/images/closefbunselected.png',
                                                              height: isTablet
                                                                  ? CustomDimension
                                                                      .bottomIconSizeTablet
                                                                  : CustomDimension
                                                                      .bottomIconSize,
                                                              width: isTablet
                                                                  ? CustomDimension
                                                                      .bottomIconSizeTablet
                                                                  : CustomDimension
                                                                      .bottomIconSize,
                                                            )
                                                          : isCustomizedIconSurvey
                                                              ? new Image.asset(
                                                                  isSelected
                                                                      ? 'assets/images/surveyselected.png'
                                                                      : 'assets/images/surveyunselected.png',
                                                                  height: isTablet
                                                                      ? CustomDimension
                                                                          .bottomIconSizeTablet
                                                                      : CustomDimension
                                                                          .bottomIconSize,
                                                                  width: isTablet
                                                                      ? CustomDimension
                                                                          .bottomIconSizeTablet
                                                                      : CustomDimension
                                                                          .bottomIconSize,
                                                                )
                                                              : SizedBox(
                                                                  height: isTablet
                                                                      ? CustomDimension
                                                                          .bottomIconSizeTablet
                                                                      : CustomDimension
                                                                          .bottomIconSize,
                                                                  width: isTablet
                                                                      ? CustomDimension
                                                                          .bottomIconSizeTablet
                                                                      : CustomDimension
                                                                          .bottomIconSize,
                                                                  child: Image(
                                                                    image:
                                                                        AdvancedNetworkImage(
                                                                      isSelectedEnable
                                                                          ? isSelected
                                                                              ? navigationItem.iconSelected
                                                                              : navigationItem.iconUnSelected
                                                                          : navigationItem.iconUnSelected,
                                                                      useDiskCache:
                                                                          true,
                                                                      cacheRule:
                                                                          CacheRule(
                                                                              maxAge: const Duration(days: 7)),
                                                                    ),
                                                                  ),
                                                                ),
                      Padding(
                        padding: EdgeInsets.only(bottom: isTablet ? 3 : 2),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            navigationItem?.clAction == 'cl_engagement'
                                ? DateTimeUtils.currentDateConversion('dd')
                                : '' ?? '',
                            style: TextStyle(
                              fontSize: isTablet
                                  ? CustomDimension.bottomTextSizeTablet
                                  : CustomDimension.bottomTextSize,
                              color: Color(
                                isSelectedEnable
                                    ? isSelected
                                        ? int.parse(
                                            navigationItem.textSelectedColor
                                                ?.replaceAll(
                                                    RegExp('#'), '0xFF'),
                                          )
                                        : int.parse(
                                            navigationItem.textUnSelectedColor
                                                ?.replaceAll(
                                                    RegExp('#'), '0xFF'),
                                          )
                                    : int.parse(
                                        navigationItem.textUnSelectedColor
                                            ?.replaceAll(RegExp('#'), '0xFF'),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
//              FadeInImage.assetNetwork(
//                height: isTablet ? CustomDimension.bottomIconSizeTablet : CustomDimension.bottomIconSize,
//                width: isTablet ? CustomDimension.bottomIconSizeTablet : CustomDimension.bottomIconSize,
//                placeholder: 'assets/images/app_icon.png',
//                image: isSelected ? navigationItem.iconSelected : navigationItem.iconUnSelected,
//              ),
                SizedBox(
                  width: isTablet ? 8 : 0,
                  height: isTablet ? 0 : 5,
                ),
                Text(
                  navigationItem.name,
                  style: TextStyle(
                    fontSize: isTablet
                        ? CustomDimension.bottomTextSizeTablet
                        : CustomDimension.bottomTextSize,
                    color: Color(
                      isSelectedEnable
                          ? isSelected
                              ? int.parse(
                                  navigationItem.textSelectedColor
                                      ?.replaceAll(RegExp('#'), '0xFF'),
                                )
                              : int.parse(
                                  navigationItem.textUnSelectedColor
                                      ?.replaceAll(RegExp('#'), '0xFF'),
                                )
                          : int.parse(
                              navigationItem.textUnSelectedColor
                                  ?.replaceAll(RegExp('#'), '0xFF'),
                            ),
                    ),
                  ),
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: isTablet
                      ? CustomDimension.bottomIconSizeTablet
                      : CustomDimension.bottomIconSize,
                  width: isTablet
                      ? CustomDimension.bottomIconSizeTablet
                      : CustomDimension.bottomIconSize,
                  child: Stack(
                    children: <Widget>[
                      isCustomIcon
                          ? Image.asset(
                              isSelected
                                  ? 'assets/images/createselected.png'
                                  : 'assets/images/createdefault.png',
                              height: isTablet
                                  ? CustomDimension.bottomIconSizeTablet
                                  : CustomDimension.bottomIconSize,
                              width: isTablet
                                  ? CustomDimension.bottomIconSizeTablet
                                  : CustomDimension.bottomIconSize,
                            )
                          : isCustomizedIcon
                              ? new Image.asset(
                                  isSelected
                                      ? 'assets/images/myattendeesicon.png'
                                      : 'assets/images/myattendeesicon.png',
                                  height: isTablet
                                      ? CustomDimension.bottomIconSizeTablet
                                      : CustomDimension.bottomIconSize,
                                  width: isTablet
                                      ? CustomDimension.bottomIconSizeTablet
                                      : CustomDimension.bottomIconSize,
                                )
                              : isCustomisedIcon
                                  ? new Image.asset(
                                      isSelected
                                          ? 'assets/images/contributorsicon.png'
                                          : 'assets/images/contributorsicon.png',
                                      height: isTablet
                                          ? CustomDimension.bottomIconSizeTablet
                                          : CustomDimension.bottomIconSize,
                                      width: isTablet
                                          ? CustomDimension.bottomIconSizeTablet
                                          : CustomDimension.bottomIconSize,
                                    )
                                  : isCustomizeIcon
                                      ? Image.asset(
                                          isSelected
                                              ? 'assets/images/closeouticon.png'
                                              : 'assets/images/closeouticon.png',
                                          height: isTablet
                                              ? CustomDimension
                                                  .bottomIconSizeTablet
                                              : CustomDimension.bottomIconSize,
                                          width: isTablet
                                              ? CustomDimension
                                                  .bottomIconSizeTablet
                                              : CustomDimension.bottomIconSize,
                                        )
                                      : isCustomizingIcon
                                          ? Image.asset(
                                              isSelected
                                                  ? 'assets/images/filesicon.png'
                                                  : 'assets/images/filesicon.png',
                                              height: isTablet
                                                  ? CustomDimension
                                                      .bottomIconSizeTablet
                                                  : CustomDimension
                                                      .bottomIconSize,
                                              width: isTablet
                                                  ? CustomDimension
                                                      .bottomIconSizeTablet
                                                  : CustomDimension
                                                      .bottomIconSize,
                                            )
                                          : isCustomizedIconEO
                                              ? new Image.asset(
                                                  isSelected
                                                      ? 'assets/images/eoselected.png'
                                                      : 'assets/images/eounselected.png',
                                                  height: isTablet
                                                      ? CustomDimension
                                                          .bottomIconSizeTablet
                                                      : CustomDimension
                                                          .bottomIconSize,
                                                  width: isTablet
                                                      ? CustomDimension
                                                          .bottomIconSizeTablet
                                                      : CustomDimension
                                                          .bottomIconSize,
                                                )
                                              : isCustomizedIconSpeaker
                                                  ? new Image.asset(
                                                      isSelected
                                                          ? 'assets/images/speakerselected.png'
                                                          : 'assets/images/speakerunselected.png',
                                                      height: isTablet
                                                          ? CustomDimension
                                                              .bottomIconSizeTablet
                                                          : CustomDimension
                                                              .bottomIconSize,
                                                      width: isTablet
                                                          ? CustomDimension
                                                              .bottomIconSizeTablet
                                                          : CustomDimension
                                                              .bottomIconSize,
                                                    )
                                                  : isCustomizedIconAttendees
                                                      ? new Image.asset(
                                                          isSelected
                                                              ? 'assets/images/attendeeselected.png'
                                                              : 'assets/images/attendeeunselected.png',
                                                          height: isTablet
                                                              ? CustomDimension
                                                                  .bottomIconSizeTablet
                                                              : CustomDimension
                                                                  .bottomIconSize,
                                                          width: isTablet
                                                              ? CustomDimension
                                                                  .bottomIconSizeTablet
                                                              : CustomDimension
                                                                  .bottomIconSize,
                                                        )
                                                      : isCustomizedIconF_B
                                                          ? new Image.asset(
                                                              isSelected
                                                                  ? 'assets/images/closefbselected.png'
                                                                  : 'assets/images/closefbunselected.png',
                                                              height: isTablet
                                                                  ? CustomDimension
                                                                      .bottomIconSizeTablet
                                                                  : CustomDimension
                                                                      .bottomIconSize,
                                                              width: isTablet
                                                                  ? CustomDimension
                                                                      .bottomIconSizeTablet
                                                                  : CustomDimension
                                                                      .bottomIconSize,
                                                            )
                                                          : isCustomizedIconSurvey
                                                              ? new Image.asset(
                                                                  isSelected
                                                                      ? 'assets/images/surveyselected.png'
                                                                      : 'assets/images/surveyunselected.png',
                                                                  height: isTablet
                                                                      ? CustomDimension
                                                                          .bottomIconSizeTablet
                                                                      : CustomDimension
                                                                          .bottomIconSize,
                                                                  width: isTablet
                                                                      ? CustomDimension
                                                                          .bottomIconSizeTablet
                                                                      : CustomDimension
                                                                          .bottomIconSize,
                                                                )
                                                              : SizedBox(
                                                                  height: isTablet
                                                                      ? CustomDimension
                                                                          .bottomIconSizeTablet
                                                                      : CustomDimension
                                                                          .bottomIconSize,
                                                                  width: isTablet
                                                                      ? CustomDimension
                                                                          .bottomIconSizeTablet
                                                                      : CustomDimension
                                                                          .bottomIconSize,
                                                                  child: Image(
                                                                    image:
                                                                        AdvancedNetworkImage(
                                                                      isSelectedEnable
                                                                          ? isSelected
                                                                              ? navigationItem.iconSelected
                                                                              : navigationItem.iconUnSelected
                                                                          : navigationItem.iconUnSelected,
                                                                      useDiskCache:
                                                                          true,
                                                                      cacheRule:
                                                                          CacheRule(
                                                                              maxAge: const Duration(days: 7)),
                                                                    ),
                                                                  ),
                                                                ),
//                      Image.network(
//                        isSelected ? navigationItem.iconSelected : navigationItem.iconUnSelected,
//                        height: isTablet ? CustomDimension.bottomIconSizeTablet : CustomDimension.bottomIconSize,
//                        width: isTablet ? CustomDimension.bottomIconSizeTablet : CustomDimension.bottomIconSize,
//                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: isTablet ? 3 : 2),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            navigationItem?.clAction == 'cl_engagement'
                                ? DateTimeUtils.currentDateConversion('dd')
                                : '' ?? '',
                            style: TextStyle(
                              fontSize: isTablet
                                  ? CustomDimension.bottomTextSizeTablet
                                  : CustomDimension.bottomTextSize,
                              color: Color(
                                isSelectedEnable
                                    ? isSelected
                                        ? int.parse(
                                            navigationItem.textSelectedColor
                                                ?.replaceAll(
                                                    RegExp('#'), '0xFF'),
                                          )
                                        : int.parse(
                                            navigationItem.textUnSelectedColor
                                                ?.replaceAll(
                                                    RegExp('#'), '0xFF'),
                                          )
                                    : int.parse(
                                        navigationItem.textUnSelectedColor
                                            ?.replaceAll(RegExp('#'), '0xFF'),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: isTablet ? 8 : 0,
                  height: isTablet ? 0 : 5,
                ),
                Text(
                  navigationItem.name,
                  style: TextStyle(
                    fontSize: isTablet
                        ? CustomDimension.bottomTextSizeTablet
                        : CustomDimension.bottomTextSize,
                    color: Color(
                      isSelectedEnable
                          ? isSelected
                              ? int.parse(
                                  navigationItem.textSelectedColor
                                      ?.replaceAll(RegExp('#'), '0xFF'),
                                )
                              : int.parse(
                                  navigationItem.textUnSelectedColor
                                      ?.replaceAll(RegExp('#'), '0xFF'),
                                )
                          : int.parse(
                              navigationItem.textUnSelectedColor
                                  ?.replaceAll(RegExp('#'), '0xFF'),
                            ),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
