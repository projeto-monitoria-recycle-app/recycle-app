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
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overScroll) {
        overScroll.disallowGlow();
        return false;
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            title: Text('Coleta Seletiva'),
            expandedHeight: 170,
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
                      hint: Text(
                        'Selecione o Bairro',
                        style: TextStyle(
                          color: Theme.of(context).accentColor.withOpacity(0.5),
                        ),
                      ),
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
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  height: 270,
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
                      Text("Clique no card para ver o ponto no mapa."),
                      Container(
                        height: 180,
                        child: ListView.builder(
                            addAutomaticKeepAlives: false,
                            scrollDirection: Axis.horizontal,
                            itemCount: filteredCollectPointList.length,
                            itemBuilder: (context, index) {
                              var name = filteredCollectPointList[index].name;
                              var address =
                                  filteredCollectPointList[index].adreess;
                              var district =
                                  filteredCollectPointList[index].district;
                              return Column(
                                children: [
                                  Text(
                                    district,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
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
                                            height: 150,
                                            child: Column(
                                              children: [
                                                Container(
                                                  color: Colors.grey[200],
                                                  // height: 140,
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
                                                          fontSize: 12,
                                                        ),
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
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    addAutomaticKeepAlives: false,
                    itemCount: filteredCollectRouteList.length,
                    itemBuilder: (context, index) {
                      var dayOfWeek = filteredCollectRouteList[index].dayOfWeek;
                      var hour = filteredCollectRouteList[index].hour.hour;
                      var minute = filteredCollectRouteList[index].hour.minute;
                      var location = filteredCollectRouteList[index].location;
                      var district = filteredCollectRouteList[index].district;

                      return Card(
                        child: ListTile(
                          title: Text(location),
                          subtitle: Text(
                              "Bairro: $district - $dayOfWeek - $hour:$minute "),
                        ),
                      );
                    },
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
