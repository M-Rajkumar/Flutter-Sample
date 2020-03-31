import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

// import 'package:hello_world/dashboard.scss';
class WebViewStream extends StatefulWidget {
  final String title;
  final String selectedUrl;

  WebViewStream({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  _WebViewStreamState createState() => _WebViewStreamState();
}

class _WebViewStreamState extends State<WebViewStream> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final _key = UniqueKey();
  bool _isLoadingPage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoadingPage = true;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Color(0xFF389895), // Color for Android
        statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
        ));
    return new Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        bottom: PreferredSize(
          child: Container(
            color: Color(0xFF399895),
            height: 1.0,
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Color(0xFF399895)),
          iconSize: 20,
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0.0,
        backgroundColor: Color(0xFFffffff),
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            fontSize: 17,
          ),
        ),
      ),
      body: IndexedStack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: widget.selectedUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (finish) {
              setState(() {
                _isLoadingPage = false;
              });
            },
          ),
          _isLoadingPage
              ? Container(
                  padding: EdgeInsets.all(5.0),
                  alignment: FractionalOffset.topCenter,
                  child: SizedBox(
                    width: 25.0,
                    height: 25.0,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      valueColor: new AlwaysStoppedAnimation<Color>(Color(0xFF389895)),
                    ),
                  ),
                )
              : Container(
                  color: Colors.transparent,
                ),
        ],
      ),
    );
  }
} // TODO Implement this library.
