import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gradution_project/controller/markers_controller.dart';
import 'package:gradution_project/screens/home.dart';
import 'package:gradution_project/screens/splash_screen.dart';
import 'package:gradution_project/shared/constant.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainScreenController>(create: (_) {
          return MainScreenController();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            //  primarySwatch: Colors.blue,
            appBarTheme: AppBarTheme(backgroundColor: mainColor),
            scaffoldBackgroundColor: background),
        home: SplashScreen(),
      ),
    );
  }
}
