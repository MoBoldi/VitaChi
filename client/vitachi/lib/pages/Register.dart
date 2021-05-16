import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vitachi/pages/TextFieldWidget.dart';
import 'package:vitachi/pages/WaveWidget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final Color color = Color(0xff3f8ee9);
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  String selectedUrl = 'http://10.0.2.2:8010/auth/realms/vitachi/protocol/openid-connect/registrations?client_id=account&response_type=code&scope=email&kc_locale=de';

  StreamSubscription<String> _onUrlChanged;

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.close();

    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) async {
      if (mounted && url != selectedUrl) {

          final String cookies = await flutterWebViewPlugin.evalJavascript('document.cookie.split(";")');

          print(cookies);

          /*String url = 'http://10.0.2.2:8080/vitaChi/createEingabe';
          Map<String, String> headers = {"Content-type": "application/json"};
          String json = jsonEncode(<String, Object>{'token': essenEingaben});
          print(json);
          Response response = await post(url, headers: headers, body: json);
          print(response.statusCode);*/

          //flutterWebViewPlugin.close();
          //Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xff3f8ee9),
      padding: EdgeInsets.only(top: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.91,
            child: WebviewScaffold(
              url: selectedUrl,
              withZoom: true,
              withLocalStorage: true,
              hidden: true,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/15,
            child: FlatButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text("Zurück zum Login", style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.05)),
              color: Color(0xff3f8ee9),
            ),
          )
        ],
      )
    );
  }

  String getCookies(String cookies) {
    if (null == cookies || cookies.isEmpty) {
      return null;
    }
    final List<String> cookieList = cookies.split(';');
    final Iterable<Text> cookieWidgets = cookieList.map(
          (String cookie) => Text(cookie),
    );
    return cookieList.first;
  }
}