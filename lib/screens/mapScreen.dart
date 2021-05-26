import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

import 'package:provider/provider.dart';
import 'package:recycle_app/controllers/collectDayNotificationController.dart';
import 'package:recycle_app/models/collectPointModel.dart';
import 'package:recycle_app/widgets/toggleCollectDayNotificationButton.dart';

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
                  snippet: collectPoint.route.location,
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
          Positioned(
            right: 20,
            top: 50,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  height: 40,
                  width: 210,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        collectPoint.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(_truncateString(collectPoint.route.location, 26,
                          truncatedSuffix: " ...")),
                    ],
                  ),
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      color: Colors.grey,
                    ),
                    width: 100,
                    height: 100,
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      collectPoint.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/photo",
                        arguments: collectPoint.image);
                  },
                )
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 80,
                        color: Colors.white,
                        child: Center(child: Text("Ecoponto")),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).accentColor,
                        ),
                        child: ClipOval(
                          child: InkWell(
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            onTap: () {
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
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 80,
                        color: Colors.white,
                        child: Center(child: Text("Ver Rota")),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).accentColor,
                        ),
                        child: ClipOval(
                          child: InkWell(
                            child: Icon(Icons.directions, color: Colors.white),
                            onTap: () {
                              MapsLauncher.launchCoordinates(
                                  collectPoint.latitude,
                                  collectPoint.longitude);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    children: [
                      Container(
                        height: 30,
                        width: 130,
                        color: Colors.white,
                        child: Center(child: Text("Minha Localização")),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).accentColor,
                        ),
                        child: ClipOval(
                          child: InkWell(
                            child: Icon(
                              Icons.my_location,
                              color: Colors.white,
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
                    ],
                  ),
                ),
                if (collectPoint.route.id != null)
                  ToggleNotificationMapOption(collectPoint),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _truncateString(String string, int maxLength,
      {String truncatedSuffix}) {
    return string.length > maxLength
        ? string.substring(0, maxLength) + truncatedSuffix ?? ""
        : string;
  }
}

class ToggleNotificationMapOption extends StatelessWidget {
  final CollectPoint collectPoint;

  const ToggleNotificationMapOption(
    this.collectPoint, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<CollectDayNotificationController>(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      clipBehavior: Clip.antiAlias,
      child: FutureBuilder<Set<int>>(
        future: controller.getActiveCollectRouteNotificationsIds(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            bool isNotificationActive =
                snapshot.data.contains(collectPoint.route.id);
            return buildButton(context, isNotificationActive);
          }
          return Container(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Row buildButton(BuildContext context, bool isNotificationActive) {
    return Row(
      children: [
        Container(
          height: 30,
          width: 150,
          color: Colors.white,
          child: Center(
            child: Text(isNotificationActive
                ? "Desativar notificação"
                : "Ativar notificação"),
          ),
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).accentColor,
          ),
          child: ClipOval(
              child: ToggleNotificationButton(
            collectPoint.route,
            initialButtonState: isNotificationActive,
            colorOn: Colors.white,
            colorOff: Colors.white,
          )),
        ),
      ],
    );
  }

  Future<Set<int>> buildActiveCollectRouteNotificationsIds(
      BuildContext context) {
    return Provider.of<CollectDayNotificationController>(context)
        .getActiveCollectRouteNotificationsIds();
  }
}
