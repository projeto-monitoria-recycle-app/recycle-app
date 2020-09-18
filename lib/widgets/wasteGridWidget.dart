import 'package:flutter/material.dart';
import 'package:recicle_app/models/materialModel.dart';

class WasteGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 2,
      children: List.generate(
        wasteList.length,
        (index) {
          var material = wasteList[index].name;
          var icon = wasteList[index].icon;
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                "/material",
                arguments: wasteList[index],
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                color: wasteList[index].color,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$material',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ImageIcon(
                    icon,
                    color: Colors.white,
                    size: 70,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
