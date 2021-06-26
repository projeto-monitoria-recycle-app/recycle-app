import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';
import 'package:recycle_app/controllers/collect_day_notification_controller.dart';
import 'package:recycle_app/models/collect_point_model.dart';
import 'package:recycle_app/screens/map_screen/widgets/collect_point_details_bar.dart';
import 'package:recycle_app/screens/map_screen/widgets/map_app_bar.dart';
import 'package:recycle_app/screens/map_screen/widgets/map_options_menu.dart';

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

        // print('CURRENT POS:' + (_currentPosition.latitude).toString());
        _markers.add(
          Marker(
            markerId: MarkerId('Minha localização'),
            position:
                LatLng(_currentPosition.latitude, _currentPosition.longitude),
            consumeTapEvents: false,
            infoWindow: InfoWindow(
              title: 'Minha localização',
            ),
            icon: BitmapDescriptor.defaultMarker,
          ),
        );
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
                snippet: collectPoint.route.location,
              ),
              icon: BitmapDescriptor.defaultMarker,
            ),
          );
        },
      );
    }

    var controller = Provider.of<CollectDayNotificationController>(context);
    double screenWidth = MediaQuery.of(context).size.width;
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
          MapOptionsMenu(collectPoint, _mapController, _currentPosition),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      MapAppBar(screenWidth: screenWidth),
                    ],
                  ),
                  CollectPointDetailsBar(
                    screenWidth: screenWidth,
                    collectPoint: collectPoint,
                    controller: controller,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
