import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recicle_app/controllers/collectDayNotificationController.dart';
import 'package:recicle_app/models/collectRouteModel.dart';
import 'package:recicle_app/widgets/toggleButtonWidget.dart';

import 'notificationDialogWidget.dart';

class ToggleNotificationButton extends StatelessWidget {
  final CollectRoute _collectRoute;
  final bool initialButtonState;

  ToggleNotificationButton(
    this._collectRoute, {
    Key key,
    this.initialButtonState,
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
        color: Theme.of(context).primaryColor,
      ),
      iconOff: Icon(
        Icons.notifications_none,
      ),
      onTurnOn: () async {
        bool confirmation = await _showConfirmationDialog(context, true);
        if (confirmation) {
          return _scheduleNotification(controller);
        }
        return confirmation;
      },
      onTurnOff: () {
        return _showConfirmationDialog(context, false).then((confirmation) {
          if (confirmation) {
            return _removeNotification(controller);
          }
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

  Future<bool> _showConfirmationDialog(
      BuildContext context, bool activation) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return activation
            ? NotificationActivationDialog()
            : NotificationDeactivationDialog();
      },
    );
  }
}
