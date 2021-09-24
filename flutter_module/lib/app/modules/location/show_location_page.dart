import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_module/app/global_widgets/info_widget.dart';
import 'package:flutter_module/app/global_widgets/loading_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ShowLocationPage extends StatefulWidget {
  const ShowLocationPage({Key? key}) : super(key: key);

  @override
  _ShowLocationPageState createState() => _ShowLocationPageState();
}

class _ShowLocationPageState extends State<ShowLocationPage> {
  LocationData? currentPosition;
  Location location = Location();
  GoogleMapController? controller;
  LatLng initialcameraposition = LatLng(0.5937, 0.9629);

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Page'),
      ),
      body: Container(
        child: currentPosition == null
            ? LoadingWidget()
            : Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: initialcameraposition,
                        zoom: 15,
                      ),
                      mapType: MapType.normal,
                      onMapCreated: _onMapCreated,
                      myLocationButtonEnabled: true,
                    ),
                  ),
                  InfoWidget(
                      infoMessage:
                          'User location, long : ${currentPosition!.longitude} lat : ${currentPosition!.latitude}'),
                ],
              ),
      ),
    );
  }

  void _onMapCreated(GoogleMapController ctrl) {
    controller = ctrl;
    location.onLocationChanged.listen((loc) {
      controller!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(loc.latitude!, loc.longitude!),
        zoom: 15,
      )));
    });
  }

  Future<void> _getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    try {
      currentPosition = await location.getLocation();
    } catch (_) {
      currentPosition = null;
    }
    setState(() {
      currentPosition;
    });
  }
}
