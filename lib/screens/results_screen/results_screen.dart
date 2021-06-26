import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:recycle_app/models/collect_route_model.dart';
import 'package:recycle_app/models/collect_point_model.dart';

import 'chart_results.dart';

class ResultsScreen extends StatelessWidget {
  static const routeName = '/results';

  @override
  Widget build(BuildContext context) {
    Set<String> districts =
        new Set<String>.from(collectRouteList.map((e) => e.district));
    double screenWidth = MediaQuery.of(context).size.width;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return false;
      },
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(right: 8, left: 8),
                sliver: SliverAppBar(
                  title: Text(
                    'Resultados',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  centerTitle: true,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  pinned: true,
                  backgroundColor: Theme.of(context).accentColor,
                  expandedHeight: 120,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Veja os resultados do projeto de reciclagem na cidade de Teresópolis',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Column(
                        children: [
                          Text(
                            'MATERIAIS RECICLADOS - KG/MÊS',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Card(
                            child: Container(
                              width: screenWidth * .9,
                              height: screenWidth * .8,
                              child: BarChartSample2(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'TOTAL DE ECOPONTOS',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Card(
                                  child: Container(
                                    height: 60,
                                    width: screenWidth * .40,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: ImageIcon(
                                              AssetImage(
                                                  "assets/icons/waste.png"),
                                              size: 40,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          Text(
                                            collectPointList.length.toString(),
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF09995C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'BAIRROS ATENDIDOS',
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Card(
                                  child: Container(
                                    height: 60,
                                    width: screenWidth * .40,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: ImageIcon(
                                              AssetImage(
                                                  "assets/icons/icons8-caminhão-de-lixo-100.png"),
                                              size: 40,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          Text(
                                            districts.length.toString(),
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF09995C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
