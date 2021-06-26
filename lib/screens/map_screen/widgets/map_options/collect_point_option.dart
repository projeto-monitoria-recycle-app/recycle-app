import 'package:flare_flutter/flare_controls.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:recycle_app/models/collect_point_model.dart';

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
            width: 100,
            color: Colors.white,
            child: Center(
                child: Text(
                  "Ecoponto",
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