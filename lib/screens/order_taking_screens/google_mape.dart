// @dart=2.9

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../utils.dart';


class GMaps extends StatefulWidget {
  GMaps({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GMapsState createState() => _GMapsState();
}

class _GMapsState extends State<GMaps> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;
  double lat,lng;

  static final CameraPosition initialLocation = CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.4746);

  Future<Uint8List> getMarker() async {
    ByteData byteData =await DefaultAssetBundle.of(context).load("assets/gps.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("Location"),
          position: latlng,
          rotation: 0,
          draggable: true,
          // anchor: Offset(0.5, 0.5),
          // zIndex: 2,
          flat: true,
          icon: BitmapDescriptor.fromBytes(imageData));
      //     circle = Circle(
      //     circleId: CircleId("car"),
      //     radius: newLocalData.accuracy,
      //     zIndex: 1,
      //     strokeColor: Colors.blue,
      //     center: latlng,
      //     fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }
      final position = await _geolocatorPlatform.getCurrentPosition();

      _controller.animateCamera(CameraUpdate.newCameraPosition(
          new CameraPosition(
              bearing: 0,
              target: LatLng(position.latitude, position.longitude),
              tilt: 0,
              zoom: 18.00)));

      // _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) {
      //   if (_controller != null) {
      //
      //     lat=newLocalData.latitude;
      //     lng=newLocalData.longitude;
      //
      //     _controller.animateCamera(CameraUpdate.newCameraPosition(
      //         new CameraPosition(
      //             bearing: 0,
      //             target: LatLng(newLocalData.latitude, newLocalData.longitude),
      //             tilt: 0,
      //             zoom: 18.00)));
      //
      //
      //     // updateMarkerAndCircle(newLocalData, imageData);
      //   }
      // });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }
  final geo.GeolocatorPlatform _geolocatorPlatform = geo.GeolocatorPlatform.instance;
  CameraPosition newCameraMoveTo;
  MapType maptype= MapType.normal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context, []);
          },
        ),
        backgroundColor:primaryColor,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: maptype,

            // myLocationButtonEnabled: true,
            // myLocationEnabled: true,
            initialCameraPosition: initialLocation,

            markers: Set.of((marker != null) ? [marker] : []),
            // circles: Set.of((circle != null) ? [circle] : []),
            onMapCreated: (GoogleMapController controller) async {
              _controller = controller;
              final position = await _geolocatorPlatform.getCurrentPosition();
              print("Current Location: $position");
              // _controller.moveCamera(CameraUpdate.newCameraPosition(
              //     CameraPosition(zoom: 15,
              //         target: LatLng(position.latitude, position.longitude))));
              _controller.animateCamera(CameraUpdate.newCameraPosition(
                  new CameraPosition(
                      bearing: 0,
                      target: LatLng(position.latitude, position.longitude),
                      tilt: 0,
                      zoom: 18.00)));
            },
            onCameraMove: (CameraPosition value) {
              newCameraMoveTo=value;
              // print(value.target);
            },

          ),
          Center(child: Icon(Icons.location_on,color: primaryColor,size: 40,),),
          Align(alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(width: 50,),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                    child: InkWell(
                      onTap: (){
                        if(newCameraMoveTo!=null){
                          Navigator.pop(context,[newCameraMoveTo.target.latitude,newCameraMoveTo.target.longitude]);
                        }
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: primaryColor,
                        ),
                        child: Center(child: Text("Confirm Address".tr,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 20))),
                      ),
                    ),
                  ),
                ),
                Container(width: 50,)
              ],),
          ),

          Align(
            alignment: Alignment(0.93,-1),
            child: Wrap(
              direction: Axis.vertical,
              children: [
                SizedBox(height: 20,),
                InkWell(
                  onTap: (){
                    if(maptype==MapType.normal){
                      maptype=MapType.satellite;
                    }
                    else{
                      maptype=MapType.normal;
                    }
                    setState(() {

                    });
                  },
                  child: Container(
                    // height: 25,
                    // width: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.map_rounded),
                      )),
                ),
                SizedBox(height: 20,),
                InkWell(
                  onTap: ()async{
                    if(_controller!=null){
                      getCurrentLocation();
                    }

                  },
                  child: Container(

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.gps_fixed_outlined),
                      )),
                ),
              ],),
          )

        ],
      ),

    );
  }
}