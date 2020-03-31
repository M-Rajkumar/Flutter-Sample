import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:rdcloseoutsession/WebViewStream.dart';
import 'package:rdcloseoutsession/base.dart';
import 'package:rdcloseoutsession/engagement.dart';

import 'custom_dimen.dart';

class EngagementCardContainer extends StatelessWidget with BasePage {
  EngagementCardContainer({
    Key key,
    this.engagement,
    this.isDragSlidable = false,
    this.slidableController,
    this.isTablet = false,
    this.onDeclineTap,
    this.onApproveTap,
  }) : super(key: key);

  final Engagement engagement;
  final bool isDragSlidable;
  final SlidableController slidableController;
  final bool isTablet;
  final Function onDeclineTap;
  final Function onApproveTap;
  @override
  Widget build(BuildContext context) {
    getParameter(context);
    return Slidable(
      key: Key(engagement?.id),
      enabled: isDragSlidable,
      controller: slidableController,
      actionExtentRatio: isTablet
          ? CustomDimension.slidableactionExtentRatioTablet
          : CustomDimension.slidableactionExtentRatio,
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFf85c5e),
              borderRadius: BorderRadius.circular(7.0),
            ),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/notificationdecline.png',
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Delete',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(7.0),
            ),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/notificationtick.png',
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Accept',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(
                width: isTabletDevice ? 6.0 : 4.0,
                color: Color(0xFF085f91),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      'ID: ${engagement.id ?? ''}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: isTabletDevice ? 16.0 : 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Image.asset(
                        'assets/images/noticollab.png',
                        height: 18,
                        width: 18,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Flexible(
                              child: RoundedTextContainer(
                                  text: engagement.engagementType)),
                          Flexible(
                            child: RoundedTextContainer(
                              text: engagement.status,
                              outlineColor: Color(0xFF2d6490),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 6, bottom: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        engagement.topicName,
                        style: TextStyle(
                          fontSize: isTabletDevice ? 18.0 : 16.0,
                          fontWeight: isTabletDevice
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              engagement.brandName,
                              style: TextStyle(
                                  color:
                                      Theme.of(context).textTheme.caption.color,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 14,
                              color: Theme.of(context).primaryColor,
                            ),
                            Flexible(
                              child: Html(
                                data: engagement.productName,
                                useRichText: false,
//Optional parameters:
                                defaultTextStyle: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .caption
                                        .color,
                                    fontWeight: FontWeight.w300),
                                linkStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                                onLinkTap: (url) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => WebViewStream(
                                              title: '', selectedUrl: url)));
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 2.0,
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Speaker: ${engagement.speakerName ?? '---'}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                          Text(
                            'Attendees invited: ${engagement.inviteesCount ?? '0'}',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                          Text(
                            'Attendees Confirmed: ${engagement.attendeesConfirmedCount ?? '0'}',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${engagement.date ?? ''} \n${engagement.time ?? ''}',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: isTabletDevice
                              ? FontWeight.w200
                              : FontWeight.w300,
                          fontSize: isTabletDevice ? 15 : 14),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedTextContainer extends StatelessWidget {
  const RoundedTextContainer(
      {Key key,
      @required this.text,
      this.marginEdgeInsets,
      this.paddingEdgeInsets,
      this.outlineColor,
      this.circleRadius = 4.0,
      this.isTablet = false,
      this.textStyle})
      : super(key: key);

  final String text;
  final EdgeInsetsGeometry marginEdgeInsets;
  final EdgeInsetsGeometry paddingEdgeInsets;
  final Color outlineColor;
  final double circleRadius;
  final TextStyle textStyle;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginEdgeInsets ?? EdgeInsets.only(left: 6),
      padding: paddingEdgeInsets ??
          EdgeInsets.only(left: 6, top: 3, bottom: 3, right: 6),
      decoration: new BoxDecoration(
        border: Border.all(
          color: outlineColor ?? Color(0xFF63c6ed),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(circleRadius ?? 4.0),
      ),
      child: Text(
        text ?? '',
        maxLines: 1,
        overflow: TextOverflow.fade,
        softWrap: false,
        style: textStyle ??
            TextStyle(
                fontSize: isTablet ? 14.0 : 12.0,
                fontWeight: isTablet ? FontWeight.w600 : FontWeight.w400,
                color: Colors.black54),
      ),
    );
  }
}
