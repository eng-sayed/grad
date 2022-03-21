import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_bottom_sheet_nullsafety/draggable_bottom_sheet_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradution_project/controller/markers_controller.dart';
import 'package:gradution_project/model/marker_model.dart';
import 'package:gradution_project/shared/constant.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController; //contrller for Google map
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = const LatLng(27.7089427, 85.3086209);
  List<IconData> icons = [
    Icons.ac_unit,
    Icons.account_balance,
    Icons.adb,
    Icons.add_photo_alternate,
    Icons.format_line_spacing
  ];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    // dd();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Provider.of<MainScreenController>(context, listen: false)
          .onPressed();
    });

    super.initState();
  }

  // late MarkerModel markersss;
  // void dd() async {
  //   await firestore.collection("markers").get().then((querySnapshot) {
  //     querySnapshot.docs.forEach((result) {
  //       markersss = MarkerModel.fromMap(result.data() as Map<String, dynamic>);

  //       // print(result.data());
  //       print(markersss);
  //       print(markersss.lan!);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainScreenController>(builder: (context, value, child) {
      if (value.mapState == MapState.error) {
        return Scaffold(
          appBar: DefaultAppBar(),
          body: Center(
            child: Text('حدث خطاء تاكد من اتصالك بالانترنت'),
          ),
        );
      } else if (value.mapState == MapState.loading) {
        return Scaffold(
          appBar: DefaultAppBar(),
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Scaffold(
          body: DraggableBottomSheet(
            backgroundWidget: Scaffold(
              appBar: AppBar(),
              body: GoogleMap(
                //Map widget from google_maps_flutter package
                zoomGesturesEnabled: true, //enable Zoom in, out on map
                initialCameraPosition: CameraPosition(
                  //innital position in map
                  target: showLocation, //initial position
                  zoom: 15.0, //initial zoom level
                ),
                // markers: value.markers.map((e){

                // }), //markers to show on map
                markers: value.marker, //markers to show on map
                mapType: MapType.normal, //map type
                onMapCreated: (controller) {
                  //method called when map is created
                  setState(() {
                    mapController = controller;
                  });
                },
              ),
              // body: GoogleMap(
              //   zoomGesturesEnabled: true,
              //   mapType: MapType.hybrid,
              //   initialCameraPosition: CameraPosition(
              //     //innital position in map
              //     target: showLocation, //initial position
              //     zoom: 15.0, //initial zoom level
              //   ),
              //   markers: getmarkers(),
              //   onMapCreated: (controller) {
              //     //method called when map is created
              //     setState(() {
              //       mapController = controller;
              //     });
              //   },
              //   // initialCameraPosition: kGooglePlex,
              //   // onMapCreated: (GoogleMapController controller) {
              //   //   _controller.complete(controller);
              //   // },
              // ),
            ),
            previewChild: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  // Container(
                  //   width: 40,
                  //   height: 6,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10)),
                  // ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Text(
                    'Drag Me',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(
                  //   height: 16,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: icons.map((icon) {
                  //       return Container(
                  //         width: 50,
                  //         height: 50,
                  //         margin: EdgeInsets.only(right: 16),
                  //         child: Icon(
                  //           icon,
                  //           color: Colors.pink,
                  //           size: 40,
                  //         ),
                  //         decoration: BoxDecoration(
                  //             color: Colors.white,
                  //             borderRadius: BorderRadius.circular(10)),
                  //       );
                  //     }).toList())
                ],
              ),
            ),
            expandedChild: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.white,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Hey...I\'m expanding!!!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: icons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                icons[index],
                                color: Colors.pink,
                                size: 40,
                              ),
                            )),
                  )
                ],
              ),
            ),
            minExtent: 100,
            maxExtent: MediaQuery.of(context).size.height * 0.8,
          ),
        );
      }
    });
  }

  Set<Marker> getmarkers() {
    //markers to place on map
    // setState(() {
    markers.add(Marker(
      //add first marker
      markerId: MarkerId(showLocation.toString()),
      position: showLocation, //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Marker Title First ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker(
      //add second marker
      markerId: MarkerId(showLocation.toString()),
      position: LatLng(27.7099116, 85.3132343), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Marker Title Second ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    markers.add(Marker(
      //add third marker
      markerId: MarkerId(showLocation.toString()),
      position: LatLng(27.7137735, 85.315626), //position of marker
      infoWindow: InfoWindow(
        //popup info
        title: 'Marker Title Third ',
        snippet: 'My Custom Subtitle',
      ),
      icon: BitmapDescriptor.defaultMarker, //Icon for Marker
    ));

    //add more markers here
    // });

    return markers;
  }
}
