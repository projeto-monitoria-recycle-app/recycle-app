import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/controllers/collect_day_notification_controller.dart';
import 'package:recycle_app/models/collect_route_model.dart';
import 'package:recycle_app/widgets/toggle_button_widget.dart';

import 'notification_dialog_widget.dart';

class ToggleNotificationButton extends StatelessWidget {
  final CollectRoute _collectRoute;
  final bool initialButtonState;
  final Color colorOff;
  final Color colorOn;

  ToggleNotificationButton(
    this._collectRoute, {
    Key key,
    this.initialButtonState,
    this.colorOff,
    this.colorOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool initialButtonState =
        this.initialButtonState == null ? false : this.initialButtonState;
    return Consumer<CollectDayNotificationController>(
        builder: (context, controller, child) =>
            _buildToggleButton(initialButtonState, context, controller));
  }

  ToggleButton _buildToggleButton(bool initialButtonState, BuildContext context,
      CollectDayNotificationController controller) {
    return ToggleButton(
      key: UniqueKey(),
      initialButtonState: initialButtonState,
      iconOn: Icon(
        Icons.notifications_active,
        color: colorOn ?? Theme.of(context).accentColor,
      ),
      iconOff: Icon(
        Icons.notifications_none,
        color: colorOff,
      ),
      onTurnOn: () async {
        bool confirmation =
            await _showConfirmationDialog(context, true, controller);
        // if (confirmation) {
        //   return _scheduleNotification(controller);
        // }
        return confirmation;
      },
      onTurnOff: () {
        return _showConfirmationDialog(context, false, controller)
            .then((confirmation) {
          // if (confirmation) {
          //   return _removeNotification(controller);
          // }
          return confirmation;
        });
      },
    );
  }

  Future<bool> _removeNotification(
      CollectDayNotificationController controller) {
    return controller
        .removeNotificationFor(_collectRoute.id)
        .then((value) => true)
        .catchError(_handleError);
  }

  Future<bool> _scheduleNotification(
      CollectDayNotificationController controller) {
    return controller
        .scheduleNotification(this._collectRoute)
        .then((value) => true)
        .catchError(_handleError);
  }

  _handleError(e, stackTrace) {
    debugPrint(e.toString());
    debugPrintStack(stackTrace: stackTrace);
    return false;
  }

  Future<bool> _showConfirmationDialog(BuildContext context, bool activation,
      CollectDayNotificationController controller) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return activation
            ? NotificationActivationDialog(
                onConfirm: () {
                  return _scheduleNotification(controller);
                },
              )
            : NotificationDeactivationDialog(
                onConfirm: () {
                  return _removeNotification(controller);
                },
              );
      },
    );
  }
}
