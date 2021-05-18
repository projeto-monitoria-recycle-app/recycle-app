import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recicle_app/controllers/collectDayNotificationController.dart';
import 'package:recicle_app/models/collectRouteModel.dart';
import 'package:recicle_app/widgets/collectRouteListItem.dart';

class ActiveNotificationsBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectDayNotificationController controller =
    Provider.of<CollectDayNotificationController>(context);
    return FutureBuilder<List<CollectRoute>>(
        future: controller.getCollectRoutesWithActiveNotifications(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DraggableScrollableSheet(
              maxChildSize: 0.95,
              initialChildSize: 0.95,
              minChildSize: 0.05,
              builder: (context, scrollController) {
                return ListView.builder(
                    itemCount: snapshot.data.length+1,
                    itemBuilder: (context, index) {
                      if(index == 0){
                        return  Center(
                          child: Text(
                            'ROTAS COM NOTIFICAÇÃO ATIVA',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                          ),
                        );
                      }
                      return CollectRouteListItem(
                        snapshot.data[index-1],
                        initialButtonState: true,
                      );
                    });
              },
            );
          }
          return Container(child: CircularProgressIndicator());
        });
  }
}
