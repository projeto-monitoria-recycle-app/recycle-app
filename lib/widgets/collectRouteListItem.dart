import 'package:flutter/material.dart';
import 'package:recicle_app/models/collectRouteModel.dart';
import 'package:recicle_app/models/daysOfWeek.dart';
import 'package:recicle_app/widgets/toggleCollectDayNotificationButton.dart';

class CollectRouteListItem extends StatelessWidget {
  final CollectRoute _collectRoute;
  final bool initialButtonState;

  CollectRouteListItem(
      this._collectRoute, {
        this.initialButtonState,
      });

  @override
  Widget build(BuildContext context) {
    bool initialButtonState = this.initialButtonState ?? false;
    return Card(
      child: ListTile(
          title: Text(this._collectRoute.location),
          subtitle: Text(
              "Bairro: ${this._collectRoute.district} - ${this._collectRoute.dayOfWeek.ptBrValue} - ${this._collectRoute.dayPart} "),
          trailing: ToggleNotificationButton(
            _collectRoute,
            initialButtonState: initialButtonState,
          )),
    );
  }
}