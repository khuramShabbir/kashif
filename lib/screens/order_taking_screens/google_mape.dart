import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class GooGleMapUi extends StatefulWidget {
  const GooGleMapUi({Key? key}) : super(key: key);

  @override
  _GooGleMapUiState createState() => _GooGleMapUiState();
}

class _GooGleMapUiState extends State<GooGleMapUi> {
  static const CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermissions();
  }

  MapType mapTypes = MapType.normal;
  GoogleMapController? googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
          onPressed: ()async {
            // googleMapController!.animateCamera(CameraUpdate.zoomIn());

            Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

            googleMapController!.animateCamera(
                CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude,position.longitude),
                    zoom: 22)));

          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: InkWell(
              onTap: Get.back,
              child: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: InkWell(
                child: SvgPicture.asset('assets/BellIcon.svg',
                    color: Colors.black, width: 25.0, height: 25.0),
              ),
            ),
          ],
        ),
        body: googleMap());
  }

  Widget googleMap(){
    return SizedBox(
        width: Get.width,
        height: Get.height,
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: mapTypes,
          myLocationEnabled: true,
          zoomControlsEnabled: true,
          myLocationButtonEnabled: true,
          onMapCreated: (GoogleMapController googleMapController) {
            this.googleMapController = googleMapController;
            setState(() {});
          },
        ));

  }


  void checkPermissions() async {
    PermissionStatus request = await Permission.location.request();
    if (request.isGranted) {
      print("GRANTED");
    } else {
      print('NOT GRANTED ${request}');
    }
  }
}
