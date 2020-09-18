import 'package:flutter/material.dart';
import 'package:recicle_app/models/collectPointModel.dart';
import 'package:recicle_app/models/collectRouteModel.dart';

class RecycleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            height: 270,
            // color: Colors.red[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      'ECOPONTOS',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      collectPointList.length,
                      (index) {
                        var name = collectPointList[index].name;
                        var address = collectPointList[index].adreess;
                        var district = collectPointList[index].district;

                        return Column(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.grey[100],
                                    width: 150,
                                    height: 200,
                                    child: Column(
                                      children: [
                                        Container(
                                          color: Colors.grey[200],
                                          height: 150,
                                          child: Image.asset(
                                            'assets/img/logo-prefeitura.png',
                                            // fit: BoxFit.fill,
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                name,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(address),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              district,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            height: 270,
            // color: Colors.red[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      'ROTAS DE COLETA SELETIVA',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      collectRouteList.length,
                      (index) {
                        var dayOfWeek = collectRouteList[index].dayOfWeek;
                        var hour = collectRouteList[index].hour.hour;
                        var minute = collectRouteList[index].hour.minute;
                        var location = collectRouteList[index].location;
                        var district = collectRouteList[index].district;

                        return Column(
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.grey[100],
                                    width: 150,
                                    height: 200,
                                    child: Column(
                                      children: [
                                        Container(
                                          color: Colors.grey[200],
                                          height: 150,
                                          child: Image.asset(
                                            'assets/img/logo-prefeitura.png',
                                            // fit: BoxFit.fill,
                                          ),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "$dayOfWeek-$hour:$minute",
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                location,
                                                overflow: TextOverflow.fade,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              district,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).accentColor),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
