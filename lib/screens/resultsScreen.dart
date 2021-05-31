import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:recycle_app/models/collectRouteModel.dart';
import 'package:recycle_app/models/collectPointModel.dart';
import 'package:recycle_app/widgets/chartResults.dart';

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
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(5),
              sliver: SliverAppBar(
                title: Text('Resultados'),
                centerTitle: true,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                pinned: true,
                backgroundColor: Theme.of(context).accentColor,
                expandedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  background: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Veja os resultados do projeto de reciclagem na cidade de Teresópolis',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle2,
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
                    // Text(
                    //   'Veja os resultados do projeto de reciclagem na cidade de Teresópolis',
                    //   style: TextStyle(
                    //     fontSize:  18,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    SizedBox(
                      height: 15,
                    ),

                    Column(
                      children: [
                        Text(
                          'MATERIAIS RECICLADOS - KG/MÊS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800]),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800]),
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
                    Text(
                      'NÚMERO DE PARTICIPANTES',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: ImageIcon(
                                  AssetImage(
                                      "assets/icons/icons8-user-groups-100.png"),
                                  size: 50,
                                  color: Colors.grey[900],
                                )),
                            Column(
                              children: [
                                Text(
                                  "4 Empresas Apoiando",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "14 Colaboradores",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "20 Catadores Registrados",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  "+200 Moradores Reciclando",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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
    );
  }
}
