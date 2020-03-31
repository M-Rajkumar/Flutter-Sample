import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rdcloseoutsession/NavigationItem.dart';
import 'package:rdcloseoutsession/custom_dimen.dart';
import 'package:rdcloseoutsession/dashboard.dart';
import 'package:rdcloseoutsession/engagement.dart';
import 'package:rdcloseoutsession/engagement_cardcontainer.dart';
import 'package:rdcloseoutsession/speaker_closeout.dart';
import 'package:url_launcher/url_launcher.dart';

import 'base_class.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

List<NavigationItem> navigationItemList;
enum TabItem { Today, Future }

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, BaseClass, WidgetsBindingObserver {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      new HomePage();
    });

    return null;
  }
  // final TextEditingController _controller_controllerEmail = new TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   random = Random();
  //   refreshList();
  // }
  bool clear = false;
  void _textclear(String value) {
    setState(() {
      clear = value.length > 0;
    });
  }

  bool _giveVerse = false;
  bool clearEmail = true;
  TextEditingController _controllerEmail;
  String todayCount = '0', futureCount = '100';
  String todayBubbleCount = '!', futureBubbleCount = '!';
  TabList tabList = TabList.Today;
  TabItem tabItems = TabItem.Today;

  TabController _controller;
  List<Engagement> engagementList;
  List data;
  @override
  void initState() {
    setState(() {
      getSharedPreferenceParams(context);
    });
    super.initState();
    _controllerEmail = TextEditingController();
    _controller = new TabController(length: 2, vsync: this);

//    groupList = new List();
    navigationItemList = new List();
    navigationItemList = [
      NavigationItem(
          'Home',
          'cl_home',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/home.png',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/home_unselected.png',
          '#389895',
          '#999999'),
      NavigationItem('Create', 'cl_create', 'assets/images/createselected.png',
          'assets/images/createdefault.png', '#389895', '#999999'),
      NavigationItem(
          'Engagements',
          'cl_engagement',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/engagements.png',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/engagements_unselected.png',
          '#389895',
          '#999999'),
      NavigationItem(
          'Speaker List',
          'cl_more',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/avaliability.png',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/avaliability_unselected.png',
          '#389895',
          '#999999'),
      NavigationItem(
          'More',
          'cl_more',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/more.png',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/more_unselected.png',
          '#389895',
          '#999999'),
    ];
    engagementList = new List();
    engagementList = [
      Engagement(
          '100',
          'Live Engagementy 2020',
          'Owner',
          'Completed',
          'Introduction to ZOLGENSMA (onasemnogene '
              'abeparvovec-xioi) suspension for intravenous infusion',
          'ZOLGENSMA&nbsp;<a class=\"isitext\" href='
              '\"https://www.zolgensma.com/\" target=\"_blank\">ISI</a>',
          'Avexis',
          'Arun A',
          '6',
          '9',
          'Nov 18, 1990',
          '12:00 PM'),
      Engagement(
          '101',
          'Live in office',
          'Collaborate',
          'Pending Venue Confirmation',
          'Mechanism of Action',
          'ZOLGENSMA&nbsp;<a class=\"isitext\" href='
              '\"https://www.zolgensma.com/\" target=\"_blank\">ISI</a>',
          'Avexis',
          'Haasini M',
          '56',
          '100',
          'Jan 21, 2020',
          '03:06 PM'),
      Engagement(
          '101',
          'Live in office',
          'Collaborate',
          'Pending Venue Confirmation',
          'Mechanism of Action',
          'ZOLGENSMA&nbsp;<a class=\"isitext\" href='
              '\"https://www.zolgensma.com/\" target=\"_blank\">ISI</a>',
          'Avexis',
          'Haasini M',
          '56',
          '100',
          'Jan 21, 2020',
          '03:06 PM'),
      Engagement(
          '101',
          'Live in office',
          'Collaborate',
          'Pending Venue Confirmation',
          'Mechanism of Action',
          'ZOLGENSMA&nbsp;<a class=\"isitext\" href='
              '\"https://www.zolgensma.com/\" target=\"_blank\">ISI</a>',
          'Avexis',
          'Haasini M',
          '56',
          '100',
          'Jan 21, 2020',
          '03:06 PM'),
      Engagement(
          '101',
          'Live in office',
          'Collaborate',
          'Pending Venue Confirmation',
          'Mechanism of Action',
          'ZOLGENSMA&nbsp;<a class=\"isitext\" href='
              '\"https://www.zolgensma.com/\" target=\"_blank\">ISI</a>',
          'Avexis',
          'Haasini M',
          '56',
          '100',
          'Jan 21, 2020',
          '03:06 PM'),
      Engagement(
          '101',
          'Live in office',
          'Collaborate',
          'Pending Venue Confirmation',
          'Mechanism of Action',
          'ZOLGENSMA&nbsp;<a class=\"isitext\" href='
              '\"https://www.zolgensma.com/\" target=\"_blank\">ISI</a>',
          'Avexis',
          'Haasini M',
          '56',
          '100',
          'Jan 21, 2020',
          '03:06 PM'),
      Engagement(
          '101',
          'Live in office',
          'Collaborate',
          'Pending Venue Confirmation',
          'Mechanism of Action',
          'ZOLGENSMA&nbsp;<a class=\"isitext\" href='
              '\"https://www.zolgensma.com/\" target=\"_blank\">ISI</a>',
          'Avexis',
          'Haasini M',
          '56',
          '100',
          'Jan 21, 2020',
          '03:06 PM'),
    ];
    new Future<String>.delayed(
            new Duration(seconds: 5), () => '["123", "456", "789"]')
        .then((String value) {
      if (!mounted) return;
      setState(() {
        data = json.decode(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Theme.of(context).primaryColor, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFfe4e7f0),
      drawerEdgeDragWidth: 0,
      // THIS WAY IT WILL NOT OPEN

      appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          leading: Builder(builder: (BuildContext context) {
            return new GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
//                initState();
              },
              child: new Container(
                child: IconButton(
                  padding: EdgeInsets.only(left: 20),
                  icon: Image.asset(
                    "assets/images/app_icon.png",
                    height: 30,
                  ),
                ),
//                  padding: new EdgeInsets.only(left: 0.0),
              ),
            );
          }),
          actions: <Widget>[
            // IconButton(icon: Icon(Icons.notifications_none)),
            GestureDetector(
              onTap: () {
                showNotification();
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 30),
//                  child: Image.asset(
//                    "assets/images/notification.png",
//                    width: 30,
//                  ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showSearch();
//                  Navigator.push(
//                      context,
//                      new MaterialPageRoute(
//                          builder: (context) => MyDialog()));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10, right: 25),
                child: Image.asset(
                  "assets/images/search.png",
                  width: 25,
                ),
              ),
            ),
          ]),
      body: _columnsection(),
    );
  }

  Widget _columnsection() {
//    if (data == null) {
//      return Center(
//        child: Text(
//            'Loading...'
//        ),
//      );
//    } else {
    return Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
//                BreadCrumbContainer(),
//                  BreadCrumbContainer(
//                    title: "AveXis",
//                    product:  'ZOLGENSMA&nbsp;<a class=\"isitext\" href=\"https://www.zolgensma.com/\" target=\"_blank\">ISI</a>',
//                    tralling: true,
//                    filter: ,
//                    arrow: "assets/images/arrow_white.png",
//                    engagememtid: "",
//                    trallingid: false,
//                  ),
//                  ToggleContainer(
//                    title:  "View Sales Team Engagement Only",
//                    value: false,
//                    onchange:  (bool newValue) {
//                      setState(() {
//                        value = newValue;
//                      });
//                    },
//                  ),
              Visibility(
                visible: true,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text("View Sales Team Engagement Only"),
                        Transform.scale(
                          scale: 0.9,
                          child: CupertinoSwitch(
                              activeColor: Theme.of(context).primaryColor,
                              value: _giveVerse,
                              onChanged: (bool value) {
                                setState(() {
                                  _giveVerse = value;
                                });
                              }),
                        )
                      ],
                    ),
                  ),
                ),
              ),
//                  Container(
//                    color: Theme.of(context).primaryColor,
//                    height: 40,
//                    child: Row(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.all(8.0),
//                          child: RichText(
//                            text: TextSpan(children: [
//                              TextSpan(
//                                text: 'AveXis',
//                                style: TextStyle(
//                                  fontSize: 15,
//                                  color: Color(0xFFffffff),
//                                  fontWeight: FontWeight.w400,
//                                  fontFamily: 'Roboto-thin',
//                                  decoration: TextDecoration.none,
//                                ),
//                              ),
//                              WidgetSpan(
//                                child: Padding(
//                                  padding: EdgeInsets.only(
//                                      left: 4, right: 0, bottom: 3),
//                                  child: Image.asset(
//                                    "assets/images/arrow_white.png",
//                                    height: 11,
//                                  ),
//                                ),
//                              ),
//                            ]),
//                          ),
//                        ),
//                        Flexible(
//                          child: Container(
//                            transform:
//                            Matrix4.translationValues(-6.0, 0.0, 0.0),
//                            padding: EdgeInsets.only(left: 0.0, top: 9),
//                            child: Html(
//                              data: """
//  ZOLGENSMA&nbsp;<a style=\"color:red;\" class=\"isitext\" href=\"https:\/\/www.cycloset.com\/\" target=\"_blank\">ISI<\/a>
//  """,
//                              //Optional parameters:
//
//                              defaultTextStyle: TextStyle(
//                                fontFamily: 'Roboto-thin',
//                                fontSize: 15,
//                                color: Colors.white,
//                                fontWeight: FontWeight.w400,
//                              ),
//                              linkStyle: TextStyle(
//                                fontWeight: FontWeight.w500,
////                                color: Colors.red[800],
//                                color: Color(0xFFf03e3e),
//                              ),
//                              onLinkTap: (url) {
//                                // open url in a webview
//                                print(url);
//                                _launchURL(url);
//                              },
//                            ),
//                          ),
//                        ),
//                        GestureDetector(
//                          onTap: () {
//                            Navigator.push(
//                                context,
//                                new MaterialPageRoute(
//                                    builder: (context) => FilterPage()));
//                          },
//                          child: Container(
//                            margin:
//                            EdgeInsets.only(right: 15, top: 5, bottom: 5),
//                            decoration: BoxDecoration(
//                              borderRadius: BorderRadius.all(
//                                Radius.circular(3),
//                              ),
//                              color: Colors.white,
//                            ),
//                            child: Padding(
//                              padding: EdgeInsets.only(
//                                left: 8,
//                                right: 8,
//                              ),
//                              child: Image.asset(
//                                "assets/images/filter2default.png",
//                                width: 23,
//                                height: 30,
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                  Toggle starts
//                  Container(
//                    color: Colors.white,
//                    padding: EdgeInsets.only(
//                      top: 10,
//                      bottom: 0,
//                      left: 10,
//                    ),
//                    child: Row(
//                      children: <Widget>[
//                        Padding(
//                          padding: EdgeInsets.only(
//                            right: 10,
//                          ),
//                          child: Text(
//                            "View Sales Team Engagement Only",
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 14,
//                              fontWeight: FontWeight.w400,
//                            ),
//                          ),
//                        ),
//                        CupertinoSwitch(
//                          value: _giveVerse,
//                          onChanged: (bool newValue) {
//                            setState(() {
//                              _giveVerse = newValue;
//                            });
//                          },
//                        ),
//                      ],
//                    ),
//                  ),
              //                  Toggle ends

              AnimatedContainer(
                duration: Duration(seconds: 1),
                height: CustomDimension.tabContainerHeight,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      height: CustomDimension.tabContainerHeight / 2,
                    ),
                    TabAlignContainer(
                      alignment: Alignment.topLeft,
                      isSelected: tabItems == TabItem.Today,
                      tabItem: TabItem.Today,
                    ),
                    TabAlignContainer(
                      alignment: Alignment.topRight,
                      isSelected: tabItems == TabItem.Future,
                      tabItem: TabItem.Future,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: tabItems == TabItem.Today
                                        ? BoxDecoration(
                                            color: Color(0xFFe4e7f0),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(7.0),
                                                topRight: Radius.circular(7.0),
                                                topLeft: Radius.circular(7.0)),
                                          )
                                        : BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(7.0)),
                                          ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          tabItems = TabItem.Today;
                                        });
                                      },
                                      child: TabItemContainer(
                                        title: 'Today',
                                        count: todayCount,
                                        isSelected: tabItems == TabItem.Today,
                                        colorCode: Color(0xFF03cfc6),
//                                          Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
//                                  Visibility(
//                                    visible: false,
////                                      child: TabBubbleItem(
////                                        colorCode:
////                                        Theme
////                                            .of(context)
////                                            .primaryColor,
////                                        bubbleCount: todayBubbleCount,
////                                      ),
//                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: tabItems == TabItem.Future
                                        ? BoxDecoration(
                                            color: Color(0xFFe4e7f0),
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(7.0),
                                                topRight: Radius.circular(7.0),
                                                topLeft: Radius.circular(7.0)),
                                          )
                                        : BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(7.0)),
                                          ),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          tabItems = TabItem.Future;
                                        });
                                      },
                                      child: TabItemContainer(
                                          title: 'Future',
                                          count: futureCount,
                                          isSelected:
                                              tabItems == TabItem.Future,
                                          colorCode:
                                              Theme.of(context).accentColor

//                                          Theme.of(context).buttonColor,
                                          ),
                                    ),
                                  ),
//                                    Visibility(
//                                      visible: false,
//                                      child: TabBubbleItem(
//                                        colorCode:
//                                        Theme
//                                            .of(context)
//                                            .buttonColor,
//                                        bubbleCount: futureBubbleCount,
//                                      ),
//                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(3),
                      itemCount:
                          engagementList == null ? 0 : engagementList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final movie = this.engagementList[index];
                        return Container(
                          padding: EdgeInsets.all(5),
                          child: GestureDetector(
//                                onTap: (){
//                                  Navigator.push(context,
//                                    new MaterialPageRoute(builder: (context) => EngagementDetailsPage()));
//                                },
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EOCloseOutPage(),
                                ),
                              ),
                            },
                            child: EngagementCardContainer(
                              engagement: engagementList[index],
                            ),
                          ),
                        );
                      }),
                  onRefresh: refreshList,
                  key: refreshKey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
//    }
  }

// SEARCH STARTS
  void showSearch() {
    void _showClearIcon(String value) {
      setState(() {
        clearEmail = value.length > 0;
      });
    }

    showGeneralDialog(
      context: context,
      barrierColor: Colors.transparent.withOpacity(0.1), // background color
      barrierDismissible:
          false, // should dialog be dismissed when tapped outside
      barrierLabel: "Dialog", // label for barrier
      transitionDuration: Duration(
          milliseconds:
              400), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.2), // background color
          // makes widget fullscreen
          // child: Material(
          body: SafeArea(
            child: Container(
              color: Platform.isAndroid
                  ? Colors.white
                  : Colors.grey.withOpacity(0.4),
              height: 67,
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width - 90,
                          child: TextField(
                            autofocus: true,
                            cursorColor: Theme.of(context).primaryColor,
                            onChanged: (text) {
                              setState(() {
                                _showClearIcon(text);
                              });
                            },

                            keyboardType: TextInputType.text,
                            keyboardAppearance: Brightness.dark,
//                controller: editingController,
                            controller: _controllerEmail,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              hintText: "Search",
                              fillColor: Color(0xFFe4e7f0),
                              filled: true,
                              prefixIcon: IconButton(
                                icon: Image.asset(
                                  'assets/images/search.png',
                                  height: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              suffixIcon: Visibility(
                                visible: true,
                                child: IconButton(
                                  onPressed: () {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback(
                                            (_) => _controllerEmail.clear());
//                                    _controllerEmail.clear();
                                    setState(() {
                                      clearEmail = true;
                                    });
                                  },
                                  icon: Icon(Icons.clear),
                                  iconSize: 20,
                                  color: Color(0xFF399895),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Ink(
                                child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            )),
                          ),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

// SEARCH ENDS
// NOTIFICATION STARTS
  void showNotification() {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black12.withOpacity(0.4), // background color
      barrierDismissible:
          false, // should dialog be dismissed when tapped outside
      barrierLabel: "Dialog", // label for barrier
      transitionDuration: Duration(
          milliseconds:
              400), // how long it takes to popup dialog after button click
      pageBuilder: (_, __, ___) {
        // your widget implementation
        return Scaffold(
          resizeToAvoidBottomPadding: false,

          backgroundColor: Colors.black.withOpacity(0.2), // background color
          // makes widget fullscreen
          // child: Material(
          body: SafeArea(
            child: Container(
                margin: EdgeInsets.only(top: 5, bottom: 0),
                child: Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            color: Colors.transparent,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 60),
                                  padding: EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          width: 0.5, color: Color(0xFF000000)),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/notselection.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 22,
                                        right: 22,
                                        top: 10,
                                        bottom: 10),
                                    child: Image.asset(
                                      "assets/images/notificationselected.png",
                                      // height: 40,
                                      width: 25,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          // padding: EdgeInsets.all(10),
                          child: Container(
                            transform:
                                Matrix4.translationValues(0.0, -1.0, 0.0),
                            color: Color(0xFFe3e6ef),
                            width: MediaQuery.of(context).size.width / 1,
                            child: EOCloseOutPage(),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

// NOTIFICATION ENDS
  _launchURL(String _url) async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }
}

class TabAlignContainer extends StatelessWidget {
  final bool isSelected;
  final Alignment alignment;
  final TabItem tabItem;

  TabAlignContainer({this.isSelected, this.alignment, this.tabItem});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
//        height: 65,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: tabItem == TabItem.Today
              ? BorderRadius.only(
                  bottomRight: Radius.circular(isSelected ? 10 : 0),
                )
              : BorderRadius.only(
                  bottomLeft: Radius.circular(isSelected ? 10 : 0),
                ),
        ),
        width: 10.0,
      ),
    );
  }
}

class TabItemContainer extends StatelessWidget {
  final String title;
  final String count;
  final Color colorCode;
  final bool isSelected;
  TabItemContainer({this.title, this.count, this.colorCode, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorCode,
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
      ),
      margin: EdgeInsets.all(7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(count,
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}
