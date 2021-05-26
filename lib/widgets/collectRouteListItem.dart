import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/controllers/collectDayNotificationController.dart';
import 'package:recycle_app/models/collectRouteModel.dart';
import 'package:recycle_app/models/daysOfWeek.dart';
import 'package:recycle_app/widgets/toggleCollectDayNotificationButton.dart';

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
    var controller = Provider.of<CollectDayNotificationController>(context);
    return Card(
        child: ListTile(
      title: Text(this._collectRoute.location),
      subtitle: Text(
          "Bairro: ${this._collectRoute.district} - ${this._collectRoute.dayOfWeek.ptBrValue} - ${this._collectRoute.dayPart} "),
      trailing: _buildToggleNotificationButton(_collectRoute, controller),
    ));
  }

  Widget _buildToggleNotificationButton(
      CollectRoute collectRoute, CollectDayNotificationController controller) {
    if (controller.hasCachedIds()) {
      var initialState = controller.cachedActiveCollectRouteNotificationsIds
          .contains(collectRoute.id);
      return ToggleNotificationButtonCashed(_collectRoute, initialState);
    }

    return ToggleNotificationButtonNoCache(_collectRoute, controller);
  }
}

class ToggleNotificationButtonCashed extends StatelessWidget {
  final CollectRoute _collectRoute;
  final bool initialState;

  const ToggleNotificationButtonCashed(
    this._collectRoute,
    this.initialState, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ToggleNotificationButton(
      this._collectRoute,
      initialButtonState: initialState,
    );
  }
}

class ToggleNotificationButtonNoCache extends StatelessWidget {
  final CollectDayNotificationController _controller;

  final CollectRoute _collectRoute;

  const ToggleNotificationButtonNoCache(
    this._collectRoute,
    this._controller, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<int>>(
      future: _controller.getActiveCollectRouteNotificationsIds(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ToggleNotificationButton(
            this._collectRoute,
            initialButtonState: snapshot.data.contains(_collectRoute.id),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
