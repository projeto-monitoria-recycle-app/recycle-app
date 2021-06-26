import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recycle_app/controllers/collect_day_notification_controller.dart';

class NotificationCounter extends StatelessWidget {
  final Function() onTap;

  const NotificationCounter({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectDayNotificationController controller =
        Provider.of<CollectDayNotificationController>(context);

    return FutureBuilder<Set<int>>(
      future: controller.getActiveCollectRouteNotificationsIds(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InkWell(
              onTap: onTap ?? () {},
              child: _buildCounter(snapshot.data.length.toString()));
        }
        return _buildCounter("");
      },
    );
  }

  Widget _buildCounter(String notificationQuantity) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(notificationQuantity.toString()),
        Icon(Icons.notifications_none, color: Colors.black54)
      ],
    );
  }
}
