import 'package:flutter/material.dart';
import 'package:recicle_app/models/collectPointModel.dart';
import 'package:recicle_app/models/collectRouteModel.dart';
import 'package:recicle_app/screens/mapPage.dart';

class RecycleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const List<String> districtList = [
      "Alto",
      "Agriões",
      "Barra do Imbuí",
      "Pimenteiras"
    ];

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          title: Text('Coleta Seletiva'),
          expandedHeight: 180,
          backgroundColor: Theme.of(context).accentColor,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Descubra os pontos de coleta próximos a você.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 200,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: DropdownButton(
                    style: TextStyle(color: Colors.grey[700]),
                    items: List.generate(
                      districtList.length,
                      (index) => DropdownMenuItem(
                        child: Text(districtList[index]),
                      ),
                    ),
                    onChanged: (value) {
                      print(value);
                    },
                    hint: Text('Selecione seu Bairro'),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
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
                                FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GMap()));
                                  },
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 200,
                                          child: Column(
                                            children: [
                                              Container(
                                                color: Colors.grey[200],
                                                height: 150,
                                                child: Image.asset(
                                                    'assets/img/ecopontos.jpg',
                                                    fit: BoxFit.cover),
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      name,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                  clipBehavior: Clip.antiAlias,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 150,
                                        height: 200,
                                        child: Column(
                                          children: [
                                            Container(
                                              color: Colors.grey[200],
                                              height: 150,
                                              child: Image.asset(
                                                'assets/img/caminhao-coleta.jpg',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "$dayOfWeek-$hour:$minute",
                                                    overflow: TextOverflow.fade,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
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
        ),
      ],
    );
  }
}
