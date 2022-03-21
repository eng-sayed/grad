import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradution_project/model/marker_model.dart';

enum MapState { loading, error, done }

class MainScreenController extends ChangeNotifier {
  MarkerModel markers = MarkerModel();
  Set<Marker> marker = {};

  MapState mapState = MapState.loading;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  onPressed() async {
    await firestore.collection("markers").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        var data = MarkerModel.fromMap(result.data() as Map<String, dynamic>);
        //result.data() ;
        marker.add(Marker(
            markerId: MarkerId(data.lan.toString()),
            position: LatLng(data.lat!, data.lan!),
            onTap: () {}));
        print(result.data());
        print(markers);
      });
    });
    mapState = MapState.done;
    notifyListeners();
    return markers;
  }
}
