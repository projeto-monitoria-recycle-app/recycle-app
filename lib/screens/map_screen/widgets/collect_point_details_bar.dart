import 'package:flutter/material.dart';
import 'package:recycle_app/controllers/collectDayNotificationController.dart';
import 'package:recycle_app/models/collectPointModel.dart';
import 'package:recycle_app/widgets/toggleCollectDayNotificationButton.dart';

class CollectPointDetailsBar extends StatelessWidget {

  final double screenWidth;
  final CollectPoint collectPoint;
  final CollectDayNotificationController controller;

  const CollectPointDetailsBar({Key key, this.screenWidth, this.collectPoint, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        color: Colors.white,
      ),
      width: screenWidth - 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                collectPoint.name,
                style: Theme.of(context).textTheme.headline2,
              ),
              Text(
                _truncateString(
                  collectPoint.route.location,
                  26,
                  truncatedSuffix: "...",
                ),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
          if (collectPoint.route.id != null)
            FutureBuilder<Set<int>>(
              future: controller
                  .getActiveCollectRouteNotificationsIds(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  bool isNotificationActive = snapshot.data
                      .contains(collectPoint.route.id);
                  return ToggleNotificationButton(
                    collectPoint.route,
                    initialButtonState: isNotificationActive,
                    colorOn: Colors.black26,
                    colorOff: Colors.black26,
                  );
                }
                return Container(
                    child: CircularProgressIndicator());
              },
            ),
          InkWell(
            child: Hero(
              tag: "imagem",
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                    )
                  ],
                  color: Colors.grey,
                ),
                width: 50,
                height: 50,
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  collectPoint.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/photo",
                  arguments: collectPoint.image);
            },
          )
        ],
      ),
    );
  }

  String _truncateString(String string, int maxLength,
      {String truncatedSuffix}) {
    return string.length > maxLength
        ? string.substring(0, maxLength) + truncatedSuffix ?? ""
        : string;
  }
}
