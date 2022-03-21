import 'package:flutter/material.dart';
import 'package:gradution_project/screens/map.dart';
import 'package:gradution_project/shared/card.dart';
import 'package:gradution_project/shared/navigator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
            child: Container(
                width: 55, child: Image.asset('assets/images/logo2.png')),
            tag: 'dd'),
        centerTitle: true,
        // actions: [
        //   Hero(child: Image.asset('assets/images/logo2.png'), tag: 'dd')
        // ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainCard(
                  data: 'اقرب محطه',
                  path: 'map',
                  route: MapScreen(),
                ),
                MainCard(
                  data: 'طلب الخدمه',
                  path: 'buy',
                  route: Container(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainCard(
                  data: 'تواصل معنا',
                  path: 'contact',
                  route: MapScreen(),
                ),
                MainCard(
                  data: 'معرض الصور',
                  path: 'gallery',
                  route: Container(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
