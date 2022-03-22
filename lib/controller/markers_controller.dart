import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradution_project/model/marker_model.dart';
import 'package:gradution_project/screens/map.dart';

enum MapState { loading, error, done }

class MarkerController extends ChangeNotifier {
  MarkerModel markers = MarkerModel();
  Set<Marker> marker = {};
  double? lat, lan;
  List<MarkerModel> locations = [];

  MapState mapState = MapState.loading;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getMarker(context) async {
    Position position = await getGeoLocationPosition();

    await firestore.collection("markers").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) async {
        var data = MarkerModel.fromMap(result.data() as Map<String, dynamic>);

        final double distance = Geolocator.distanceBetween(
            position.latitude, position.longitude, data.lat!, data.lan!);

        print('distance  ${distance}');
        locations.add(data.copyWith(distance: distance));
        marker.add(Marker(
            markerId: MarkerId(data.lan.toString()),
            position: LatLng(data.lat!, data.lan!),
            onTap: () {
              print('object');
              showDialog(
                context: context,
                builder: (_) => FunkyOverlay(
                  address: data.address,
                  image: data.image,
                ),
              );
            }));
        // print(result.data());
        // print(markers);
      });
    });
    markers = locations.reduce((a, b) => a.distance! < b.distance! ? a : b);
    print('latttttttttt ${markers.distance}');
    print('latttttttttt ${markers.lat}');
    print('latttttttttt ${markers.lan}');
    //  print(locations.first.lat);
    // double calculateDistance(lat1, lon1, lat2, lon2) {
    //   var p = 0.017453292519943295;
    //   var c = cos;
    //   var a = 0.5 -
    //       c((lat2 - lat1) * p) / 2 +
    //       c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    //   return 12742 * asin(sqrt(a));
    // }

    // double totalDistance = 0;
    // for (var i = 0; i < marker.length - 1; i++) {
    //   // totalDistance += calculateDistance(marker.elementAt(i)["lat"],
    //   //     marker[i]["lng"], data[i + 1]["lat"], data[i + 1]["lng"]);
    // }

    // Position position = await getGeoLocationPosition();
    // print("lat   ${position.latitude}");
    // print("lon   ${position.longitude}");

    mapState = MapState.done;
    notifyListeners();
    return markers;
  }

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
