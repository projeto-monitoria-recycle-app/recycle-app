import 'package:flutter/material.dart';

import 'package:flutter/rendering.dart';
import 'package:recycle_app/models/materialModel.dart';
import 'package:url_launcher/url_launcher.dart';

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
            padding: EdgeInsets.only(
              top: 8,
              right: 8,
              left: 8,
            ),
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
                  title: Text(
                    waste.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  expandedHeight: 160,
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
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            Hero(
                              tag: waste.name,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                width: 75,
                                height: 75,
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  width: screenWidth * 0.6,
                                  child: Text(
                                    waste.content[1],
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
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
                                    style:
                                        Theme.of(context).textTheme.headline2,
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
                                            child: Text(
                                              step,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),
                            waste.hints.isEmpty
                                ? SizedBox.shrink()
                                : Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    elevation: 2,
                                    color: waste.color,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Dica:',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 20,
                                            ),
                                            child: Column(
                                              children: [
                                                Text(
                                                  waste.hints[0][0],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                  textAlign: TextAlign.justify,
                                                ),
                                                SizedBox(
                                                  height: 6,
                                                ),
                                                Text(
                                                  waste.hints[0][1],
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1,
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Center(
                                            child: TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.white),
                                              ),
                                              onPressed: () async {
                                                String _url = waste.links[0][1];
                                                await canLaunch(_url)
                                                    ? await launch(_url)
                                                    : throw 'Could not launch .';
                                              },
                                              child: Text(waste.links[0][0]),
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
                                    "IMPACTOS",
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.headline2,
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
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1,
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
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ],
                              ),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              children: [
                                for (String item in waste.recyclable.split(","))
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "ITENS NÃO RECICLÁVEIS",
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                ],
                              ),
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
                                      child: Text(item,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1),
                                    ),
                                  ),
                              ],
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
