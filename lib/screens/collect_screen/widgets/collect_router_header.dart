import 'package:flutter/material.dart';
import 'package:recycle_app/screens/collect_screen/widgets/active_notifications_bottom_sheet.dart';
import 'package:recycle_app/screens/collect_screen/widgets/notification_counter.dart';

class CollectRouterHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    NotificationCounter notificationCounter = NotificationCounter(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return ActiveNotificationsBottomSheet();
            });
      },
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ROTAS DE COLETA SELETIVA',
            style: Theme.of(context).textTheme.headline2,
          ),
          notificationCounter
        ],
      ),
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 30;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}