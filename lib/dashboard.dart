import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rdcloseoutsession/bottommenu.dart';
import 'package:rdcloseoutsession/home.dart';
import 'package:rdcloseoutsession/speaker_closeout.dart';

import 'NavigationItem.dart';
import 'base_class.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => new _DashboardPageState();
}

List<NavigationItem> navigationItemList;
enum TabItem { Today, Future }
enum TabList { Today, Future }

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin, BaseClass, WidgetsBindingObserver {
  bool clear = false;
  bool isToolbarItem = true;

  int _currentIndex = 0;
  PageController _pageController;
  bool clearEmail = true;
  String todayCount = '0', futureCount = '100';
  String todayBubbleCount = '!', futureBubbleCount = '!';
  TabList tabList = TabList.Today;
  TabItem tabItems = TabItem.Today;

  @override
  void initState() {
    setState(() {
      getSharedPreferenceParams(context);
    });
    super.initState();
    _pageController =
        PageController(initialPage: _currentIndex, keepPage: true);
    navigationItemList = new List();
    navigationItemList = [
      NavigationItem(
          'Home',
          'cl_home',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/home.png',
          'https:\/\/avexisstaging.radiusdirect.net\/coreapi\/\/images\/tabbar\/home_unselected.png',
          '#389895',
          '#999999'),
      NavigationItem('Create', 'cl_create', 'assets/images/createdefault.png',
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
          'cl_availability',
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
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Theme.of(context).primaryColor, // Color for Android
        statusBarBrightness:
            Brightness.dark // Dark == white status bar -- for IOS.
        ));

    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFfe4e7f0),
      drawerEdgeDragWidth: 0,
      // THIS WAY IT WILL NOT OPEN

//      appBar: AppBar(
//          backgroundColor: Colors.white,
//          brightness: Brightness.light,
//          elevation: 0,
//          leading: Builder(builder: (BuildContext context) {
//            return new GestureDetector(
//              onTap: () {
//                Scaffold.of(context).openDrawer();
////                initState();
//              },
//              child: new Container(
//                child: IconButton(
//                  padding: EdgeInsets.only(left: 20),
//                  icon: Image.asset(
//                    "assets/images/app_icon.png",
//                    height: 30,
//                  ),
//                ),
////                  padding: new EdgeInsets.only(left: 0.0),
//              ),
//            );
//          }),
//          actions: <Widget>[
//            // IconButton(icon: Icon(Icons.notifications_none)),
//            GestureDetector(
////              onTap: () {
////                showNotification();
////              },
//              child: Padding(
//                padding:
//                const EdgeInsets.only(top: 10, bottom: 10, right: 30),
////                  child: Image.asset(
////                    "assets/images/notification.png",
////                    width: 30,
////                  ),
//                child: Animator(
////            repeats: 5,
//                  cycles: 0,
//                  duration: Duration(seconds: 2),
//                  builder: (anim) =>
//                      Opacity(
//                        opacity: anim.value,
//                        child: Image.asset(
//                          "assets/images/notification.png",
//                          width: 30,
//                        ),
//                      ),
//                ),
//              ),
//            ),
//            GestureDetector(
//              onTap: () {
//                showSearch();
////                  Navigator.push(
////                      context,
////                      new MaterialPageRoute(
////                          builder: (context) => MyDialog()));
//              },
//              child: Padding(
//                padding:
//                const EdgeInsets.only(top: 10, bottom: 10, right: 25),
//                child: Image.asset(
//                  "assets/images/search.png",
//                  width: 25,
//                ),
//              ),
//            ),
//          ]),
      body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: navigationItemList == null ? 0 : navigationItemList.length,
          itemBuilder: (context, index) {
            return widgetControllerPage(_scaffoldKey.currentContext,
                navigationItemList[index].clAction, navigationItemList);
          }),
      bottomNavigationBar: CustomNavigationBar(
        navigationItem: navigationItemList,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: Duration(milliseconds: 350), curve: Curves.ease);
        },
      ),
    );
  }

  Widget widgetControllerPage(BuildContext buildContext, String routeItem,
      [Object object]) {
    Widget widget = Container();

    if (routeItem != null) {
      switch (routeItem) {
        case 'cl_home':
          widget = HomePage();
          break;
        case 'cl_create':
          widget = EOCloseOutPage();
          break;

        case 'cl_engagement':
          widget = EOCloseOutPage();
          break;

        case 'cl_availability':
          widget = EOCloseOutPage();
          break;

        case 'cl_more':
          widget = EOCloseOutPage();
          break;
//        case 'cl_invitee':
//          widget = MorePage();
//          break;
      }
    }

    return widget;
  }
}
