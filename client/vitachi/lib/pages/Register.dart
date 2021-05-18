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
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final cookieManager = WebviewCookieManager();
  final Color color = Color(0xff3f8ee9);
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  String token;
  String selectedUrl = 'http://10.0.2.2:8010/auth/realms/vitachi/protocol/openid-connect/registrations?client_id=account&response_type=code&scope=email&kc_locale=de';
  String url2 = 'http://10.0.2.2:8010/auth/realms/vitachi/protocol/openid-connect/logout?redirect_uri=http%3A%2F%2F10.0.2.2%3A8010%2Fauth%2Frealms%2Fvitachi%2Faccount%2Flog';

  StreamSubscription<String> _onUrlChanged;

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.close();

    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) async {
      if (mounted && url != selectedUrl && url.contains("logout") == false) {

        flutterWebViewPlugin.hide();

        final gotCookies = await cookieManager.getCookies("http://10.0.2.2:8010/auth/realms/vitachi/");

        for (var item in gotCookies) {
          if(item.name == "KEYCLOAK_IDENTITY_LEGACY" || item.name == "KEYCLOAK_IDENTITY") {
            token = item.value;
          }
        }

        String url = 'http://10.0.2.2:8080/vitaChi/newUser';
        Map<String, String> headers = {"Content-type": "application/json"};
        String json = jsonEncode(<String, Object>{'token': token});
        Response response = await post(url, headers: headers, body: json);
        print(response.statusCode);

        await flutterWebViewPlugin.reloadUrl(url2);
      }

      if(url.contains("logout") == true) {
        flutterWebViewPlugin.close();
        print("Servus Jungs!");
        Navigator.pushReplacementNamed(context, '/login');
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
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.9,
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
}