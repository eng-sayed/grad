import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const Color mainColor = Color(0xFF008080);
const Color subMainColor = Color(0xFF448AFF);
const Color tMainColor = Color(0xFF607D8B);
const Color background = Color.fromARGB(255, 235, 235, 235);
const String apiKey = 'AIzaSyCjJf-O_4saho_5iKG1UrmZ1ReGSKLhYbs';
CameraPosition kGooglePlex = CameraPosition(
  target: LatLng(37.42796133580664, 31.085749655962),
  zoom: 14.4746,
);
AppBar DefaultAppBar() {
  return AppBar(
    centerTitle: true,
    title: SizedBox(
        width: 80,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Image.asset(
            "assets/images/logo2.png",
          ),
        )),
  );
}
