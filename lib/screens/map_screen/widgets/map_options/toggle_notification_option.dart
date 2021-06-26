import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/controllers/collectDayNotificationController.dart';
import 'package:recycle_app/models/collect_point_model.dart';
import 'package:recycle_app/widgets/toggle_collect_day_notification_button.dart';

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
            child: Text(
              isNotificationActive
                  ? "Desativar notificação"
                  : "Ativar notificação",
              style: Theme.of(context).textTheme.bodyText1,
            ),
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