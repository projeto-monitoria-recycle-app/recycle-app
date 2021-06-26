import 'package:flutter/material.dart';
import 'package:recycle_app/models/collect_point_model.dart';

class CollectPointHorizontalList extends StatelessWidget {
  const CollectPointHorizontalList({
    Key key,
    @required this.collectPoints,
  }) : super(key: key);

  final List<CollectPoint> collectPoints;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      addAutomaticKeepAlives: false,
      scrollDirection: Axis.horizontal,
      itemCount: collectPoints.length,
      itemBuilder: (context, index) {
        var name = collectPoints[index].name;
        var district = collectPoints[index].route.district;
        var image = collectPoints[index].image;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/map',
                    arguments:
                    collectPoints[index],
                  );
                },
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 90,
                            height: 110,
                            child: Image.asset(image,
                                fit: BoxFit.cover),
                          ),
                          Positioned(
                            bottom: 7,
                            right: 7,
                            child: Icon(
                              Icons.location_on,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: Icon(
                                Icons.location_on,
                                size: 24,
                                color: Theme.of(context)
                                    .accentColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              district,
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
            Text(
              name,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                color: Colors.grey[600],
              ),
              overflow: TextOverflow.fade,
            ),
          ],
        );
      },
    );
  }
}