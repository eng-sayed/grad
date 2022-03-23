import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:draggable_bottom_sheet_nullsafety/draggable_bottom_sheet_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradution_project/controller/markers_controller.dart';
import 'package:gradution_project/model/marker_model.dart';
import 'package:gradution_project/shared/constant.dart';
import 'package:gradution_project/shared/responsive.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  BitmapDescriptor? markerbitmap;
  //contrller for Google map
  // final Set<Marker> markers = new Set(); //markers for google map
  // static const LatLng showLocation = const LatLng(27.7089427, 85.3086209);
  // List<IconData> icons = [
  //   Icons.ac_unit,
  //   Icons.account_balance,
  //   Icons.adb,
  //   Icons.add_photo_alternate,
  //   Icons.format_line_spacing
  // ];
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    // TODO: implement initState
    // dd();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(configuration, 'assets/images/logo.png')
          .then((icon) {
        setState(() {
          markerbitmap = icon;
        });
      });

      await Provider.of<MarkerController>(context, listen: false)
          .getMarker(context);
      // markerbitmap = await BitmapDescriptor.fromAssetImage(
      //   ImageConfiguration(),
      //   "assets/images/solar.png",
      // );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MarkerController>(builder: (context, value, child) {
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
          appBar: AppBar(),
          body: GoogleMap(
            zoomGesturesEnabled: true,
            initialCameraPosition: CameraPosition(
              target: LatLng(value.markers.lat!, value.markers.lan!),
              zoom: 15.0,
            ),
            markers: value.marker,
            mapType: MapType.satellite,
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
                //   controller.animateCamera(cameraUpdate)
              });
            },
          ),
        );
      }
    });
  }

  // Set<Marker> getmarkers() {
  //   //markers to place on map
  //   // setState(() {
  //   markers.add(Marker(
  //     //add first marker
  //     markerId: MarkerId(showLocation.toString()),
  //     position: showLocation, //position of marker
  //     infoWindow: InfoWindow(
  //       //popup info
  //       title: 'Marker Title First ',
  //       snippet: 'My Custom Subtitle',
  //     ),
  //     icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //   ));

  //   markers.add(Marker(
  //     //add second marker
  //     markerId: MarkerId(showLocation.toString()),
  //     position: LatLng(27.7099116, 85.3132343), //position of marker
  //     infoWindow: InfoWindow(
  //       //popup info
  //       title: 'Marker Title Second ',
  //       snippet: 'My Custom Subtitle',
  //     ),
  //     icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //   ));

  //   markers.add(Marker(
  //     //add third marker
  //     markerId: MarkerId(showLocation.toString()),
  //     position: LatLng(27.7137735, 85.315626), //position of marker
  //     infoWindow: InfoWindow(
  //       //popup info
  //       title: 'Marker Title Third ',
  //       snippet: 'My Custom Subtitle',
  //     ),
  //     icon: BitmapDescriptor.defaultMarker, //Icon for Marker
  //   ));

  //   //add more markers here
  //   // });

  //   return markers;
  // }
}

class FunkyOverlay extends StatefulWidget {
  FunkyOverlay({required this.address, required this.image});
  String? image, address;
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation!,
          child: Container(
            width: 250.w,
            height: 330.h,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 200.w,
                    // child: Image.network(widget.image!),
                    child: FadeInImage(
                      image: Image.network(widget.image!).image,
                      placeholder:
                          Image.asset("assets/images/placeholder.gif").image,
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(widget.address!),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
