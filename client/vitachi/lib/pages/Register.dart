import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitachi/pages/TextFieldWidget.dart';
import 'package:vitachi/pages/WaveWidget.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

String selectedUrl = 'http://10.0.2.2:8010/auth/realms/vitachi/protocol/openid-connect/registrations?client_id=account&response_type=code&scope=email&kc_locale=de';


class Register extends StatefulWidget {
  const Register({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final Color color = Color(0xff3f8ee9);
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  StreamSubscription<String> _onUrlChanged;

  final _urlCtrl = TextEditingController(text: selectedUrl);
  final _codeCtrl = TextEditingController(text: 'window.navigator.userAgent');
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.close();

    _urlCtrl.addListener(() {
      selectedUrl = _urlCtrl.text;
    });

    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted && url != selectedUrl) {
        setState(() {
          flutterWebViewPlugin.close();
        });
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
      color: Colors.white,
      //padding: EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WebviewScaffold(
            url: selectedUrl,
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width/1.2,
            height: MediaQuery.of(context).size.height/15,
            child: FlatButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text("Zurück", style: TextStyle(color: Colors.black)),
              shape: RoundedRectangleBorder(side: BorderSide(
                  color: Color(0xff3f8ee9),
                  width: 1,
                  style: BorderStyle.solid
              ),
                  borderRadius: BorderRadius.circular(50)
              ),
            ),
          )
        ],
      )
    );
  }
}