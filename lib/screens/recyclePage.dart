import 'package:flutter/material.dart';
import 'package:recicle_app/models/wasteModel.dart';

class RecyclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(wasteList.length, (index) {
        var material = wasteList[index].material;
        return Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: wasteList[index].color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$material',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }
}
