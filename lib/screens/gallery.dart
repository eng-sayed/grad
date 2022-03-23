import 'package:flutter/material.dart';
import 'package:gradution_project/shared/constant.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Gallery extends StatelessWidget {
  Gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('معرض الصور',
            style: TextStyle(color: Colors.white, fontSize: 19)),
        centerTitle: true,
        actions: [
          Hero(
            tag: 'dd',
            child: Container(
              width: 45,
              child: Image.asset(
                "assets/images/logo2.png",
                //  width: 60,
              ),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     openwhatsapp(context);
      //   },
      //   child: Icon(
      //     Icons.whatsapp,
      //     color: whiteColor,
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.custom(
          gridDelegate: SliverWovenGridDelegate.count(
            crossAxisCount: 2,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            pattern: [
              WovenGridTile(1),
              WovenGridTile(
                5 / 7,
                crossAxisRatio: 0.9,
                alignment: AlignmentDirectional.centerEnd,
              ),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                    child: Image.network(image[index]),
                    // decoration: BoxDecoration(border: Border.all()),
                  ),
              childCount: image.length),
        ),
      ),
    );
  }

  List image = [
    'https://ae01.alicdn.com/kf/H61f6e8d2c64b470f9526184448cedbe2q.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD674z9NvqPYCK16BOpEGVRMjdVo92ibx6Kg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD674z9NvqPYCK16BOpEGVRMjdVo92ibx6Kg&usqp=CAU',
    'https://the-gadgeteer.com/wp-content/uploads/2021/09/easythreed-k7-4.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZxxAsyP8n0BEU7IJi4PNJ2kSM-WwoRdRLKg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRq0_dk7yqnKq2GWpMvOEPnGjopEup-sDIw&usqp=CAU',
    'https://ae01.alicdn.com/kf/H61f6e8d2c64b470f9526184448cedbe2q.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD674z9NvqPYCK16BOpEGVRMjdVo92ibx6Kg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD674z9NvqPYCK16BOpEGVRMjdVo92ibx6Kg&usqp=CAU',
    'https://the-gadgeteer.com/wp-content/uploads/2021/09/easythreed-k7-4.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZxxAsyP8n0BEU7IJi4PNJ2kSM-WwoRdRLKg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRq0_dk7yqnKq2GWpMvOEPnGjopEup-sDIw&usqp=CAU',
    'https://ae01.alicdn.com/kf/H61f6e8d2c64b470f9526184448cedbe2q.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD674z9NvqPYCK16BOpEGVRMjdVo92ibx6Kg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD674z9NvqPYCK16BOpEGVRMjdVo92ibx6Kg&usqp=CAU',
    'https://the-gadgeteer.com/wp-content/uploads/2021/09/easythreed-k7-4.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZxxAsyP8n0BEU7IJi4PNJ2kSM-WwoRdRLKg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRq0_dk7yqnKq2GWpMvOEPnGjopEup-sDIw&usqp=CAU',
    'https://ae01.alicdn.com/kf/H61f6e8d2c64b470f9526184448cedbe2q.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD674z9NvqPYCK16BOpEGVRMjdVo92ibx6Kg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQD674z9NvqPYCK16BOpEGVRMjdVo92ibx6Kg&usqp=CAU',
    'https://the-gadgeteer.com/wp-content/uploads/2021/09/easythreed-k7-4.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZxxAsyP8n0BEU7IJi4PNJ2kSM-WwoRdRLKg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuRq0_dk7yqnKq2GWpMvOEPnGjopEup-sDIw&usqp=CAU',
  ];
}
