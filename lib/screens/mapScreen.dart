import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:recycle_app/models/collectPointModel.dart';

class GMapScreen extends StatefulWidget {
  @override
  _GMapScreenState createState() => _GMapScreenState();
  static const routeName = '/map';
}

class _GMapScreenState extends State<GMapScreen> {
  _GMapScreenState();
  Set<Marker> _markers = HashSet<Marker>();

  // IMPLEMENTING GPS LOCATION -------------------------------------------------
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
    final CollectPoint collectPoint = ModalRoute.of(context).settings.arguments;

    void _onMapCreated(GoogleMapController controller) {
      _mapController = controller;
      setState(
        () {
          _markers.add(
            Marker(
                markerId: MarkerId(collectPoint.name),
                position: LatLng(collectPoint.latitude, collectPoint.longitude),
                consumeTapEvents: false,
                infoWindow: InfoWindow(
                  title: collectPoint.name,
                  snippet: collectPoint.adreess,
                ),
                icon: BitmapDescriptor.defaultMarker),
          );
        },
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: GoogleMap(
              markers: _markers,
              onMapCreated: _onMapCreated,
              mapToolbarEnabled: false,
              myLocationButtonEnabled: false,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                target: LatLng(collectPoint.latitude, collectPoint.longitude),
                zoom: 16,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: InkWell(
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).accentColor,
                ),
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
