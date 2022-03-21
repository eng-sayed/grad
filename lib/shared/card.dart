import 'package:flutter/material.dart';
import 'package:gradution_project/shared/navigator.dart';

class MainCard extends StatelessWidget {
  MainCard(
      {Key? key, required this.data, required this.path, required this.route})
      : super(key: key);
  String data, path;
  Widget route;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigate(context: context, route: route);
      },
      child: Container(
        width: 150,
        height: 150,
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.hardEdge,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Image.asset('assets/images/$path.png'), Text('${data}')],
          ),
        ),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}
