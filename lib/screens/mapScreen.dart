import 'dart:collection';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recicle_app/models/collectPointModel.dart';

class GMapScreen extends StatefulWidget {
  @override
  _GMapScreenState createState() => _GMapScreenState();
  static const routeName = '/map';
}

class _GMapScreenState extends State<GMapScreen> {
  _GMapScreenState();
  Set<Marker> _markers = HashSet<Marker>();

  // IMPLEMENTING GPS LOCATION ---------------------------------------------------
  final Geolocator _geolocator = Geolocator();

  GoogleMapController _mapController;

  // For storing the current position
  Position _currentPosition;

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        // _mapController.animateCamera(
        //   CameraUpdate.newCameraPosition(
        //     CameraPosition(
        //       target: LatLng(position.latitude, position.longitude),
        //       zoom: 15.0,
        //     ),
        //   ),
        // );
      });
    }).catchError((e) {
      print(e);
    });
  }

  // GOOGLE MAPS INITIAL CALLS ---------------------------------------------------
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
// EXTRACTING ARGUMENTS FROM NAMED ROUTE ---------------------------------------
    final CollectPoint collectPoint = ModalRoute.of(context).settings.arguments;

//CREATING INITIAL EXECUTION ON GOOGLE MAP -------------------------------------

    void _onMapCreated(GoogleMapController controller) {
      _mapController = controller;
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId(collectPoint.name),
            position: LatLng(collectPoint.latitude, collectPoint.longitude),
            infoWindow: InfoWindow(
              title: collectPoint.name,
              snippet: collectPoint.adreess,
            ),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
      });
    }

//FLARE ANIMATIONS CONTROL -----------------------------------------------------
    final FlareControls controls = FlareControls();

    void _playSuccessAnimation() {
      // Use the controls to trigger an animation.
      controls.play("tracking");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("EcoPontos"),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: Stack(
        children: [
          Container(
            child: GoogleMap(
              markers: _markers,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(collectPoint.latitude, collectPoint.longitude),
                zoom: 16,
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  height: 100,
                  width: 300,
                  child: Column(
                    children: [
                      Text(
                        "texto 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Texto 2'),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: Material(
                        child: InkWell(
                          splashColor: Theme.of(context).accentColor,
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(Icons.my_location),
                          ),
                          onTap: () {
                            _mapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(_currentPosition.latitude,
                                      _currentPosition.longitude),
                                  zoom: 16.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ClipOval(
                      child: Material(
                        child: InkWell(
                          splashColor:
                              Theme.of(context).accentColor, // inkwell color
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: FlareActor("assets/location buton.flr",
                                alignment: Alignment.center,
                                fit: BoxFit.contain,
                                animation: "idle",
                                controller: controls),
                          ),
                          onTap: () {
                            _playSuccessAnimation();
                            _mapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(collectPoint.latitude,
                                      collectPoint.longitude),
                                  zoom: 16.0,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
