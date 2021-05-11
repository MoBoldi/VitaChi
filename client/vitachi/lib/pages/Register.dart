import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vitachi/pages/TextFieldWidget.dart';
import 'package:vitachi/pages/WaveWidget.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final eingaben = GlobalKey<FormState>();
  final Color color = Color(0xff3f8ee9);

  Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: WebView(
        initialUrl: 'http://10.0.2.2:8010/auth/realms/vitachi/protocol/openid-connect/registrations?client_id=account&redirect_uri=http%3A%2F%2F10.0.2.2%3A8010%2Fauth%2Frealms%2Fvitachi%2Faccount%2Flogin-redirect&state=0%2F14997994-c8da-4f2a-b57e-c0e91d48bc3e&response_type=code&scope=openid',
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      ),
    );
  }
}

Future<void> registerNewUser() async {
   Future<http.Response> r = http.post(
    Uri.http('10.0.2.2:8080', 'vitaChi/registerNewUser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'username': "User1",
      'vorname': "User",
      'nachname': "Test",
      'password': "Passwort",
      'email': "test@user.com"
    }),
  );

   print(r.runtimeType);
}
