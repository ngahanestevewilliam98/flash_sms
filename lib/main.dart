import 'package:flash_sms/pages/chat.dart';
import 'package:flash_sms/pages/first_step.dart';
import 'package:flash_sms/pages/chat_list.dart';
import 'package:flash_sms/platform_services.dart';
import 'package:flash_sms/settings.dart';
import 'package:flutter/material.dart';
import 'generated/i18n.dart';

void main() => PlatformServices(
    handler: (bool firstStart) => runApp(Pref(child: FlashSmsApp(firstTimeOpened: firstStart))));

class FlashSmsApp extends StatelessWidget {
  FlashSmsApp({this.firstTimeOpened = false});

  final firstTimeOpened;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: [S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        localeResolutionCallback: S.delegate.resolution(fallback: new Locale("en", "")),
        title: 'Flash SMS',
        theme: ThemeData(
          primaryColor: Pref.of(context).primary,
        ),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => ChatListPage(),
          '/chat': (BuildContext context) => ChatPage(),
        },
        home: firstTimeOpened ? FirstStepPage() : ChatListPage());
  }
}
