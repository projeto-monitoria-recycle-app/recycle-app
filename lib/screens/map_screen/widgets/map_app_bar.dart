import 'package:flutter/material.dart';

class MapAppBar extends StatelessWidget {
  const MapAppBar({
    Key key,
    @required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth - 10,
      height: 54,
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            "Ecoponto",
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}