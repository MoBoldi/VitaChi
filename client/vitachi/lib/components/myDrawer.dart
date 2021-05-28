import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';

class MyDrawer extends StatelessWidget {

  final flutterWebViewPlugin = FlutterWebviewPlugin();
  String selectedUrl = 'http://10.0.2.2:8010/auth/realms/vitachi/protocol/openid-connect/logout?client_id=account&response_type=code';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              child: Center(
                child: Image(
                  image: AssetImage("assets/LogoSlider.png"),
                  height: MediaQuery.of(context).size.height / 8,
                ),
              ),
            ),
            decoration: BoxDecoration(),
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.home),
                Text(
                  " Home",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.star),
                Text(
                  " Eingaben",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/eingabeNav');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.bar_chart),
                Text(
                  " Statistiken",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/statisticsNav');
            },
          ),
          /*ListTile(
            title: Row(
              children: [
                Icon(Icons.person_add),
                Text(
                  " Freunde",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/freunde');
            },
          ),*/
          ListTile(
            title: Row(
              children: [
                Icon(Icons.shopping_cart),
                Text(
                  " Shop",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/shop');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.menu_book),
                Text(
                  " ToDo",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/aufgaben');
            },
          ),
          /*ListTile(
            title: Row(
              children: [
                Icon(Icons.settings),
                Text(
                  " Settings",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),*/
          ListTile(
            title: Row(
              children: [
                Icon(Icons.event_seat),
                Text(
                  " Wohnzimmer",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/wohnzimmer');
            },
          ),
          ListTile(
            title: Row(
              children: [
                Icon(Icons.logout, color: Color(0xFFB5475A),),
                Text(
                  " Logout",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFB5475A),
                  ),
                ),
              ],
            ),
            onTap: () {
              logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }

  void logout() async {

    final cookieManager = WebviewCookieManager();
    String token;
    String refresh;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString("accessToken");
    String refreshToken = prefs.getString("refreshToken");

    String url = 'http://10.0.2.2:8010/auth/realms/vitachi/protocol/openid-connect/logout?response_type=code';
    Map<String, String> headers = {"Authorization": "Bearer $accessToken", "Content-type": "application/x-www-form-urlencoded"};
    String body = "client_id=vitachi-client&client_secret=6c6151b2-ea27-42fc-97fd-b05c42eebf4f&refresh_token=$refreshToken";
    
    await post(url, headers: headers, body: body);

    cookieManager.clearCookies();
  }
}