import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sadaqah_manager/home_page.dart';
import 'package:sadaqah_manager/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_cupertino_localizations/flutter_cupertino_localizations.dart' as ios;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('isLoggedIn') ?? false;
  var email = prefs.getString('email') ?? 'try';
  var userId = prefs.getInt('userId') ?? 0;
  debugPrint('status: $status');
  debugPrint('email: $email');
  debugPrint('userId: $userId');

  runApp(MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //ios.GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        //const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      debugShowCheckedModeBanner: false,
      title: 'Sadaqah Manager',
      theme: new ThemeData(
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
          color: Colors.red,
        ),
      ),
      home: status == false
          ? LoginScreen(true)
          : HomePage(email, int.parse('$userId'), false)));
}
