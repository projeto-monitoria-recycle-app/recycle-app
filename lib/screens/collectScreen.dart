import 'package:flutter/material.dart';
import 'package:recicle_app/models/collectPointModel.dart';
import 'package:recicle_app/models/collectRouteModel.dart';

class RecycleScreen extends StatefulWidget {
  @override
  _RecycleScreenState createState() => _RecycleScreenState();
}

class _RecycleScreenState extends State<RecycleScreen> {
  String selectedDistrict;
  List<String> districtList = ['Todos Bairros'];
  List<CollectPoint> filteredCollectPointList =
      new List<CollectPoint>.from(collectPointList);
  List<CollectRoute> filteredCollectRouteList =
      new List<CollectRoute>.from(collectRouteList);

  void filterPointList(
    String district,
  ) {
    filteredCollectPointList.clear();
    collectPointList.forEach(
      (element) {
        print(element);
        if (element.district == district) {
          filteredCollectPointList.add(element);
        }
      },
    );
  }

  void filterRouteList(String district) {
    filteredCollectRouteList.clear();
    collectRouteList.forEach(
      (element) {
        print(element);
        if (element.district == district) {
          filteredCollectRouteList.add(element);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();

    collectRouteList.sort((a, b) => a.district.compareTo(b.district));

    Set<String> districts =
        new Set<String>.from(collectRouteList.map((e) => e.district));

    districts.forEach((element) {
      districtList.add(element);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          snap: true,
          title: Text('Coleta Seletiva'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.access_alarm,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  districtList.add("Friburgo");
                  // collectPointList.forEach((element) {
                  //   filteredCollectPointList.add(element);
                  // });
                  print(filteredCollectPointList.length);
                  print(collectPointList.length);
                });
              },
            ),
          ],
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
                  child: DropdownButton<String>(
                    style: TextStyle(color: Colors.grey[700]),
                    hint: Text('Selecione o Bairro'),
                    value: selectedDistrict,
                    onChanged: (String newValue) {
                      setState(() {
                        selectedDistrict = newValue;
                        filterPointList(selectedDistrict);
                        filterRouteList(selectedDistrict);
                        if (selectedDistrict == "Todos Bairros") {
                          collectPointList.forEach((element) {
                            filteredCollectPointList.add(element);
                          });
                          collectRouteList.forEach((element) {
                            filteredCollectRouteList.add(element);
                          });
                        }
                        print(selectedDistrict);
                      });
                    },
                    items: districtList
                        .map<DropdownMenuItem<String>>((String district) {
                      return DropdownMenuItem<String>(
                        value: district,
                        child: Text(district),
                      );
                    }).toList(),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ECOPONTOS',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800]),
                        ),
                        Text('ver todos')
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          filteredCollectPointList.length,
                          (index) {
                            var name = filteredCollectPointList[index].name;
                            var address =
                                filteredCollectPointList[index].adreess;
                            var district =
                                filteredCollectPointList[index].district;

                            return Column(
                              children: [
                                FlatButton(
                                  padding: EdgeInsets.all(0),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/map',
                                      arguments:
                                          filteredCollectPointList[index],
                                    );
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
                                      fontSize: 16,
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
                          filteredCollectRouteList.length,
                          (index) {
                            var dayOfWeek =
                                filteredCollectRouteList[index].dayOfWeek;
                            var hour =
                                filteredCollectRouteList[index].hour.hour;
                            var minute =
                                filteredCollectRouteList[index].hour.minute;
                            var location =
                                filteredCollectRouteList[index].location;
                            var district =
                                filteredCollectRouteList[index].district;

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
