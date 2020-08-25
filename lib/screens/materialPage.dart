import 'package:flutter/material.dart';
import 'package:recicle_app/models/wasteModel.dart';

class WasteMaterialPage extends StatelessWidget {
  static const routeName = '/material';

  @override
  Widget build(BuildContext context) {
    final Waste waste = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: waste.color,
        title: Text(waste.material),
        actions: [
          ImageIcon(
            waste.icon,
            size: 40,
          ),
          Container(
            width: 40,
          )
        ],
      ),
    );
  }
}
