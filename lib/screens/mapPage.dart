import 'dart:collection';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:recicle_app/screens/mainScreen.dart';

class GMap extends StatefulWidget {
  GMap({Key key, this.recycleRouteAddress}) : super(key: key);
  final recycleRouteAddress;
  @override
  _GMapState createState() => _GMapState(recycleRouteAddress);
}

class _GMapState extends State<GMap> {
  Set<Marker> _markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Polyline> _polylines = HashSet<Polyline>();
  Set<Circle> _circles = HashSet<Circle>();
  bool _showMapStyle = false;

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;
  final Geolocator _geolocator = Geolocator();
  final startAddressController = TextEditingController();

  // For storing the current position
  Position _currentPosition;

  final recycleRouteAddress;
  _GMapState(this.recycleRouteAddress);

  _getCurrentLocation() async {
    await _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        // Store the position in the variable
        _currentPosition = position;

        print('CURRENT POS: $_currentPosition');

        // For moving the camera to current location
        _mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _setMarkerIcon();
    _setPolygons();
    // _setPolylines();
    _setCircles();
    _getCurrentLocation();
  }

  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/noodle_icon.png');
  }

  void _toggleMapStyle() async {
    String style = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');

    if (_showMapStyle) {
      _mapController.setMapStyle(style);
    } else {
      _mapController.setMapStyle(null);
    }
  }

  void _setPolygons() {
    List<LatLng> polygonLatLongs = List<LatLng>();
    polygonLatLongs.add(LatLng(-22.422185623993627, -42.97626432547046));
    polygonLatLongs.add(LatLng(37.78693, -122.41942));
    polygonLatLongs.add(LatLng(37.78923, -122.41542));
    polygonLatLongs.add(LatLng(37.78923, -122.42582));

    _polygons.add(
      Polygon(
        polygonId: PolygonId("0"),
        points: polygonLatLongs,
        fillColor: Colors.white,
        strokeWidth: 1,
      ),
    );
  }

  void _setCircles() {
    _circles.add(
      Circle(
          circleId: CircleId("0"),
          center: LatLng(37.76493, -122.42432),
          radius: 1000,
          strokeWidth: 2,
          fillColor: Color.fromRGBO(102, 51, 153, .5)),
    );
  }

  List<List> coordinates = [
    [-22.4187176, -42.9577971],
    [-22.4197177, -42.956518],
    [-22.4186318, -42.9567849]
  ];

  void _populateMapMakers(oordinates) {
    void addMarkes(arg, arg2) {
      String id = (arg + arg2).toString();
      _markers.add(
        Marker(
          markerId: MarkerId(id),
          position: LatLng(arg, arg2),
          infoWindow: InfoWindow(
            title: "Lugar qualquer",
            snippet: "An Interesting city",
          ),
          // icon: _markerIcon
        ),
      );
    }

    coordinates
        .forEach((coordinate) => {addMarkes(coordinate[0], coordinate[1])});
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(-22.418480, -42.957099),
          infoWindow: InfoWindow(
            title: "Lugar qualquer",
            snippet: "An Interesting city",
          ),
          // icon: _markerIcon
        ),
      );
      _populateMapMakers(coordinates);
    });
  }

  final FlareControls controls = FlareControls();

  void _playSuccessAnimation() {
    // Use the controls to trigger an animation.
    controls.play("tracking");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(-22.422185623993627, -42.97626432547046),
              zoom: 18,
            ),
            markers: _markers,
            circles: _circles,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 80),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ));
                },
              ),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipOval(
                      child: Material(
                        // color: Colors.orange[100], // button color
                        child: InkWell(
                          splashColor: Colors.blue, // inkwell color
                          child: SizedBox(
                            width: 56,
                            height: 56,
                            child: Icon(Icons.my_location),
                          ),
                          onTap: () {
                            _mapController.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: LatLng(
                                    _currentPosition.latitude,
                                    _currentPosition.longitude,
                                  ),
                                  zoom: 18.0,
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
                        // color: Colors.orange[100], // button color
                        child: InkWell(
                          splashColor: Colors.orange, // inkwell color
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
                                  target: LatLng(
                                      -22.422185623993627, -42.97626432547046),
                                  zoom: 18.0,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class Double {}

class Dynamic {}
