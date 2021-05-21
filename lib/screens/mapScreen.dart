import 'dart:collection';
import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:recicle_app/controllers/collectDayNotificationController.dart';
import 'package:recicle_app/models/collectPointModel.dart';
import 'package:recicle_app/widgets/toggleCollectDayNotificationButton.dart';

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
// EXTRACTING ARGUMENTS FROM NAMED ROUTE ---------------------------------------
    final CollectPoint collectPoint = ModalRoute.of(context).settings.arguments;

//CREATING INITIAL EXECUTION ON GOOGLE MAP -------------------------------------
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
          MapOptionsLayer(collectPoint, _mapController, _currentPosition),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: screenWidth - 10,
                        height: 54,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "Ecopontos",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      color: Colors.white,
                    ),
                    width: screenWidth - 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              collectPoint.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              _truncateString(
                                collectPoint.route.location,
                                26,
                                truncatedSuffix: "...",
                              ),
                            ),
                          ],
                        ),
                        FutureBuilder<Set<int>>(
                          future: controller
                              .getActiveCollectRouteNotificationsIds(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              bool isNotificationActive =
                                  snapshot.data.contains(collectPoint.route.id);
                              return ToggleNotificationButton(
                                collectPoint.route,
                                initialButtonState: isNotificationActive,
                                colorOn: Colors.black26,
                                colorOff: Colors.black26,
                              );
                            }
                            return Container(
                                child: CircularProgressIndicator());
                          },
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black87,
                                )
                              ],
                              color: Colors.grey,
                            ),
                            width: 50,
                            height: 50,
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
                ],
              ),
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

class CollectPointMapOption extends StatelessWidget {
  final CollectPoint _collectPoint;
  final GoogleMapController _mapController;

  const CollectPointMapOption(
    this._collectPoint,
    this._mapController, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FlareControls controls = FlareControls();

    void _playSuccessAnimation() {
      // Use the controls to trigger an animation.
      controls.play("tracking");
    }

    return Card(
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
                  _playSuccessAnimation();
                  _mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(
                            _collectPoint.latitude, _collectPoint.longitude),
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
    );
  }
}

class SeeRouteMapOption extends StatelessWidget {
  final CollectPoint _collectPoint;

  const SeeRouteMapOption(
    this._collectPoint, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                      _collectPoint.latitude, _collectPoint.longitude);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyLocationMapOption extends StatelessWidget {
  final Position _currentPosition;
  final GoogleMapController _mapController;

  const MyLocationMapOption(
    this._currentPosition,
    this._mapController, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

class MapOptionsLayer extends StatefulWidget {
  final CollectPoint collectPoint;
  final GoogleMapController mapController;
  final Position currentPosition;

  const MapOptionsLayer(
    this.collectPoint,
    this.mapController,
    this.currentPosition, {
    Key key,
  }) : super(key: key);

  @override
  _MapOptionsLayerState createState() => _MapOptionsLayerState();
}

class _MapOptionsLayerState extends State<MapOptionsLayer> {
  double _visibility = 0.0;
  bool _visible = false;
  double _floatingActionButtonRightPosition = 20.0;
  double _floatingActionButtonBottomPosition = 20.0;
  double _mapOptionsRightPosition;
  static const double _mapOptionsInitialRightPosition = -200;

  _MapOptionsLayerState() {
    _mapOptionsRightPosition = _mapOptionsInitialRightPosition;
  }

  double get _mapOptionsBottomPosition {
    return _floatingActionButtonBottomPosition + 72;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (_visible) {
              setState(() {
                _hideOptions();
              });
            }
          },
          child: AnimatedContainer(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              color: Color.fromRGBO(0, 0, 0, _visibility),
            ),
            duration: Duration(milliseconds: 250),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 250),
          bottom: _floatingActionButtonBottomPosition,
          right: _floatingActionButtonRightPosition,
          child: FloatingActionButton(
            onPressed: _showOptions,
            child: Icon(Icons.add),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 250),
          bottom: _mapOptionsBottomPosition,
          right: _mapOptionsRightPosition,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CollectPointMapOption(widget.collectPoint, widget.mapController),
              SeeRouteMapOption(widget.collectPoint),
              MyLocationMapOption(widget.currentPosition, widget.mapController),
              if (widget.collectPoint.route.id != null)
                ToggleNotificationMapOption(widget.collectPoint),
            ],
          ),
        )
      ],
    );
  }

  void _hideOptions() {
    _visible = false;
    _visibility = 0.0;
    _floatingActionButtonRightPosition = 24.0;
    _mapOptionsRightPosition = _mapOptionsInitialRightPosition;
  }

  void _showOptions() {
    setState(() {
      _visible = true;
      _visibility = 0.5;
      _floatingActionButtonRightPosition = -80.0;
      _mapOptionsRightPosition = 16.0;
    });
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
            ),
          ),
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
