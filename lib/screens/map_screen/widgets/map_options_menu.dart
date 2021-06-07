import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycle_app/models/collectPointModel.dart';
import 'package:recycle_app/screens/map_screen/widgets/map_options/collect_point_option.dart';
import 'package:recycle_app/screens/map_screen/widgets/map_options/my_location_option.dart';
import 'package:recycle_app/screens/map_screen/widgets/map_options/see_route_option.dart';
import 'package:recycle_app/screens/map_screen/widgets/map_options/toggle_notification_option.dart';

class MapOptionsMenu extends StatefulWidget {
  final CollectPoint collectPoint;
  final GoogleMapController mapController;
  final Position currentPosition;

  const MapOptionsMenu(
      this.collectPoint,
      this.mapController,
      this.currentPosition, {
        Key key,
      }) : super(key: key);

  @override
  _MapOptionsMenuState createState() => _MapOptionsMenuState();
}

class _MapOptionsMenuState extends State<MapOptionsMenu> {
  double _visibility = 0.0;
  bool _visible = false;
  double _floatingActionButtonRightPosition = 20.0;
  double _floatingActionButtonBottomPosition = 20.0;
  double _mapOptionsRightPosition;
  static const double _mapOptionsInitialRightPosition = -200;

  _MapOptionsMenuState() {
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