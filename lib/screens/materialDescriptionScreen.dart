import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:recicle_app/models/materialModel.dart';

class MaterialWasteScreen extends StatelessWidget {
  static const routeName = '/material';

  @override
  Widget build(BuildContext context) {
    final Waste waste = ModalRoute.of(context).settings.arguments;
    final double screenWidth = MediaQuery.of(context).size.width;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return false;
      },
      child: Material(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(8),
            color: Colors.grey[100],
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  pinned: true,
                  floating: true,
                  snap: true,
                  title: Text(waste.name),
                  expandedHeight: 200,
                  backgroundColor: waste.color,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: screenWidth * 0.5,
                              child: Text(
                                waste.content[0],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Hero(
                              tag: waste.name,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: waste.color,
                                ),
                                child: ImageIcon(
                                  waste.icon,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: waste.color,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.7,
                                  child: Text(
                                    waste.content[1],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "COMO DESCARTAR " +
                                        waste.name.toUpperCase(),
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: List.generate(waste.discart.length,
                                      (index) {
                                    var step = waste.discart[index];
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            (index + 1).toString() + ".",
                                            style: TextStyle(
                                              color: waste.color,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            // width: screenWidth * 0.7,
                                            child: Text(step),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "IMPACTOS",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    for (var impact in waste.impacts)
                                      Container(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                  "assets/icons/${impact[0]}.png"),
                                              size: 40,
                                              color: waste.color,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Text(
                                                impact[1],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "ITENS RECICLÁVEIS",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [],
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      for (String item
                                          in waste.recyclable.split(","))
                                        Card(
                                          elevation: 0,
                                          color: waste.color,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    "ITENS NÃO RECICLÁVEIS",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [],
                                  ),
                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      for (String item
                                          in waste.notRecyclable.split(","))
                                        Card(
                                          elevation: 0,
                                          color: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
