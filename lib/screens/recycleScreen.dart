import 'package:flutter/material.dart';
import 'package:recicle_app/models/collectPointModel.dart';

class RecycleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'PONTOS DE COLETA',
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
                            // padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/img/logo-prefeitura.png',
                                  // fit: BoxFit.fill,
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
    );
  }
}
