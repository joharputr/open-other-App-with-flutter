import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("TEST"),
        ),
        body: Container(
          child: Column(
            children: [
              RaisedButton(
                onPressed: () async {
                  final Email email = Email(
                    body: 'Email body',
                    subject: 'Email subject',
                    recipients: ['example@example.com'],
                    cc: ['cc@example.com'],
                    bcc: ['bcc@example.com'],
                    isHTML: false,
                  );

                  await FlutterEmailSender.send(email);
                },
                child: Text("BUTTON EMAIL"),
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () async {
                  var url =
                      'https://www.instagram.com/trisetiaayuningsih/?hl=en';

                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      universalLinksOnly: true,
                    );
                  } else {
                    throw 'There was a problem to open the url: $url';
                  }
                },
                child: Text("BUTTON INSTAGRAM"),
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () async {
                  var url = 'https://www.facebook.com/loecia.ayuningsih';

                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      universalLinksOnly: true,
                    );
                  } else {
                    throw 'There was a problem to open the url: $url';
                  }
                },
                child: Text("BUTTON FACEBOOK"),
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () async {
                  var url =
                      'https://www.youtube.com/channel/UCkKv4kIhp2Ifva74N-gtHqA';

                  if (await canLaunch(url)) {
                    await launch(
                      url,
                      universalLinksOnly: true,
                    );
                  } else {
                    throw 'There was a problem to open the url: $url';
                  }
                },
                child: Text("BUTTON YOUTUBE"),
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () async {
                  var whatsappUrl ="whatsapp://send?phone=6281572494708";
                  await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
                },
                child: Text("BUTTON WHATSAPP"),
                textColor: Colors.white,
              ),
              RaisedButton(
                onPressed: () async {
                  const url = "tel:081572494708";
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Text("BUTTON CALL PHONE"),
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
