import 'dart:async';

import 'package:assignment/all_events/ui/all_events_feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Montserrat',
          accentColor: basePurpleColor,
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(brightness: Brightness.light, color: basePurpleColor)),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late CurvedAnimation _iconAnimation;

  void handleTimeout() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => AllEventsFeature()));
  }

  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));

    _iconAnimation =
        CurvedAnimation(parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image(
        image: AssetImage("assets/logo.png"),
        width: _iconAnimation.value * 100,
        height: _iconAnimation.value * 100,
      )),
      backgroundColor: basePurpleColor,
    );
  }
}

