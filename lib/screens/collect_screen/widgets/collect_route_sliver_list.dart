import 'package:flutter/material.dart';
import 'package:recycle_app/models/collect_route_model.dart';
import 'package:recycle_app/screens/collect_screen/widgets/collect_route_list_item.dart';

class CollectRouteSliverList extends StatelessWidget {
  final List<CollectRoute> filteredCollectRouteList;
  final Set<int> ids = Set();

  CollectRouteSliverList(
      this.filteredCollectRouteList, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
          List.generate(filteredCollectRouteList.length, (index) {
            var collectRoute = filteredCollectRouteList[index];
            return CollectRouteListItem(
              collectRoute,
            );
          })),
    );
  }
}