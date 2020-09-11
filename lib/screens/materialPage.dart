import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recicle_app/models/materialModel.dart';

class MaterialWastePage extends StatelessWidget {
  static const routeName = '/material';

  @override
  Widget build(BuildContext context) {
    final Waste waste = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: waste.color,
        title: Text(waste.name),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              waste.title,
              style: TextStyle(
                  color: waste.color,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            for (String item in waste.content)
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Text(
                  item,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            Expanded(
              child: SvgPicture.asset(waste.images[0]),
            ),
          ],
        ),
      ),
    );
  }
}
