import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:recycle_app/models/collectPointModel.dart';

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
            width: 100,
            color: Colors.white,
            child: Center(
                child: Text(
                  "Ver Rota",
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