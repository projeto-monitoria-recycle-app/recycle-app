import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
            width: 150,
            color: Colors.white,
            child: Center(
                child: Text(
                  "Minha Localização",
                  style: Theme.of(context).textTheme.bodyText1,
                )),
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