import 'package:flutter/material.dart';
import 'package:recicle_app/models/wasteModel.dart';

class WasteGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        children: List.generate(wasteList.length, (index) {
          var material = wasteList[index].material;
          var icon = wasteList[index].icon;
          return Container(
            padding: EdgeInsets.all(10),
            height: 80,
            decoration: BoxDecoration(
              color: wasteList[index].color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$material',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: ImageIcon(
                    icon,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "/material",
                      arguments: wasteList[index],
                    );
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
