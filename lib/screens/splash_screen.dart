import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gradution_project/screens/home.dart';
import 'package:gradution_project/shared/background.dart';
import 'package:gradution_project/shared/loader.dart';
import 'package:gradution_project/shared/navigator.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      navigateReplacement(context: context, route: const Home());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBackgroundWidget(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  width: double.infinity,
                  height: 250,
                  child: Hero(
                    child: Image.asset("assets/images/logo.png"),
                    tag: 'dd',
                  )),
              ColorLoader3(
                radius: 20,
                dotRadius: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
